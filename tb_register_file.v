module tb_register_file();

    reg clk, rst;
    reg [4:0] rs, rt, rd;
    reg [31:0] out;
    wire [31:0] in1, in2, dest;

    // Instantiate the module
    register_file rf(
        .clk(clk),
        .rst(rst),
        .rs(rs),
        .rt(rt),
        .rd(rd),
        .out(out),
        .in1(in1),
        .in2(in2),
        .dest(dest)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Reset generation
    initial begin
        rst = 1;
        #10;
        rst = 0;
        #10;
    end

    // Test sequence
    initial begin
        // Write operation
       out = 32'b10101010101010101010101010101010; // Data to be written
         rs = 3; // Select register 3 as rs
         rt = 3; // Select register 4 as rt
         rd = 3; // Select register 2 as rd
        
        #20; 
        #20 $finish;
    end

    // Dump VCD file
    initial begin
        $dumpfile("tb_register_file.vcd");
        $dumpvars(0, tb_register_file);
        #100;
        $finish;
    end
endmodule
