module DataMemory(
  input         clock,
  input  [15:0] io_address,
  output [31:0] io_dataRead,
  input         io_writeEnable,
  input  [31:0] io_dataWrite,
  input         io_testerEnable,
  input  [15:0] io_testerAddress,
  output [31:0] io_testerDataRead,
  input         io_testerWriteEnable,
  input  [31:0] io_testerDataWrite
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
  reg [31:0] memory [0:65535]; // @[DataMemory.scala 18:20]
  wire [31:0] memory__T_data; // @[DataMemory.scala 18:20]
  wire [15:0] memory__T_addr; // @[DataMemory.scala 18:20]
  wire [31:0] memory__T_2_data; // @[DataMemory.scala 18:20]
  wire [15:0] memory__T_2_addr; // @[DataMemory.scala 18:20]
  wire [31:0] memory__T_1_data; // @[DataMemory.scala 18:20]
  wire [15:0] memory__T_1_addr; // @[DataMemory.scala 18:20]
  wire  memory__T_1_mask; // @[DataMemory.scala 18:20]
  wire  memory__T_1_en; // @[DataMemory.scala 18:20]
  wire [31:0] memory__T_3_data; // @[DataMemory.scala 18:20]
  wire [15:0] memory__T_3_addr; // @[DataMemory.scala 18:20]
  wire  memory__T_3_mask; // @[DataMemory.scala 18:20]
  wire  memory__T_3_en; // @[DataMemory.scala 18:20]
  wire [31:0] _GEN_5 = io_testerWriteEnable ? io_testerDataWrite : memory__T_data; // @[DataMemory.scala 27:32]
  wire [31:0] _GEN_11 = io_writeEnable ? io_dataWrite : memory__T_2_data; // @[DataMemory.scala 37:26]
  assign memory__T_addr = io_testerAddress;
  assign memory__T_data = memory[memory__T_addr]; // @[DataMemory.scala 18:20]
  assign memory__T_2_addr = io_address;
  assign memory__T_2_data = memory[memory__T_2_addr]; // @[DataMemory.scala 18:20]
  assign memory__T_1_data = io_testerDataWrite;
  assign memory__T_1_addr = io_testerAddress;
  assign memory__T_1_mask = 1'h1;
  assign memory__T_1_en = io_testerEnable & io_testerWriteEnable;
  assign memory__T_3_data = io_dataWrite;
  assign memory__T_3_addr = io_address;
  assign memory__T_3_mask = 1'h1;
  assign memory__T_3_en = io_testerEnable ? 1'h0 : io_writeEnable;
  assign io_dataRead = io_testerEnable ? 32'h0 : _GEN_11; // @[DataMemory.scala 26:17 DataMemory.scala 34:17 DataMemory.scala 40:19]
  assign io_testerDataRead = io_testerEnable ? _GEN_5 : 32'h0; // @[DataMemory.scala 24:23 DataMemory.scala 30:25 DataMemory.scala 36:23]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 65536; initvar = initvar+1)
    memory[initvar] = _RAND_0[31:0];
`endif // RANDOMIZE_MEM_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if(memory__T_1_en & memory__T_1_mask) begin
      memory[memory__T_1_addr] <= memory__T_1_data; // @[DataMemory.scala 18:20]
    end
    if(memory__T_3_en & memory__T_3_mask) begin
      memory[memory__T_3_addr] <= memory__T_3_data; // @[DataMemory.scala 18:20]
    end
  end
endmodule
module Accelerator(
  input         clock,
  input         reset,
  input         io_start,
  output        io_done,
  output [15:0] io_address,
  input  [31:0] io_dataRead,
  output        io_writeEnable,
  output [31:0] io_dataWrite
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  reg [2:0] state; // @[Accelerator.scala 17:22]
  reg [4:0] x; // @[Accelerator.scala 20:18]
  reg [4:0] y; // @[Accelerator.scala 21:18]
  reg [31:0] inputPixel; // @[Accelerator.scala 22:23]
  reg [31:0] outputPixel; // @[Accelerator.scala 23:24]
  wire  _T = 3'h0 == state; // @[Conditional.scala 37:30]
  wire  _T_1 = 3'h1 == state; // @[Conditional.scala 37:30]
  wire [9:0] _T_2 = y * 5'h14; // @[Accelerator.scala 32:40]
  wire [9:0] _GEN_48 = {{5'd0}, x}; // @[Accelerator.scala 32:47]
  wire [9:0] _T_4 = _T_2 + _GEN_48; // @[Accelerator.scala 32:47]
  wire  _T_5 = 3'h2 == state; // @[Conditional.scala 37:30]
  wire  _T_6 = x == 5'h0; // @[Accelerator.scala 51:14]
  wire  _T_7 = y == 5'h0; // @[Accelerator.scala 51:27]
  wire  _T_8 = _T_6 | _T_7; // @[Accelerator.scala 51:22]
  wire  _T_9 = x == 5'h13; // @[Accelerator.scala 51:40]
  wire  _T_10 = _T_8 | _T_9; // @[Accelerator.scala 51:35]
  wire  _T_11 = y == 5'h13; // @[Accelerator.scala 51:54]
  wire  _T_12 = _T_10 | _T_11; // @[Accelerator.scala 51:49]
  wire  _T_13 = inputPixel == 32'hff; // @[Accelerator.scala 62:25]
  wire  _T_14 = io_dataRead == 32'h0; // @[Accelerator.scala 62:43]
  wire  _T_16 = _T_14 | _T_14; // @[Accelerator.scala 62:51]
  wire  _T_18 = _T_16 | _T_14; // @[Accelerator.scala 62:69]
  wire  _T_20 = _T_18 | _T_14; // @[Accelerator.scala 62:85]
  wire  _T_21 = _T_13 & _T_20; // @[Accelerator.scala 62:35]
  wire [7:0] _GEN_3 = _T_21 ? 8'h0 : 8'hff; // @[Accelerator.scala 62:104]
  wire [7:0] _GEN_4 = _T_12 ? 8'h0 : _GEN_3; // @[Accelerator.scala 51:64]
  wire  _T_22 = 3'h3 == state; // @[Conditional.scala 37:30]
  wire [9:0] _T_27 = _T_4 + 10'h190; // @[Accelerator.scala 72:32]
  wire  _T_28 = 3'h4 == state; // @[Conditional.scala 37:30]
  wire [4:0] _T_31 = y + 5'h1; // @[Accelerator.scala 82:16]
  wire [4:0] _T_33 = x + 5'h1; // @[Accelerator.scala 84:16]
  wire  _T_36 = _T_11 & _T_9; // @[Accelerator.scala 87:23]
  wire  _T_37 = 3'h5 == state; // @[Conditional.scala 37:30]
  wire  _T_38 = ~io_start; // @[Accelerator.scala 96:12]
  wire  _GEN_14 = _T_28 ? 1'h0 : _T_37; // @[Conditional.scala 39:67]
  wire [9:0] _GEN_15 = _T_22 ? _T_27 : 10'h0; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_16 = _T_22 ? outputPixel : 32'h0; // @[Conditional.scala 39:67]
  wire  _GEN_21 = _T_22 ? 1'h0 : _GEN_14; // @[Conditional.scala 39:67]
  wire [9:0] _GEN_24 = _T_5 ? 10'h0 : _GEN_15; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_25 = _T_5 ? 32'h0 : _GEN_16; // @[Conditional.scala 39:67]
  wire  _GEN_26 = _T_5 ? 1'h0 : _T_22; // @[Conditional.scala 39:67]
  wire  _GEN_29 = _T_5 ? 1'h0 : _GEN_21; // @[Conditional.scala 39:67]
  wire [9:0] _GEN_30 = _T_1 ? _T_4 : _GEN_24; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_34 = _T_1 ? 32'h0 : _GEN_25; // @[Conditional.scala 39:67]
  wire  _GEN_35 = _T_1 ? 1'h0 : _GEN_26; // @[Conditional.scala 39:67]
  wire  _GEN_38 = _T_1 ? 1'h0 : _GEN_29; // @[Conditional.scala 39:67]
  wire [9:0] _GEN_42 = _T ? 10'h0 : _GEN_30; // @[Conditional.scala 40:58]
  assign io_done = _T ? 1'h0 : _GEN_38; // @[Accelerator.scala 29:11 Accelerator.scala 95:15]
  assign io_address = {{6'd0}, _GEN_42}; // @[Accelerator.scala 26:14 Accelerator.scala 45:18 Accelerator.scala 72:18]
  assign io_writeEnable = _T ? 1'h0 : _GEN_35; // @[Accelerator.scala 28:18 Accelerator.scala 74:22]
  assign io_dataWrite = _T ? 32'h0 : _GEN_34; // @[Accelerator.scala 27:16 Accelerator.scala 73:20]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  state = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  x = _RAND_1[4:0];
  _RAND_2 = {1{`RANDOM}};
  y = _RAND_2[4:0];
  _RAND_3 = {1{`RANDOM}};
  inputPixel = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  outputPixel = _RAND_4[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      state <= 3'h0;
    end else if (_T) begin
      if (io_start) begin
        state <= 3'h1;
      end
    end else if (_T_1) begin
      state <= 3'h2;
    end else if (_T_5) begin
      state <= 3'h3;
    end else if (_T_22) begin
      state <= 3'h4;
    end else if (_T_28) begin
      if (_T_36) begin
        state <= 3'h5;
      end else begin
        state <= 3'h1;
      end
    end else if (_T_37) begin
      if (_T_38) begin
        state <= 3'h0;
      end
    end
    if (reset) begin
      x <= 5'h0;
    end else if (_T) begin
      if (io_start) begin
        x <= 5'h0;
      end
    end else if (!(_T_1)) begin
      if (!(_T_5)) begin
        if (!(_T_22)) begin
          if (_T_28) begin
            if (_T_9) begin
              x <= 5'h0;
            end else begin
              x <= _T_33;
            end
          end
        end
      end
    end
    if (reset) begin
      y <= 5'h0;
    end else if (_T) begin
      if (io_start) begin
        y <= 5'h0;
      end
    end else if (!(_T_1)) begin
      if (!(_T_5)) begin
        if (!(_T_22)) begin
          if (_T_28) begin
            if (_T_9) begin
              y <= _T_31;
            end
          end
        end
      end
    end
    if (!(_T)) begin
      if (_T_1) begin
        inputPixel <= io_dataRead;
      end
    end
    if (!(_T)) begin
      if (!(_T_1)) begin
        if (_T_5) begin
          outputPixel <= {{24'd0}, _GEN_4};
        end
      end
    end
  end
endmodule
module SystemTop(
  input         clock,
  input         reset,
  output        io_done,
  input         io_start,
  input         io_testerDataMemEnable,
  input  [15:0] io_testerDataMemAddress,
  output [31:0] io_testerDataMemDataRead,
  input         io_testerDataMemWriteEnable,
  input  [31:0] io_testerDataMemDataWrite
);
  wire  dataMemory_clock; // @[SystemTop.scala 18:26]
  wire [15:0] dataMemory_io_address; // @[SystemTop.scala 18:26]
  wire [31:0] dataMemory_io_dataRead; // @[SystemTop.scala 18:26]
  wire  dataMemory_io_writeEnable; // @[SystemTop.scala 18:26]
  wire [31:0] dataMemory_io_dataWrite; // @[SystemTop.scala 18:26]
  wire  dataMemory_io_testerEnable; // @[SystemTop.scala 18:26]
  wire [15:0] dataMemory_io_testerAddress; // @[SystemTop.scala 18:26]
  wire [31:0] dataMemory_io_testerDataRead; // @[SystemTop.scala 18:26]
  wire  dataMemory_io_testerWriteEnable; // @[SystemTop.scala 18:26]
  wire [31:0] dataMemory_io_testerDataWrite; // @[SystemTop.scala 18:26]
  wire  accelerator_clock; // @[SystemTop.scala 19:27]
  wire  accelerator_reset; // @[SystemTop.scala 19:27]
  wire  accelerator_io_start; // @[SystemTop.scala 19:27]
  wire  accelerator_io_done; // @[SystemTop.scala 19:27]
  wire [15:0] accelerator_io_address; // @[SystemTop.scala 19:27]
  wire [31:0] accelerator_io_dataRead; // @[SystemTop.scala 19:27]
  wire  accelerator_io_writeEnable; // @[SystemTop.scala 19:27]
  wire [31:0] accelerator_io_dataWrite; // @[SystemTop.scala 19:27]
  DataMemory dataMemory ( // @[SystemTop.scala 18:26]
    .clock(dataMemory_clock),
    .io_address(dataMemory_io_address),
    .io_dataRead(dataMemory_io_dataRead),
    .io_writeEnable(dataMemory_io_writeEnable),
    .io_dataWrite(dataMemory_io_dataWrite),
    .io_testerEnable(dataMemory_io_testerEnable),
    .io_testerAddress(dataMemory_io_testerAddress),
    .io_testerDataRead(dataMemory_io_testerDataRead),
    .io_testerWriteEnable(dataMemory_io_testerWriteEnable),
    .io_testerDataWrite(dataMemory_io_testerDataWrite)
  );
  Accelerator accelerator ( // @[SystemTop.scala 19:27]
    .clock(accelerator_clock),
    .reset(accelerator_reset),
    .io_start(accelerator_io_start),
    .io_done(accelerator_io_done),
    .io_address(accelerator_io_address),
    .io_dataRead(accelerator_io_dataRead),
    .io_writeEnable(accelerator_io_writeEnable),
    .io_dataWrite(accelerator_io_dataWrite)
  );
  assign io_done = accelerator_io_done; // @[SystemTop.scala 23:11]
  assign io_testerDataMemDataRead = dataMemory_io_testerDataRead; // @[SystemTop.scala 34:28]
  assign dataMemory_clock = clock;
  assign dataMemory_io_address = accelerator_io_address; // @[SystemTop.scala 28:25]
  assign dataMemory_io_writeEnable = accelerator_io_writeEnable; // @[SystemTop.scala 30:29]
  assign dataMemory_io_dataWrite = accelerator_io_dataWrite; // @[SystemTop.scala 29:27]
  assign dataMemory_io_testerEnable = io_testerDataMemEnable; // @[SystemTop.scala 36:30]
  assign dataMemory_io_testerAddress = io_testerDataMemAddress; // @[SystemTop.scala 33:31]
  assign dataMemory_io_testerWriteEnable = io_testerDataMemWriteEnable; // @[SystemTop.scala 37:35]
  assign dataMemory_io_testerDataWrite = io_testerDataMemDataWrite; // @[SystemTop.scala 35:33]
  assign accelerator_clock = clock;
  assign accelerator_reset = reset;
  assign accelerator_io_start = io_start; // @[SystemTop.scala 24:24]
  assign accelerator_io_dataRead = dataMemory_io_dataRead; // @[SystemTop.scala 27:27]
endmodule
