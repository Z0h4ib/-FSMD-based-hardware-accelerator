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
  val sInit :: sCheckBorder :: sProcessInner :: sCheckNeighbors :: sUpdateCoords :: sDone :: Nil = Enum(6)
  val state = RegInit(sInit)

  // Registers
  val x = RegInit(0.U(8.W)) // X-coordinate
  val y = RegInit(0.U(8.W)) // Y-coordinate
  val inputPixel = Reg(UInt(32.W)) // Full 32-bit pixel read
  val outputPixel = Reg(UInt(32.W))

  // Memory signals
  io.address := (y * 20.U + x) // Address calculation for 20x20 image
  io.dataWrite := outputPixel
  io.writeEnable := false.B
  io.done := false.B

  switch(state) {
    is(sInit) {
      x := 0.U
      y := 0.U
      state := sCheckBorder
    }

    is(sCheckBorder) {
      when(x === 0.U || y === 0.U || x === 19.U || y === 19.U) {
        outputPixel := 0.U // Border pixel
        io.writeEnable := true.B
        state := sUpdateCoords
      }.otherwise {
        inputPixel := io.dataRead // Load pixel data
        state := sProcessInner
      }
    }

    is(sProcessInner) {
      when(inputPixel(7, 0) === 0.U) { // Check lower 8 bits for black pixel
        outputPixel := 0.U // Black pixel
        io.writeEnable := true.B
        state := sUpdateCoords
      }.otherwise {
        state := sCheckNeighbors
      }
    }

    is(sCheckNeighbors) {
      val neighbors = Wire(Vec(4, Bool()))
      neighbors(0) := inputPixel(15, 8) === 0.U // Top neighbor
      neighbors(1) := inputPixel(23, 16) === 0.U // Bottom neighbor
      neighbors(2) := inputPixel(31, 24) === 0.U // Left neighbor
      neighbors(3) := inputPixel(7, 0) === 0.U  // Right neighbor

      when(neighbors.reduce(_ || _)) {
        outputPixel := 0.U // Erode
      }.otherwise {
        outputPixel := "hFFFFFF".U // Keep white (all bits set)
      }
      io.writeEnable := true.B
      state := sUpdateCoords
    }

    is(sUpdateCoords) {
      when(x === 19.U) {
        x := 0.U
        y := y + 1.U
      }.otherwise {
        x := x + 1.U
      }
      when(y === 19.U && x === 19.U) {
        state := sDone
      }.otherwise {
        state := sCheckBorder
      }
    }

    is(sDone) {
      io.done := true.B
      when(!io.start) {
        state := sInit
      }
    }
  }
}
