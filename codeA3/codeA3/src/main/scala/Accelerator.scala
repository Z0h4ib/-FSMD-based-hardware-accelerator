import chisel3._
import chisel3.util._

class Accelerator extends Module {
  val io = IO(new Bundle {
    val start = Input(Bool())
    val done = Output(Bool())

    val address = Output(UInt(16.W))
    val dataRead = Input(UInt(32.W))
    val writeEnable = Output(Bool())
    val dataWrite = Output(UInt(32.W))
  })

  // State definitions
  val sIdle :: sRead :: sProcess :: sWrite :: sUpdateCoords :: sDone :: Nil = Enum(6)
  val state = RegInit(sIdle)

  // Registers
  val x = RegInit(0.U(5.W)) // X-coordinate (5 bits for 20 max)
  val y = RegInit(0.U(5.W)) // Y-coordinate (5 bits for 20 max)
  val inputPixel = Reg(UInt(32.W)) // Pixel being processed
  val outputPixel = Reg(UInt(32.W)) // Processed pixel

  // Memory connections
  io.address := 0.U
  io.dataWrite := 0.U
  io.writeEnable := false.B
  io.done := false.B

  // Helper function to calculate memory address
  def addr(x: UInt, y: UInt): UInt = y * 20.U + x

  // FSMD
  switch(state) {
    is(sIdle) {
      when(io.start) {
        x := 0.U
        y := 0.U
        state := sRead
      }
    }

    is(sRead) {
      io.address := addr(x, y) // Read pixel at current (x, y)
      inputPixel := io.dataRead
      state := sProcess
    }

    is(sProcess) {
      when(x === 0.U || y === 0.U || x === 19.U || y === 19.U) {
        // Border pixels are always set to black
        outputPixel := 0.U
      }.otherwise {
        // Check neighbors for inner pixels
        val top = io.dataRead // Memory at (x, y-1)
        val bottom = io.dataRead // Memory at (x, y+1)
        val left = io.dataRead // Memory at (x-1, y)
        val right = io.dataRead // Memory at (x+1, y)

        // Check erosion condition
        when(inputPixel === 255.U && (top === 0.U || bottom === 0.U || left === 0.U || right === 0.U)) {
          outputPixel := 0.U // Erode to black
        }.otherwise {
          outputPixel := 255.U // Remain white
        }
      }
      state := sWrite
    }

    is(sWrite) {
      io.address := addr(x, y) + 400.U // Write to output address
      io.dataWrite := outputPixel
      io.writeEnable := true.B
      state := sUpdateCoords
    }

    is(sUpdateCoords) {
      // Update coordinates
      when(x === 19.U) {
        x := 0.U
        y := y + 1.U
      }.otherwise {
        x := x + 1.U
      }
      // Check if finished
      when(y === 19.U && x === 19.U) {
        state := sDone
      }.otherwise {
        state := sRead
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
