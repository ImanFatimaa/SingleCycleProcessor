module decoder_testbench;

    // Parameters
    parameter CLK_PERIOD = 10; // Clock period in ns

    // Inputs
    reg [31:0] instr;

    // Outputs
    wire [5:0] opcode;
    wire [4:0] rd, rs, rt, shamt, unused;
    wire [15:0] constant, adr, address;
    wire w_en, branch, r_en;

    // Instantiate the module to be tested
    DECODER dut (
        .instr(instr),
        .opcode(opcode),
        .rd(rd),
        .rs(rs),
        .rt(rt),
        .shamt(shamt),
        .unused(unused),
        .constant(constant),
        .adr(adr),
        .address(address),
        .w_en(w_en),
        .branch(branch),
        .r_en(r_en)
    );

    // Clock generation
    reg clk = 0;
    always #((CLK_PERIOD / 2)) clk = ~clk;

    // Stimulus
    initial begin
        // Test vector 1
        instr = 32'b00000000000000010001000000000000; // Example instruction
        #10; // Wait for some time

        // Test vector 2
        instr = 32'b00000000011010001000000000010001; // Example instruction
        #10; // Wait for some time

        // Test vector 3
        instr = 32'b00000000011000001000000000000010; // Example instruction
        #10; // Wait for some time

        instr = 32'b00000000011000001000001100000010; // Example instruction
        #10; // Wait for some time
        instr = 32'b00110000001100000100000000110010; // Example instruction
        #10; // Wait for some time
       instr = 32'b00110000001100000100000000000111; // Example instruction
        #10; // Wait for some time
       instr = 32'b00110000001100000100000000001000; // Example instruction
        #10; // Wait for some time
      instr = 32'b00110000001100000100000000001001; // Example instruction
        #10; // Wait for some time
        // End simulation
        $finish;
    end


initial begin
  $dumpfile("dump.vcd"); $dumpvars;
end
endmodule
