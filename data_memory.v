//data memory
module datamemory(
  input w_en,r_en,branch,clk,rst,             //w_en,r_en to choose whether to write in memory or just read from memory
  input [15:0] address,                        // from instruction memory-address of memory location   
  input [7:0] pc,
  input [31:0] adr,                            // address from instruction for lw,sw command-constant+rs
  input [31:0] instr,
   output reg [15:0] go,
   output reg [31:0] ans1                    // output by load ord command
);
   reg[31:0] data_mem [7:0];                 // initiating the DATA MEMORY

initial
  begin
    data_mem[0]=32'b 0000000000000000000000000000001;
    data_mem[1]=32'b 0000000000000000000000000000010;
    data_mem[2]=32'b 0000000000000000000000000000011;
    data_mem[3]=32'b 0000000000000000000000000000000;
    data_mem[4]=32'b 0000000000000000000000000000100;
    data_mem[5]=32'b 0000000000000000000000000000001;
    data_mem[6]=32'b 0000000000000000000000000000110;
    data_mem[7]=32'b 0000000000000000000000000000111;
end

always@(posedge clk,posedge rst)
  begin
   if (r_en==1)
    ans1 <= data_mem[adr];                   //load value from adress in ans1
   else if (w_en==1)
   data_mem[adr]<= ans1;                     // save value of ans1 in memory address
   else if (branch==1)
       go <=pc;    
  end
endmodule

