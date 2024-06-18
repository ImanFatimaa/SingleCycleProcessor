// Code your testbench here
// or browse Examples
module testbench();
    // Inputs
    reg clk, rst;
    
    // Outputs
    wire [31:0] out;
    wire [4:0] unused;
    wire [7:0] go;
    
    // Instantiate the control unit
    CONTROL control_unit(
        .clk(clk),
        .rst(rst),
        .unused(unused),
        .go(go),
        .out(out)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Reset generation
    initial begin
        rst = 1;
        #10 rst = 0;
    end

    // Stimulus
    initial begin
        // Wait for some time
      clk=0;
     // rst=0;
        #20;

        // At this point, the reset should be done and the system should be running

        // Perform some operations, e.g., read and write to registers, execute instructions, etc.
        // You can create sequences of instructions and corresponding expected outputs to validate the functionality of your design
        
        // End simulation
        #130 $finish;
    end
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
  end
endmodule
