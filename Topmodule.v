//control unit
module CONTROL(clk,rst,unused,go,out);
  input clk,rst;
  
  output [4:0] unused;
  output [7:0] go;
  output [31:0] out;
   
  wire [31:0] INSTR;  
  wire [4:0] RS,RT,RD;
  wire [15:0] ADR;
  wire [8:0] ADDRESS;
  wire [7:0] PC;
  wire [31:0] IN1,IN2;
  wire [4:0] SHAMT;
  wire [15:0] CONSTANT;
  wire W_EN,R_EN,BRANCH;
  wire [5:0] OPCODE;
  wire [31:0] ANS,ANS1;
   
  program_counter_instruction_memory rom1(clk,rst,INSTR,PC);
  DECODER dec(INSTR,OPCODE,RS,RT,RD,SHAMT,CONSTANT,ADR,ADDRESS,unused,W_EN,R_EN,BRANCH);
  registerfile regs(clk,rst,RS,RT,RD,OUT,IN1,IN2);
  ALU  alu(IN1,IN2,SHAMT,CONSTANT,OPCODE,ANS);
  datamemory data_mem(clk,rst,W_EN,R_EN,PC,BRANCH,ADR,ADDRESS,INSTR,ANS1,go);
  OUTPUT out1(clk,rst,R_EN,RD,ANS,ANS1,out);
sevensegment segdis(clk1,sw,ANS,seg,an);
Endmodule
