//decoder
module DECODER( 
              
  input [31:0] instr,
  output [5:0] opcode,
  output [4:0] rd,rs,rt,shamt,unused,
  output [15:0] constant,adr,
  output [15:0] address,
  output w_en,branch,r_en
   );
  reg r_en,w_en,branch
  // splitting the 16 bits number in instr`~ROM
  //first getting the opcode and then divinding further adresses
  assign opcode = instr[5:0];
   //for R-type instructions
  assign   rd =  instr [10:6];
  assign   rs =  instr [15:11];
  assign   rt =  instr [20:16];
  assign shamt =  instr [25:21];       
    
    //for I-type instructions 
  assign constant =  instr [25:10];
  assign  adr =  instr [25:10];
  
    // unused bits that are being used for J-type instructions
    assign  address =  instr [21:6];
    assign  unused =  instr  [31:22];
    
always@(opcode)
begin
if (opcode==7)
  r_en<=1;
else
  r_en<=0;
if (opcode==8)
  w_en<=1;
else
  w_en<=0;
if (opcode==9)
  branch<=1;
else
  branch<=0;
end
    
endmodule
