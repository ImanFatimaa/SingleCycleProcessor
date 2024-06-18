//alu module
module ALU(
  input [31:0] in1,in2,
  input [4:0] shamt,
  input [5:0] opcode,
  input [15:0] constant,
  output reg [31:0] ans
           );
  // r-type
  always@(*)
  begin  
  if (opcode==0)
      ans=in1+in2;
    else if (opcode==1)
      ans=in1<<shamt;
    else if (opcode==2)
      ans=in1>>shamt;
    else if (opcode==3)
      ans=in1|in2;
    else if(opcode==4)
      ans=in1&in2;
    else if (opcode==5)
      ans=in1*in2;
   //i-type   
    else if (opcode>=6 && opcode<=7)
       begin
     if (opcode==6)
      ans=in1+constant;
  
     else if (opcode==7)
      ans=constant;
      end
	end
endmodule
