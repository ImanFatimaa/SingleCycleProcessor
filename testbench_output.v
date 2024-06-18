`timescale 1ns / 1ps

module testbench;

    // Parameters
    parameter CLK_PERIOD = 10; // Clock period in ns

    // Inputs
    reg clk;
    reg rst;
    reg r_en;
    reg [31:0] ans;
    reg [31:0] ans1;
    reg [4:0] rd;

    // Outputs
    wire [31:0] out;

    // Instantiate the module to be tested
    OUTPUT dut (
        .clk(clk),
        .rst(rst),
        .r_en(r_en),
        .ans(ans),
        .ans1(ans1),
        .rd(rd),
        .out(out)
    );

    // Clock generation
    always #((CLK_PERIOD / 2)) clk = ~clk;

    // Initial reset
    initial begin
        clk = 0;
        rst = 1; // Assert reset
        r_en = 0;
        ans = 32'h00000000;
        ans1 = 32'h00000000;
        rd = 5'b00000;
        #20;    // Wait for 20 time units
        rst = 0; // De-assert reset
    end

    // Stimulus
    initial begin
        // Wait for a few clock cycles
        #100;

        // Apply some test values
        rst = 0;
        r_en = 0; // Initially set to 0
        ans = 32'hAAAAAAAA;
        ans1 = 32'h55555555;
        rd = 5'b00101;

        // Monitor output
        $display("Time  Output");
        $monitor("%d    %h", $time, out);

        // Wait for a few clock cycles
        #50;

        // Enable reading from ans1
        r_en = 1;

        // Wait for a few more clock cycles
        #50;

        // End simulation
        $finish;
    end

initial begin
  $dumpfile("dump.vcd"); $dumpvars;
end
endmodule
