//register file
module registerfile(
  input clk,rst,
  input [4:0] rs,rt,rd,                      //address from decoder of regfile
  input [31:0] out,
  output reg [31:0] in1,in2            // inputs of operation  
  );
  integer i;   // for "FOR LOOP" in regfile                          
   reg [31:0] reg_file [7:0]; // creating REGISTER FILE of 16 bits and depth of 8 bits

initial  
  begin
    reg_file[0] = 32'b00000000000000000000000000000001;
    reg_file[1] = 32'b00000000000000000000000000000101;
    reg_file[2] = 32'b00000000000000000000000000000011;
    reg_file[3] = 32'b00000000000000000000000000000100;
    reg_file[4] = 32'b00000000000000000000000000000101;
    reg_file[5] = 32'b00000000000000000000000000000111;
    reg_file[6] = 32'b00000000000000000000000000001000;
    reg_file[7] = 32'b00000000000000000000000000001001;
  end

  always@(posedge clk,posedge rst)                                  // setting in1 and in2 according to the address we got from instructions
begin
  in1 = reg_file[rs];
  in2 = reg_file[rt];
  //dest = reg_file[rd];                      // dest in the destination register
end
                      
endmodule
