//output
module OUTPUT(
  input clk,rst,r_en,
  input [31:0] ans,ans1,
  input [4:0] rd,
  output [31:0] out
);
  //assign out = reg_file[rd];
  reg [31:0] out_ch;
  always@(*)
     begin
       if (r_en == 1)
         out_ch=ans1;
       else
         out_ch=ans;
      end
  assign out=out_ch;
 endmodule
