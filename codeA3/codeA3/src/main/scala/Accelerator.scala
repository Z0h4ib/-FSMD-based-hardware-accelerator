import chisel3._
import chisel3.util._

class Accelerator extends Module {
  val io = IO(new Bundle {
    val start = Input(Bool())
    val done = Output(Bool())
    val address = Output(UInt(16.W))
    val dataRead = Input(UInt(8.W)) // Using 8-bit pixels
    val writeEnable = Output(Bool())
    val dataWrite = Output(UInt(8.W)) // Writing 8-bit pixels
  })

  // State Definitions
  val sIdle :: sLoadRow :: sProcessPixel :: sWritePixel :: sUpdateCoords :: sDone :: Nil = Enum(6)
  val state = RegInit(sIdle)

  // Registers
  val x = RegInit(0.U(5.W)) // X-coordinate
  val y = RegInit(0.U(5.W)) // Y-coordinate
  val rowBuffer = RegInit(VecInit(Seq.fill(3)(VecInit(Seq.fill(20)(255.U(8.W)))))) // Initialized as white (255)
  val outputPixel = RegInit(255.U(8.W)) // Default to white (255)

  // Memory connections
  io.address := 0.U
  io.dataWrite := 0.U
  io.writeEnable := false.B
  io.done := false.B

  // Helper function for memory address calculation
  def addr(x: UInt, y: UInt): UInt = y * 20.U + x

  switch(state) {
    is(sIdle) {
      when(io.start) {
        x := 0.U
        y := 0.U
        state := sLoadRow
      }
    }

    is(sLoadRow) {
      // Shift rows in the buffer
      when(x === 0.U) {
        rowBuffer(0) := rowBuffer(1)
        rowBuffer(1) := rowBuffer(2)
      }
      // Load the next row into the buffer
      io.address := addr(x, y + 1.U)
      rowBuffer(2)(x) := io.dataRead

      when(x === 19.U) {
        x := 0.U
        state := sProcessPixel
      }.otherwise {
        x := x + 1.U
      }
    }

    is(sProcessPixel) {
      when(x === 0.U || y === 0.U || x === 19.U || y === 19.U) {
        // Border pixels are always black in the output
        outputPixel := 0.U
      }.otherwise {
        // Access neighboring pixels
        val top = rowBuffer(0)(x)
        val bottom = rowBuffer(2)(x)
        val left = rowBuffer(1)(Mux(x === 0.U, 0.U, x - 1.U)) // Prevent underflow
        val right = rowBuffer(1)(Mux(x === 19.U, 19.U, x + 1.U)) // Prevent overflow

        // Apply erosion logic
        val isEroded = (top === 0.U) || (bottom === 0.U) || (left === 0.U) || (right === 0.U)
        outputPixel := Mux(isEroded, 0.U, 255.U)
      }
      state := sWritePixel
    }

    is(sWritePixel) {
      // Write the processed pixel to memory
      io.address := addr(x, y) + 400.U // Offset output image
      io.dataWrite := outputPixel
      io.writeEnable := true.B
      state := sUpdateCoords
    }

    is(sUpdateCoords) {
      io.writeEnable := false.B // Disable write to prevent spurious writes
      when(x === 19.U) {
        x := 0.U
        y := y + 1.U
        state := Mux(y === 18.U, sDone, sLoadRow) // Stop loading rows after the last processable row
      }.otherwise {
        x := x + 1.U
        state := sProcessPixel
      }
    }

    is(sDone) {
      io.done := true.B
      when(!io.start) {
        state := sIdle
      }
    }
  }
}
