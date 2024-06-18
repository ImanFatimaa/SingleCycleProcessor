module sevensegment(
    input clk1,
	  input sw,
    input [31:0] out,
    output [6:0] seg,
    output [3:0] an
    );
  
    reg [3:0] sw1,sw2,sw3,sw4;
    wire [6:0] seg0, seg1, seg2, seg3;
  
  //coverting the 16-bit input into 4 4-bits number   
    // Slice the input number into four 4-bit segments
	 always@(*) begin
	 case(sw)
	 1'b0: begin
     sw1 = out[3:0];
     sw2 = out[7:4];
     sw3 = out[11:8];
     sw4 = out[15:12];
	 end
	 1'b1: begin
	    sw1 = out[19:16];
       sw2 = out[23:20];
       sw3 = out[27:24];
       sw4 = out[31:28];
     	 end
	 endcase
	 end

  //converting the 4-bit number to display it on seven segment display
  sseg_display s0(.hex(sw1), .seg(seg0));     
  sseg_display s1(.hex(sw2), .seg(seg1));     
  sseg_display s2(.hex(sw3), .seg(seg2));     
  sseg_display s3(.hex(sw4), .seg(seg3));     
 
  //callinng the module tp display the number on fpga
    sseg_mux display(.clk1(clk1), .rst(1'b0), .dig0(seg0), .dig1(seg1), .dig2(seg2), .dig3(seg3), .an(an), .sseg(seg));
endmodule

//Doing the time multiplexing on our output
module sseg_mux(
    input clk1, rst,
    input [6:0] dig0, dig1, dig2, dig3,
    output reg [3:0] an,
    output reg [6:0] sseg
    );
  
    // refresh rate of ~1526Hz (100 MHz / 2^16)
    localparam BITS = 18;
  wire [BITS - 1 : 0] q;
    counter_n #(.BITS(BITS)) counter(.clk1(clk1), .rst(rst), .q(q));
     
 
     
    always @*
      case (q[BITS - 1 : BITS - 2])
            2'b00:
                begin
                    an = 4'b1110;
                    sseg = dig0;
                end
            2'b01:
                begin
                    an = 4'b1101;
                    sseg = dig1;
                end
            2'b10:
                begin
                    an = 4'b1011;
                    sseg = dig2;
                end
            default:
                begin
                    an = 4'b0111;
                    sseg = dig3;
                end
        endcase                         
endmodule
