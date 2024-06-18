module testbench;

    // Parameters
    parameter CLK_PERIOD = 10; // Clock period in ns

    // Inputs
    reg clk;
    reg rst;

    // Outputs
    wire [31:0] instr;
    wire [7:0] pc;

    // Instantiate the module to be tested
    program_counter_instruction_memory dut (
        .clk(clk),
        .rst(rst),
        .instr(instr),
        .pc(pc)
    );

    // Clock generation
    always #((CLK_PERIOD / 2)) clk = ~clk;

    // Initial reset
    initial begin
        clk = 0;
        rst = 1; // Assert reset
        #20;    // Wait for 20 time units
        rst = 0; // De-assert reset
    end

    // Stimulus
    initial begin
        // Wait for a few clock cycles
        #100;

        // Monitor instruction output and program counter
        $display("Time  PC  Instruction");
        $monitor("%d    %h    %h", $time, pc, instr);

        // Simulate for 13 clock cycles
        repeat (13) begin
            #CLK_PERIOD; // Wait for one clock cycle
        end

        // End simulation
        $finish;
    end
initial begin
  $dumpfile("dump.vcd"); $dumpvars;
  end
endmodule
