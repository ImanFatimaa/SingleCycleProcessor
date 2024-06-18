module tb_alu();

    reg [31:0] in1, in2;
    reg [4:0] shamt;
    reg [5:0] opcode;
    reg [15:0] constant;
    wire [31:0] ans;

    // Instantiate the module
    ALU alu(
        .in1(in1),
        .in2(in2),
        .shamt(shamt),
        .opcode(opcode),
        .constant(constant),
        .ans(ans)
    );

    // Testbench inputs
    initial begin
        in1 = 32'b11001100;
        in2 = 32'b00110011;
        shamt = 5'b10101;
        opcode = 6'b001100;
        constant = 16'b1010101010101010;
        #50;
      //or
      in1 = 32'b11001100;
        in2 = 32'b00110011;
        shamt = 5'b10101;
        opcode = 6'b000100;
        constant = 16'b1010101010101010;
        #50;
      //and
      in1 = 32'b11000000;
        in2 = 32'b00110000;
        shamt = 5'b00101;
        opcode = 6'b00011;
        constant = 16'b1010101010101010;
        #50;
        $finish;
    end
 initial 
    begin
        $dumpfile("tb_alu.vcd"); 
        $dumpvars(0, tb_alu);
    end
endmodule

