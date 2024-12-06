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
  input  [7:0]  io_dataRead,
  output        io_writeEnable,
  output [7:0]  io_dataWrite
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_56;
  reg [31:0] _RAND_57;
  reg [31:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
  reg [31:0] _RAND_62;
  reg [31:0] _RAND_63;
`endif // RANDOMIZE_REG_INIT
  reg [2:0] state; // @[Accelerator.scala 16:22]
  reg [4:0] x; // @[Accelerator.scala 19:18]
  reg [4:0] y; // @[Accelerator.scala 20:18]
  reg [7:0] rowBuffer_0_0; // @[Accelerator.scala 21:26]
  reg [7:0] rowBuffer_0_1; // @[Accelerator.scala 21:26]
  reg [7:0] rowBuffer_0_2; // @[Accelerator.scala 21:26]
  reg [7:0] rowBuffer_0_3; // @[Accelerator.scala 21:26]
  reg [7:0] rowBuffer_0_4; // @[Accelerator.scala 21:26]
  reg [7:0] rowBuffer_0_5; // @[Accelerator.scala 21:26]
  reg [7:0] rowBuffer_0_6; // @[Accelerator.scala 21:26]
  reg [7:0] rowBuffer_0_7; // @[Accelerator.scala 21:26]
  reg [7:0] rowBuffer_0_8; // @[Accelerator.scala 21:26]
  reg [7:0] rowBuffer_0_9; // @[Accelerator.scala 21:26]
  reg [7:0] rowBuffer_0_10; // @[Accelerator.scala 21:26]
  reg [7:0] rowBuffer_0_11; // @[Accelerator.scala 21:26]
  reg [7:0] rowBuffer_0_12; // @[Accelerator.scala 21:26]
  reg [7:0] rowBuffer_0_13; // @[Accelerator.scala 21:26]
  reg [7:0] rowBuffer_0_14; // @[Accelerator.scala 21:26]
  reg [7:0] rowBuffer_0_15; // @[Accelerator.scala 21:26]
  reg [7:0] rowBuffer_0_16; // @[Accelerator.scala 21:26]
  reg [7:0] rowBuffer_0_17; // @[Accelerator.scala 21:26]
  reg [7:0] rowBuffer_0_18; // @[Accelerator.scala 21:26]
  reg [7:0] rowBuffer_0_19; // @[Accelerator.scala 21:26]
  reg [7:0] rowBuffer_1_0; // @[Accelerator.scala 21:26]
  reg [7:0] rowBuffer_1_1; // @[Accelerator.scala 21:26]
  reg [7:0] rowBuffer_1_2; // @[Accelerator.scala 21:26]
  reg [7:0] rowBuffer_1_3; // @[Accelerator.scala 21:26]
  reg [7:0] rowBuffer_1_4; // @[Accelerator.scala 21:26]
  reg [7:0] rowBuffer_1_5; // @[Accelerator.scala 21:26]
  reg [7:0] rowBuffer_1_6; // @[Accelerator.scala 21:26]
  reg [7:0] rowBuffer_1_7; // @[Accelerator.scala 21:26]
  reg [7:0] rowBuffer_1_8; // @[Accelerator.scala 21:26]
  reg [7:0] rowBuffer_1_9; // @[Accelerator.scala 21:26]
  reg [7:0] rowBuffer_1_10; // @[Accelerator.scala 21:26]
  reg [7:0] rowBuffer_1_11; // @[Accelerator.scala 21:26]
  reg [7:0] rowBuffer_1_12; // @[Accelerator.scala 21:26]
  reg [7:0] rowBuffer_1_13; // @[Accelerator.scala 21:26]
  reg [7:0] rowBuffer_1_14; // @[Accelerator.scala 21:26]
  reg [7:0] rowBuffer_1_15; // @[Accelerator.scala 21:26]
  reg [7:0] rowBuffer_1_16; // @[Accelerator.scala 21:26]
  reg [7:0] rowBuffer_1_17; // @[Accelerator.scala 21:26]
  reg [7:0] rowBuffer_1_18; // @[Accelerator.scala 21:26]
  reg [7:0] rowBuffer_1_19; // @[Accelerator.scala 21:26]
  reg [7:0] rowBuffer_2_0; // @[Accelerator.scala 21:26]
  reg [7:0] rowBuffer_2_1; // @[Accelerator.scala 21:26]
  reg [7:0] rowBuffer_2_2; // @[Accelerator.scala 21:26]
  reg [7:0] rowBuffer_2_3; // @[Accelerator.scala 21:26]
  reg [7:0] rowBuffer_2_4; // @[Accelerator.scala 21:26]
  reg [7:0] rowBuffer_2_5; // @[Accelerator.scala 21:26]
  reg [7:0] rowBuffer_2_6; // @[Accelerator.scala 21:26]
  reg [7:0] rowBuffer_2_7; // @[Accelerator.scala 21:26]
  reg [7:0] rowBuffer_2_8; // @[Accelerator.scala 21:26]
  reg [7:0] rowBuffer_2_9; // @[Accelerator.scala 21:26]
  reg [7:0] rowBuffer_2_10; // @[Accelerator.scala 21:26]
  reg [7:0] rowBuffer_2_11; // @[Accelerator.scala 21:26]
  reg [7:0] rowBuffer_2_12; // @[Accelerator.scala 21:26]
  reg [7:0] rowBuffer_2_13; // @[Accelerator.scala 21:26]
  reg [7:0] rowBuffer_2_14; // @[Accelerator.scala 21:26]
  reg [7:0] rowBuffer_2_15; // @[Accelerator.scala 21:26]
  reg [7:0] rowBuffer_2_16; // @[Accelerator.scala 21:26]
  reg [7:0] rowBuffer_2_17; // @[Accelerator.scala 21:26]
  reg [7:0] rowBuffer_2_18; // @[Accelerator.scala 21:26]
  reg [7:0] rowBuffer_2_19; // @[Accelerator.scala 21:26]
  reg [7:0] outputPixel; // @[Accelerator.scala 22:28]
  wire  _T_4 = 3'h0 == state; // @[Conditional.scala 37:30]
  wire  _T_5 = 3'h1 == state; // @[Conditional.scala 37:30]
  wire  _T_6 = x == 5'h0; // @[Accelerator.scala 44:14]
  wire [4:0] _T_8 = y + 5'h1; // @[Accelerator.scala 49:31]
  wire [9:0] _T_9 = _T_8 * 5'h14; // @[Accelerator.scala 31:40]
  wire [9:0] _GEN_308 = {{5'd0}, x}; // @[Accelerator.scala 31:47]
  wire [9:0] _T_11 = _T_9 + _GEN_308; // @[Accelerator.scala 31:47]
  wire  _T_12 = x == 5'h13; // @[Accelerator.scala 52:14]
  wire [4:0] _T_14 = x + 5'h1; // @[Accelerator.scala 56:16]
  wire  _T_15 = 3'h2 == state; // @[Conditional.scala 37:30]
  wire  _T_17 = y == 5'h0; // @[Accelerator.scala 61:27]
  wire  _T_18 = _T_6 | _T_17; // @[Accelerator.scala 61:22]
  wire  _T_20 = _T_18 | _T_12; // @[Accelerator.scala 61:35]
  wire  _T_21 = y == 5'h13; // @[Accelerator.scala 61:54]
  wire  _T_22 = _T_20 | _T_21; // @[Accelerator.scala 61:49]
  wire [4:0] _T_25 = x - 5'h1; // @[Accelerator.scala 68:55]
  wire [4:0] _T_26 = _T_6 ? 5'h0 : _T_25; // @[Accelerator.scala 68:36]
  wire [4:0] _T_30 = _T_12 ? 5'h13 : _T_14; // @[Accelerator.scala 69:37]
  wire [7:0] _GEN_66 = 5'h1 == x ? rowBuffer_0_1 : rowBuffer_0_0; // @[Accelerator.scala 72:29]
  wire [7:0] _GEN_67 = 5'h2 == x ? rowBuffer_0_2 : _GEN_66; // @[Accelerator.scala 72:29]
  wire [7:0] _GEN_68 = 5'h3 == x ? rowBuffer_0_3 : _GEN_67; // @[Accelerator.scala 72:29]
  wire [7:0] _GEN_69 = 5'h4 == x ? rowBuffer_0_4 : _GEN_68; // @[Accelerator.scala 72:29]
  wire [7:0] _GEN_70 = 5'h5 == x ? rowBuffer_0_5 : _GEN_69; // @[Accelerator.scala 72:29]
  wire [7:0] _GEN_71 = 5'h6 == x ? rowBuffer_0_6 : _GEN_70; // @[Accelerator.scala 72:29]
  wire [7:0] _GEN_72 = 5'h7 == x ? rowBuffer_0_7 : _GEN_71; // @[Accelerator.scala 72:29]
  wire [7:0] _GEN_73 = 5'h8 == x ? rowBuffer_0_8 : _GEN_72; // @[Accelerator.scala 72:29]
  wire [7:0] _GEN_74 = 5'h9 == x ? rowBuffer_0_9 : _GEN_73; // @[Accelerator.scala 72:29]
  wire [7:0] _GEN_75 = 5'ha == x ? rowBuffer_0_10 : _GEN_74; // @[Accelerator.scala 72:29]
  wire [7:0] _GEN_76 = 5'hb == x ? rowBuffer_0_11 : _GEN_75; // @[Accelerator.scala 72:29]
  wire [7:0] _GEN_77 = 5'hc == x ? rowBuffer_0_12 : _GEN_76; // @[Accelerator.scala 72:29]
  wire [7:0] _GEN_78 = 5'hd == x ? rowBuffer_0_13 : _GEN_77; // @[Accelerator.scala 72:29]
  wire [7:0] _GEN_79 = 5'he == x ? rowBuffer_0_14 : _GEN_78; // @[Accelerator.scala 72:29]
  wire [7:0] _GEN_80 = 5'hf == x ? rowBuffer_0_15 : _GEN_79; // @[Accelerator.scala 72:29]
  wire [7:0] _GEN_81 = 5'h10 == x ? rowBuffer_0_16 : _GEN_80; // @[Accelerator.scala 72:29]
  wire [7:0] _GEN_82 = 5'h11 == x ? rowBuffer_0_17 : _GEN_81; // @[Accelerator.scala 72:29]
  wire [7:0] _GEN_83 = 5'h12 == x ? rowBuffer_0_18 : _GEN_82; // @[Accelerator.scala 72:29]
  wire [7:0] _GEN_84 = 5'h13 == x ? rowBuffer_0_19 : _GEN_83; // @[Accelerator.scala 72:29]
  wire  _T_31 = _GEN_84 == 8'h0; // @[Accelerator.scala 72:29]
  wire [7:0] _GEN_86 = 5'h1 == x ? rowBuffer_2_1 : rowBuffer_2_0; // @[Accelerator.scala 72:49]
  wire [7:0] _GEN_87 = 5'h2 == x ? rowBuffer_2_2 : _GEN_86; // @[Accelerator.scala 72:49]
  wire [7:0] _GEN_88 = 5'h3 == x ? rowBuffer_2_3 : _GEN_87; // @[Accelerator.scala 72:49]
  wire [7:0] _GEN_89 = 5'h4 == x ? rowBuffer_2_4 : _GEN_88; // @[Accelerator.scala 72:49]
  wire [7:0] _GEN_90 = 5'h5 == x ? rowBuffer_2_5 : _GEN_89; // @[Accelerator.scala 72:49]
  wire [7:0] _GEN_91 = 5'h6 == x ? rowBuffer_2_6 : _GEN_90; // @[Accelerator.scala 72:49]
  wire [7:0] _GEN_92 = 5'h7 == x ? rowBuffer_2_7 : _GEN_91; // @[Accelerator.scala 72:49]
  wire [7:0] _GEN_93 = 5'h8 == x ? rowBuffer_2_8 : _GEN_92; // @[Accelerator.scala 72:49]
  wire [7:0] _GEN_94 = 5'h9 == x ? rowBuffer_2_9 : _GEN_93; // @[Accelerator.scala 72:49]
  wire [7:0] _GEN_95 = 5'ha == x ? rowBuffer_2_10 : _GEN_94; // @[Accelerator.scala 72:49]
  wire [7:0] _GEN_96 = 5'hb == x ? rowBuffer_2_11 : _GEN_95; // @[Accelerator.scala 72:49]
  wire [7:0] _GEN_97 = 5'hc == x ? rowBuffer_2_12 : _GEN_96; // @[Accelerator.scala 72:49]
  wire [7:0] _GEN_98 = 5'hd == x ? rowBuffer_2_13 : _GEN_97; // @[Accelerator.scala 72:49]
  wire [7:0] _GEN_99 = 5'he == x ? rowBuffer_2_14 : _GEN_98; // @[Accelerator.scala 72:49]
  wire [7:0] _GEN_100 = 5'hf == x ? rowBuffer_2_15 : _GEN_99; // @[Accelerator.scala 72:49]
  wire [7:0] _GEN_101 = 5'h10 == x ? rowBuffer_2_16 : _GEN_100; // @[Accelerator.scala 72:49]
  wire [7:0] _GEN_102 = 5'h11 == x ? rowBuffer_2_17 : _GEN_101; // @[Accelerator.scala 72:49]
  wire [7:0] _GEN_103 = 5'h12 == x ? rowBuffer_2_18 : _GEN_102; // @[Accelerator.scala 72:49]
  wire [7:0] _GEN_104 = 5'h13 == x ? rowBuffer_2_19 : _GEN_103; // @[Accelerator.scala 72:49]
  wire  _T_32 = _GEN_104 == 8'h0; // @[Accelerator.scala 72:49]
  wire  _T_33 = _T_31 | _T_32; // @[Accelerator.scala 72:38]
  wire [7:0] _GEN_106 = 5'h1 == _T_26 ? rowBuffer_1_1 : rowBuffer_1_0; // @[Accelerator.scala 72:67]
  wire [7:0] _GEN_107 = 5'h2 == _T_26 ? rowBuffer_1_2 : _GEN_106; // @[Accelerator.scala 72:67]
  wire [7:0] _GEN_108 = 5'h3 == _T_26 ? rowBuffer_1_3 : _GEN_107; // @[Accelerator.scala 72:67]
  wire [7:0] _GEN_109 = 5'h4 == _T_26 ? rowBuffer_1_4 : _GEN_108; // @[Accelerator.scala 72:67]
  wire [7:0] _GEN_110 = 5'h5 == _T_26 ? rowBuffer_1_5 : _GEN_109; // @[Accelerator.scala 72:67]
  wire [7:0] _GEN_111 = 5'h6 == _T_26 ? rowBuffer_1_6 : _GEN_110; // @[Accelerator.scala 72:67]
  wire [7:0] _GEN_112 = 5'h7 == _T_26 ? rowBuffer_1_7 : _GEN_111; // @[Accelerator.scala 72:67]
  wire [7:0] _GEN_113 = 5'h8 == _T_26 ? rowBuffer_1_8 : _GEN_112; // @[Accelerator.scala 72:67]
  wire [7:0] _GEN_114 = 5'h9 == _T_26 ? rowBuffer_1_9 : _GEN_113; // @[Accelerator.scala 72:67]
  wire [7:0] _GEN_115 = 5'ha == _T_26 ? rowBuffer_1_10 : _GEN_114; // @[Accelerator.scala 72:67]
  wire [7:0] _GEN_116 = 5'hb == _T_26 ? rowBuffer_1_11 : _GEN_115; // @[Accelerator.scala 72:67]
  wire [7:0] _GEN_117 = 5'hc == _T_26 ? rowBuffer_1_12 : _GEN_116; // @[Accelerator.scala 72:67]
  wire [7:0] _GEN_118 = 5'hd == _T_26 ? rowBuffer_1_13 : _GEN_117; // @[Accelerator.scala 72:67]
  wire [7:0] _GEN_119 = 5'he == _T_26 ? rowBuffer_1_14 : _GEN_118; // @[Accelerator.scala 72:67]
  wire [7:0] _GEN_120 = 5'hf == _T_26 ? rowBuffer_1_15 : _GEN_119; // @[Accelerator.scala 72:67]
  wire [7:0] _GEN_121 = 5'h10 == _T_26 ? rowBuffer_1_16 : _GEN_120; // @[Accelerator.scala 72:67]
  wire [7:0] _GEN_122 = 5'h11 == _T_26 ? rowBuffer_1_17 : _GEN_121; // @[Accelerator.scala 72:67]
  wire [7:0] _GEN_123 = 5'h12 == _T_26 ? rowBuffer_1_18 : _GEN_122; // @[Accelerator.scala 72:67]
  wire [7:0] _GEN_124 = 5'h13 == _T_26 ? rowBuffer_1_19 : _GEN_123; // @[Accelerator.scala 72:67]
  wire  _T_34 = _GEN_124 == 8'h0; // @[Accelerator.scala 72:67]
  wire  _T_35 = _T_33 | _T_34; // @[Accelerator.scala 72:58]
  wire [7:0] _GEN_126 = 5'h1 == _T_30 ? rowBuffer_1_1 : rowBuffer_1_0; // @[Accelerator.scala 72:86]
  wire [7:0] _GEN_127 = 5'h2 == _T_30 ? rowBuffer_1_2 : _GEN_126; // @[Accelerator.scala 72:86]
  wire [7:0] _GEN_128 = 5'h3 == _T_30 ? rowBuffer_1_3 : _GEN_127; // @[Accelerator.scala 72:86]
  wire [7:0] _GEN_129 = 5'h4 == _T_30 ? rowBuffer_1_4 : _GEN_128; // @[Accelerator.scala 72:86]
  wire [7:0] _GEN_130 = 5'h5 == _T_30 ? rowBuffer_1_5 : _GEN_129; // @[Accelerator.scala 72:86]
  wire [7:0] _GEN_131 = 5'h6 == _T_30 ? rowBuffer_1_6 : _GEN_130; // @[Accelerator.scala 72:86]
  wire [7:0] _GEN_132 = 5'h7 == _T_30 ? rowBuffer_1_7 : _GEN_131; // @[Accelerator.scala 72:86]
  wire [7:0] _GEN_133 = 5'h8 == _T_30 ? rowBuffer_1_8 : _GEN_132; // @[Accelerator.scala 72:86]
  wire [7:0] _GEN_134 = 5'h9 == _T_30 ? rowBuffer_1_9 : _GEN_133; // @[Accelerator.scala 72:86]
  wire [7:0] _GEN_135 = 5'ha == _T_30 ? rowBuffer_1_10 : _GEN_134; // @[Accelerator.scala 72:86]
  wire [7:0] _GEN_136 = 5'hb == _T_30 ? rowBuffer_1_11 : _GEN_135; // @[Accelerator.scala 72:86]
  wire [7:0] _GEN_137 = 5'hc == _T_30 ? rowBuffer_1_12 : _GEN_136; // @[Accelerator.scala 72:86]
  wire [7:0] _GEN_138 = 5'hd == _T_30 ? rowBuffer_1_13 : _GEN_137; // @[Accelerator.scala 72:86]
  wire [7:0] _GEN_139 = 5'he == _T_30 ? rowBuffer_1_14 : _GEN_138; // @[Accelerator.scala 72:86]
  wire [7:0] _GEN_140 = 5'hf == _T_30 ? rowBuffer_1_15 : _GEN_139; // @[Accelerator.scala 72:86]
  wire [7:0] _GEN_141 = 5'h10 == _T_30 ? rowBuffer_1_16 : _GEN_140; // @[Accelerator.scala 72:86]
  wire [7:0] _GEN_142 = 5'h11 == _T_30 ? rowBuffer_1_17 : _GEN_141; // @[Accelerator.scala 72:86]
  wire [7:0] _GEN_143 = 5'h12 == _T_30 ? rowBuffer_1_18 : _GEN_142; // @[Accelerator.scala 72:86]
  wire [7:0] _GEN_144 = 5'h13 == _T_30 ? rowBuffer_1_19 : _GEN_143; // @[Accelerator.scala 72:86]
  wire  _T_36 = _GEN_144 == 8'h0; // @[Accelerator.scala 72:86]
  wire  _T_37 = _T_35 | _T_36; // @[Accelerator.scala 72:76]
  wire  _T_39 = 3'h3 == state; // @[Conditional.scala 37:30]
  wire [9:0] _T_40 = y * 5'h14; // @[Accelerator.scala 31:40]
  wire [9:0] _T_42 = _T_40 + _GEN_308; // @[Accelerator.scala 31:47]
  wire [9:0] _T_44 = _T_42 + 10'h190; // @[Accelerator.scala 80:32]
  wire  _T_45 = 3'h4 == state; // @[Conditional.scala 37:30]
  wire  _T_49 = y == 5'h12; // @[Accelerator.scala 91:24]
  wire  _T_53 = 3'h5 == state; // @[Conditional.scala 37:30]
  wire  _T_54 = ~io_start; // @[Accelerator.scala 100:12]
  wire  _GEN_156 = _T_45 ? 1'h0 : _T_53; // @[Conditional.scala 39:67]
  wire [9:0] _GEN_157 = _T_39 ? _T_44 : 10'h0; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_158 = _T_39 ? outputPixel : 8'h0; // @[Conditional.scala 39:67]
  wire  _GEN_163 = _T_39 ? 1'h0 : _GEN_156; // @[Conditional.scala 39:67]
  wire [9:0] _GEN_166 = _T_15 ? 10'h0 : _GEN_157; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_167 = _T_15 ? 8'h0 : _GEN_158; // @[Conditional.scala 39:67]
  wire  _GEN_168 = _T_15 ? 1'h0 : _T_39; // @[Conditional.scala 39:67]
  wire  _GEN_171 = _T_15 ? 1'h0 : _GEN_163; // @[Conditional.scala 39:67]
  wire [9:0] _GEN_212 = _T_5 ? _T_11 : _GEN_166; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_236 = _T_5 ? 8'h0 : _GEN_167; // @[Conditional.scala 39:67]
  wire  _GEN_237 = _T_5 ? 1'h0 : _GEN_168; // @[Conditional.scala 39:67]
  wire  _GEN_239 = _T_5 ? 1'h0 : _GEN_171; // @[Conditional.scala 39:67]
  wire [9:0] _GEN_283 = _T_4 ? 10'h0 : _GEN_212; // @[Conditional.scala 40:58]
  assign io_done = _T_4 ? 1'h0 : _GEN_239; // @[Accelerator.scala 28:11 Accelerator.scala 99:15]
  assign io_address = {{6'd0}, _GEN_283}; // @[Accelerator.scala 25:14 Accelerator.scala 49:18 Accelerator.scala 80:18]
  assign io_writeEnable = _T_4 ? 1'h0 : _GEN_237; // @[Accelerator.scala 27:18 Accelerator.scala 82:22 Accelerator.scala 87:22]
  assign io_dataWrite = _T_4 ? 8'h0 : _GEN_236; // @[Accelerator.scala 26:16 Accelerator.scala 81:20]
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
  rowBuffer_0_0 = _RAND_3[7:0];
  _RAND_4 = {1{`RANDOM}};
  rowBuffer_0_1 = _RAND_4[7:0];
  _RAND_5 = {1{`RANDOM}};
  rowBuffer_0_2 = _RAND_5[7:0];
  _RAND_6 = {1{`RANDOM}};
  rowBuffer_0_3 = _RAND_6[7:0];
  _RAND_7 = {1{`RANDOM}};
  rowBuffer_0_4 = _RAND_7[7:0];
  _RAND_8 = {1{`RANDOM}};
  rowBuffer_0_5 = _RAND_8[7:0];
  _RAND_9 = {1{`RANDOM}};
  rowBuffer_0_6 = _RAND_9[7:0];
  _RAND_10 = {1{`RANDOM}};
  rowBuffer_0_7 = _RAND_10[7:0];
  _RAND_11 = {1{`RANDOM}};
  rowBuffer_0_8 = _RAND_11[7:0];
  _RAND_12 = {1{`RANDOM}};
  rowBuffer_0_9 = _RAND_12[7:0];
  _RAND_13 = {1{`RANDOM}};
  rowBuffer_0_10 = _RAND_13[7:0];
  _RAND_14 = {1{`RANDOM}};
  rowBuffer_0_11 = _RAND_14[7:0];
  _RAND_15 = {1{`RANDOM}};
  rowBuffer_0_12 = _RAND_15[7:0];
  _RAND_16 = {1{`RANDOM}};
  rowBuffer_0_13 = _RAND_16[7:0];
  _RAND_17 = {1{`RANDOM}};
  rowBuffer_0_14 = _RAND_17[7:0];
  _RAND_18 = {1{`RANDOM}};
  rowBuffer_0_15 = _RAND_18[7:0];
  _RAND_19 = {1{`RANDOM}};
  rowBuffer_0_16 = _RAND_19[7:0];
  _RAND_20 = {1{`RANDOM}};
  rowBuffer_0_17 = _RAND_20[7:0];
  _RAND_21 = {1{`RANDOM}};
  rowBuffer_0_18 = _RAND_21[7:0];
  _RAND_22 = {1{`RANDOM}};
  rowBuffer_0_19 = _RAND_22[7:0];
  _RAND_23 = {1{`RANDOM}};
  rowBuffer_1_0 = _RAND_23[7:0];
  _RAND_24 = {1{`RANDOM}};
  rowBuffer_1_1 = _RAND_24[7:0];
  _RAND_25 = {1{`RANDOM}};
  rowBuffer_1_2 = _RAND_25[7:0];
  _RAND_26 = {1{`RANDOM}};
  rowBuffer_1_3 = _RAND_26[7:0];
  _RAND_27 = {1{`RANDOM}};
  rowBuffer_1_4 = _RAND_27[7:0];
  _RAND_28 = {1{`RANDOM}};
  rowBuffer_1_5 = _RAND_28[7:0];
  _RAND_29 = {1{`RANDOM}};
  rowBuffer_1_6 = _RAND_29[7:0];
  _RAND_30 = {1{`RANDOM}};
  rowBuffer_1_7 = _RAND_30[7:0];
  _RAND_31 = {1{`RANDOM}};
  rowBuffer_1_8 = _RAND_31[7:0];
  _RAND_32 = {1{`RANDOM}};
  rowBuffer_1_9 = _RAND_32[7:0];
  _RAND_33 = {1{`RANDOM}};
  rowBuffer_1_10 = _RAND_33[7:0];
  _RAND_34 = {1{`RANDOM}};
  rowBuffer_1_11 = _RAND_34[7:0];
  _RAND_35 = {1{`RANDOM}};
  rowBuffer_1_12 = _RAND_35[7:0];
  _RAND_36 = {1{`RANDOM}};
  rowBuffer_1_13 = _RAND_36[7:0];
  _RAND_37 = {1{`RANDOM}};
  rowBuffer_1_14 = _RAND_37[7:0];
  _RAND_38 = {1{`RANDOM}};
  rowBuffer_1_15 = _RAND_38[7:0];
  _RAND_39 = {1{`RANDOM}};
  rowBuffer_1_16 = _RAND_39[7:0];
  _RAND_40 = {1{`RANDOM}};
  rowBuffer_1_17 = _RAND_40[7:0];
  _RAND_41 = {1{`RANDOM}};
  rowBuffer_1_18 = _RAND_41[7:0];
  _RAND_42 = {1{`RANDOM}};
  rowBuffer_1_19 = _RAND_42[7:0];
  _RAND_43 = {1{`RANDOM}};
  rowBuffer_2_0 = _RAND_43[7:0];
  _RAND_44 = {1{`RANDOM}};
  rowBuffer_2_1 = _RAND_44[7:0];
  _RAND_45 = {1{`RANDOM}};
  rowBuffer_2_2 = _RAND_45[7:0];
  _RAND_46 = {1{`RANDOM}};
  rowBuffer_2_3 = _RAND_46[7:0];
  _RAND_47 = {1{`RANDOM}};
  rowBuffer_2_4 = _RAND_47[7:0];
  _RAND_48 = {1{`RANDOM}};
  rowBuffer_2_5 = _RAND_48[7:0];
  _RAND_49 = {1{`RANDOM}};
  rowBuffer_2_6 = _RAND_49[7:0];
  _RAND_50 = {1{`RANDOM}};
  rowBuffer_2_7 = _RAND_50[7:0];
  _RAND_51 = {1{`RANDOM}};
  rowBuffer_2_8 = _RAND_51[7:0];
  _RAND_52 = {1{`RANDOM}};
  rowBuffer_2_9 = _RAND_52[7:0];
  _RAND_53 = {1{`RANDOM}};
  rowBuffer_2_10 = _RAND_53[7:0];
  _RAND_54 = {1{`RANDOM}};
  rowBuffer_2_11 = _RAND_54[7:0];
  _RAND_55 = {1{`RANDOM}};
  rowBuffer_2_12 = _RAND_55[7:0];
  _RAND_56 = {1{`RANDOM}};
  rowBuffer_2_13 = _RAND_56[7:0];
  _RAND_57 = {1{`RANDOM}};
  rowBuffer_2_14 = _RAND_57[7:0];
  _RAND_58 = {1{`RANDOM}};
  rowBuffer_2_15 = _RAND_58[7:0];
  _RAND_59 = {1{`RANDOM}};
  rowBuffer_2_16 = _RAND_59[7:0];
  _RAND_60 = {1{`RANDOM}};
  rowBuffer_2_17 = _RAND_60[7:0];
  _RAND_61 = {1{`RANDOM}};
  rowBuffer_2_18 = _RAND_61[7:0];
  _RAND_62 = {1{`RANDOM}};
  rowBuffer_2_19 = _RAND_62[7:0];
  _RAND_63 = {1{`RANDOM}};
  outputPixel = _RAND_63[7:0];
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
    end else if (_T_4) begin
      if (io_start) begin
        state <= 3'h1;
      end
    end else if (_T_5) begin
      if (_T_12) begin
        state <= 3'h2;
      end
    end else if (_T_15) begin
      state <= 3'h3;
    end else if (_T_39) begin
      state <= 3'h4;
    end else if (_T_45) begin
      if (_T_12) begin
        if (_T_49) begin
          state <= 3'h5;
        end else begin
          state <= 3'h1;
        end
      end else begin
        state <= 3'h2;
      end
    end else if (_T_53) begin
      if (_T_54) begin
        state <= 3'h0;
      end
    end
    if (reset) begin
      x <= 5'h0;
    end else if (_T_4) begin
      if (io_start) begin
        x <= 5'h0;
      end
    end else if (_T_5) begin
      if (_T_12) begin
        x <= 5'h0;
      end else begin
        x <= _T_14;
      end
    end else if (!(_T_15)) begin
      if (!(_T_39)) begin
        if (_T_45) begin
          if (_T_12) begin
            x <= 5'h0;
          end else begin
            x <= _T_14;
          end
        end
      end
    end
    if (reset) begin
      y <= 5'h0;
    end else if (_T_4) begin
      if (io_start) begin
        y <= 5'h0;
      end
    end else if (!(_T_5)) begin
      if (!(_T_15)) begin
        if (!(_T_39)) begin
          if (_T_45) begin
            if (_T_12) begin
              y <= _T_8;
            end
          end
        end
      end
    end
    if (reset) begin
      rowBuffer_0_0 <= 8'hff;
    end else if (!(_T_4)) begin
      if (_T_5) begin
        if (_T_6) begin
          rowBuffer_0_0 <= rowBuffer_1_0;
        end
      end
    end
    if (reset) begin
      rowBuffer_0_1 <= 8'hff;
    end else if (!(_T_4)) begin
      if (_T_5) begin
        if (_T_6) begin
          rowBuffer_0_1 <= rowBuffer_1_1;
        end
      end
    end
    if (reset) begin
      rowBuffer_0_2 <= 8'hff;
    end else if (!(_T_4)) begin
      if (_T_5) begin
        if (_T_6) begin
          rowBuffer_0_2 <= rowBuffer_1_2;
        end
      end
    end
    if (reset) begin
      rowBuffer_0_3 <= 8'hff;
    end else if (!(_T_4)) begin
      if (_T_5) begin
        if (_T_6) begin
          rowBuffer_0_3 <= rowBuffer_1_3;
        end
      end
    end
    if (reset) begin
      rowBuffer_0_4 <= 8'hff;
    end else if (!(_T_4)) begin
      if (_T_5) begin
        if (_T_6) begin
          rowBuffer_0_4 <= rowBuffer_1_4;
        end
      end
    end
    if (reset) begin
      rowBuffer_0_5 <= 8'hff;
    end else if (!(_T_4)) begin
      if (_T_5) begin
        if (_T_6) begin
          rowBuffer_0_5 <= rowBuffer_1_5;
        end
      end
    end
    if (reset) begin
      rowBuffer_0_6 <= 8'hff;
    end else if (!(_T_4)) begin
      if (_T_5) begin
        if (_T_6) begin
          rowBuffer_0_6 <= rowBuffer_1_6;
        end
      end
    end
    if (reset) begin
      rowBuffer_0_7 <= 8'hff;
    end else if (!(_T_4)) begin
      if (_T_5) begin
        if (_T_6) begin
          rowBuffer_0_7 <= rowBuffer_1_7;
        end
      end
    end
    if (reset) begin
      rowBuffer_0_8 <= 8'hff;
    end else if (!(_T_4)) begin
      if (_T_5) begin
        if (_T_6) begin
          rowBuffer_0_8 <= rowBuffer_1_8;
        end
      end
    end
    if (reset) begin
      rowBuffer_0_9 <= 8'hff;
    end else if (!(_T_4)) begin
      if (_T_5) begin
        if (_T_6) begin
          rowBuffer_0_9 <= rowBuffer_1_9;
        end
      end
    end
    if (reset) begin
      rowBuffer_0_10 <= 8'hff;
    end else if (!(_T_4)) begin
      if (_T_5) begin
        if (_T_6) begin
          rowBuffer_0_10 <= rowBuffer_1_10;
        end
      end
    end
    if (reset) begin
      rowBuffer_0_11 <= 8'hff;
    end else if (!(_T_4)) begin
      if (_T_5) begin
        if (_T_6) begin
          rowBuffer_0_11 <= rowBuffer_1_11;
        end
      end
    end
    if (reset) begin
      rowBuffer_0_12 <= 8'hff;
    end else if (!(_T_4)) begin
      if (_T_5) begin
        if (_T_6) begin
          rowBuffer_0_12 <= rowBuffer_1_12;
        end
      end
    end
    if (reset) begin
      rowBuffer_0_13 <= 8'hff;
    end else if (!(_T_4)) begin
      if (_T_5) begin
        if (_T_6) begin
          rowBuffer_0_13 <= rowBuffer_1_13;
        end
      end
    end
    if (reset) begin
      rowBuffer_0_14 <= 8'hff;
    end else if (!(_T_4)) begin
      if (_T_5) begin
        if (_T_6) begin
          rowBuffer_0_14 <= rowBuffer_1_14;
        end
      end
    end
    if (reset) begin
      rowBuffer_0_15 <= 8'hff;
    end else if (!(_T_4)) begin
      if (_T_5) begin
        if (_T_6) begin
          rowBuffer_0_15 <= rowBuffer_1_15;
        end
      end
    end
    if (reset) begin
      rowBuffer_0_16 <= 8'hff;
    end else if (!(_T_4)) begin
      if (_T_5) begin
        if (_T_6) begin
          rowBuffer_0_16 <= rowBuffer_1_16;
        end
      end
    end
    if (reset) begin
      rowBuffer_0_17 <= 8'hff;
    end else if (!(_T_4)) begin
      if (_T_5) begin
        if (_T_6) begin
          rowBuffer_0_17 <= rowBuffer_1_17;
        end
      end
    end
    if (reset) begin
      rowBuffer_0_18 <= 8'hff;
    end else if (!(_T_4)) begin
      if (_T_5) begin
        if (_T_6) begin
          rowBuffer_0_18 <= rowBuffer_1_18;
        end
      end
    end
    if (reset) begin
      rowBuffer_0_19 <= 8'hff;
    end else if (!(_T_4)) begin
      if (_T_5) begin
        if (_T_6) begin
          rowBuffer_0_19 <= rowBuffer_1_19;
        end
      end
    end
    if (reset) begin
      rowBuffer_1_0 <= 8'hff;
    end else if (!(_T_4)) begin
      if (_T_5) begin
        if (_T_6) begin
          rowBuffer_1_0 <= rowBuffer_2_0;
        end
      end
    end
    if (reset) begin
      rowBuffer_1_1 <= 8'hff;
    end else if (!(_T_4)) begin
      if (_T_5) begin
        if (_T_6) begin
          rowBuffer_1_1 <= rowBuffer_2_1;
        end
      end
    end
    if (reset) begin
      rowBuffer_1_2 <= 8'hff;
    end else if (!(_T_4)) begin
      if (_T_5) begin
        if (_T_6) begin
          rowBuffer_1_2 <= rowBuffer_2_2;
        end
      end
    end
    if (reset) begin
      rowBuffer_1_3 <= 8'hff;
    end else if (!(_T_4)) begin
      if (_T_5) begin
        if (_T_6) begin
          rowBuffer_1_3 <= rowBuffer_2_3;
        end
      end
    end
    if (reset) begin
      rowBuffer_1_4 <= 8'hff;
    end else if (!(_T_4)) begin
      if (_T_5) begin
        if (_T_6) begin
          rowBuffer_1_4 <= rowBuffer_2_4;
        end
      end
    end
    if (reset) begin
      rowBuffer_1_5 <= 8'hff;
    end else if (!(_T_4)) begin
      if (_T_5) begin
        if (_T_6) begin
          rowBuffer_1_5 <= rowBuffer_2_5;
        end
      end
    end
    if (reset) begin
      rowBuffer_1_6 <= 8'hff;
    end else if (!(_T_4)) begin
      if (_T_5) begin
        if (_T_6) begin
          rowBuffer_1_6 <= rowBuffer_2_6;
        end
      end
    end
    if (reset) begin
      rowBuffer_1_7 <= 8'hff;
    end else if (!(_T_4)) begin
      if (_T_5) begin
        if (_T_6) begin
          rowBuffer_1_7 <= rowBuffer_2_7;
        end
      end
    end
    if (reset) begin
      rowBuffer_1_8 <= 8'hff;
    end else if (!(_T_4)) begin
      if (_T_5) begin
        if (_T_6) begin
          rowBuffer_1_8 <= rowBuffer_2_8;
        end
      end
    end
    if (reset) begin
      rowBuffer_1_9 <= 8'hff;
    end else if (!(_T_4)) begin
      if (_T_5) begin
        if (_T_6) begin
          rowBuffer_1_9 <= rowBuffer_2_9;
        end
      end
    end
    if (reset) begin
      rowBuffer_1_10 <= 8'hff;
    end else if (!(_T_4)) begin
      if (_T_5) begin
        if (_T_6) begin
          rowBuffer_1_10 <= rowBuffer_2_10;
        end
      end
    end
    if (reset) begin
      rowBuffer_1_11 <= 8'hff;
    end else if (!(_T_4)) begin
      if (_T_5) begin
        if (_T_6) begin
          rowBuffer_1_11 <= rowBuffer_2_11;
        end
      end
    end
    if (reset) begin
      rowBuffer_1_12 <= 8'hff;
    end else if (!(_T_4)) begin
      if (_T_5) begin
        if (_T_6) begin
          rowBuffer_1_12 <= rowBuffer_2_12;
        end
      end
    end
    if (reset) begin
      rowBuffer_1_13 <= 8'hff;
    end else if (!(_T_4)) begin
      if (_T_5) begin
        if (_T_6) begin
          rowBuffer_1_13 <= rowBuffer_2_13;
        end
      end
    end
    if (reset) begin
      rowBuffer_1_14 <= 8'hff;
    end else if (!(_T_4)) begin
      if (_T_5) begin
        if (_T_6) begin
          rowBuffer_1_14 <= rowBuffer_2_14;
        end
      end
    end
    if (reset) begin
      rowBuffer_1_15 <= 8'hff;
    end else if (!(_T_4)) begin
      if (_T_5) begin
        if (_T_6) begin
          rowBuffer_1_15 <= rowBuffer_2_15;
        end
      end
    end
    if (reset) begin
      rowBuffer_1_16 <= 8'hff;
    end else if (!(_T_4)) begin
      if (_T_5) begin
        if (_T_6) begin
          rowBuffer_1_16 <= rowBuffer_2_16;
        end
      end
    end
    if (reset) begin
      rowBuffer_1_17 <= 8'hff;
    end else if (!(_T_4)) begin
      if (_T_5) begin
        if (_T_6) begin
          rowBuffer_1_17 <= rowBuffer_2_17;
        end
      end
    end
    if (reset) begin
      rowBuffer_1_18 <= 8'hff;
    end else if (!(_T_4)) begin
      if (_T_5) begin
        if (_T_6) begin
          rowBuffer_1_18 <= rowBuffer_2_18;
        end
      end
    end
    if (reset) begin
      rowBuffer_1_19 <= 8'hff;
    end else if (!(_T_4)) begin
      if (_T_5) begin
        if (_T_6) begin
          rowBuffer_1_19 <= rowBuffer_2_19;
        end
      end
    end
    if (reset) begin
      rowBuffer_2_0 <= 8'hff;
    end else if (!(_T_4)) begin
      if (_T_5) begin
        if (5'h0 == x) begin
          rowBuffer_2_0 <= io_dataRead;
        end
      end
    end
    if (reset) begin
      rowBuffer_2_1 <= 8'hff;
    end else if (!(_T_4)) begin
      if (_T_5) begin
        if (5'h1 == x) begin
          rowBuffer_2_1 <= io_dataRead;
        end
      end
    end
    if (reset) begin
      rowBuffer_2_2 <= 8'hff;
    end else if (!(_T_4)) begin
      if (_T_5) begin
        if (5'h2 == x) begin
          rowBuffer_2_2 <= io_dataRead;
        end
      end
    end
    if (reset) begin
      rowBuffer_2_3 <= 8'hff;
    end else if (!(_T_4)) begin
      if (_T_5) begin
        if (5'h3 == x) begin
          rowBuffer_2_3 <= io_dataRead;
        end
      end
    end
    if (reset) begin
      rowBuffer_2_4 <= 8'hff;
    end else if (!(_T_4)) begin
      if (_T_5) begin
        if (5'h4 == x) begin
          rowBuffer_2_4 <= io_dataRead;
        end
      end
    end
    if (reset) begin
      rowBuffer_2_5 <= 8'hff;
    end else if (!(_T_4)) begin
      if (_T_5) begin
        if (5'h5 == x) begin
          rowBuffer_2_5 <= io_dataRead;
        end
      end
    end
    if (reset) begin
      rowBuffer_2_6 <= 8'hff;
    end else if (!(_T_4)) begin
      if (_T_5) begin
        if (5'h6 == x) begin
          rowBuffer_2_6 <= io_dataRead;
        end
      end
    end
    if (reset) begin
      rowBuffer_2_7 <= 8'hff;
    end else if (!(_T_4)) begin
      if (_T_5) begin
        if (5'h7 == x) begin
          rowBuffer_2_7 <= io_dataRead;
        end
      end
    end
    if (reset) begin
      rowBuffer_2_8 <= 8'hff;
    end else if (!(_T_4)) begin
      if (_T_5) begin
        if (5'h8 == x) begin
          rowBuffer_2_8 <= io_dataRead;
        end
      end
    end
    if (reset) begin
      rowBuffer_2_9 <= 8'hff;
    end else if (!(_T_4)) begin
      if (_T_5) begin
        if (5'h9 == x) begin
          rowBuffer_2_9 <= io_dataRead;
        end
      end
    end
    if (reset) begin
      rowBuffer_2_10 <= 8'hff;
    end else if (!(_T_4)) begin
      if (_T_5) begin
        if (5'ha == x) begin
          rowBuffer_2_10 <= io_dataRead;
        end
      end
    end
    if (reset) begin
      rowBuffer_2_11 <= 8'hff;
    end else if (!(_T_4)) begin
      if (_T_5) begin
        if (5'hb == x) begin
          rowBuffer_2_11 <= io_dataRead;
        end
      end
    end
    if (reset) begin
      rowBuffer_2_12 <= 8'hff;
    end else if (!(_T_4)) begin
      if (_T_5) begin
        if (5'hc == x) begin
          rowBuffer_2_12 <= io_dataRead;
        end
      end
    end
    if (reset) begin
      rowBuffer_2_13 <= 8'hff;
    end else if (!(_T_4)) begin
      if (_T_5) begin
        if (5'hd == x) begin
          rowBuffer_2_13 <= io_dataRead;
        end
      end
    end
    if (reset) begin
      rowBuffer_2_14 <= 8'hff;
    end else if (!(_T_4)) begin
      if (_T_5) begin
        if (5'he == x) begin
          rowBuffer_2_14 <= io_dataRead;
        end
      end
    end
    if (reset) begin
      rowBuffer_2_15 <= 8'hff;
    end else if (!(_T_4)) begin
      if (_T_5) begin
        if (5'hf == x) begin
          rowBuffer_2_15 <= io_dataRead;
        end
      end
    end
    if (reset) begin
      rowBuffer_2_16 <= 8'hff;
    end else if (!(_T_4)) begin
      if (_T_5) begin
        if (5'h10 == x) begin
          rowBuffer_2_16 <= io_dataRead;
        end
      end
    end
    if (reset) begin
      rowBuffer_2_17 <= 8'hff;
    end else if (!(_T_4)) begin
      if (_T_5) begin
        if (5'h11 == x) begin
          rowBuffer_2_17 <= io_dataRead;
        end
      end
    end
    if (reset) begin
      rowBuffer_2_18 <= 8'hff;
    end else if (!(_T_4)) begin
      if (_T_5) begin
        if (5'h12 == x) begin
          rowBuffer_2_18 <= io_dataRead;
        end
      end
    end
    if (reset) begin
      rowBuffer_2_19 <= 8'hff;
    end else if (!(_T_4)) begin
      if (_T_5) begin
        if (5'h13 == x) begin
          rowBuffer_2_19 <= io_dataRead;
        end
      end
    end
    if (reset) begin
      outputPixel <= 8'hff;
    end else if (!(_T_4)) begin
      if (!(_T_5)) begin
        if (_T_15) begin
          if (_T_22) begin
            outputPixel <= 8'h0;
          end else if (_T_37) begin
            outputPixel <= 8'h0;
          end else begin
            outputPixel <= 8'hff;
          end
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
  wire [7:0] accelerator_io_dataRead; // @[SystemTop.scala 19:27]
  wire  accelerator_io_writeEnable; // @[SystemTop.scala 19:27]
  wire [7:0] accelerator_io_dataWrite; // @[SystemTop.scala 19:27]
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
  assign dataMemory_io_dataWrite = {{24'd0}, accelerator_io_dataWrite}; // @[SystemTop.scala 29:27]
  assign dataMemory_io_testerEnable = io_testerDataMemEnable; // @[SystemTop.scala 36:30]
  assign dataMemory_io_testerAddress = io_testerDataMemAddress; // @[SystemTop.scala 33:31]
  assign dataMemory_io_testerWriteEnable = io_testerDataMemWriteEnable; // @[SystemTop.scala 37:35]
  assign dataMemory_io_testerDataWrite = io_testerDataMemDataWrite; // @[SystemTop.scala 35:33]
  assign accelerator_clock = clock;
  assign accelerator_reset = reset;
  assign accelerator_io_start = io_start; // @[SystemTop.scala 24:24]
  assign accelerator_io_dataRead = dataMemory_io_dataRead[7:0]; // @[SystemTop.scala 27:27]
endmodule
