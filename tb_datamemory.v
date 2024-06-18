module tb_datamemory();

    reg clk, rst, w_en, r_en, branch;
    reg [15:0] address;
    reg [7:0] pc;
    reg [31:0] adr, instr;
    wire [15:0] go;
    wire [31:0] ans1;

    // Instantiate the module
    datamemory dm(
        .clk(clk),
        .rst(rst),
        .w_en(w_en),
        .r_en(r_en),
        .branch(branch),
        .address(address),
        .pc(pc),
        .adr(adr),
        .instr(instr),
        .go(go),
        .ans1(ans1)
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
        w_en = 1;
        adr = 32'b0000000000000000;
      address=32'b11110000111100001111000011110000;
        instr = 32'b11110000111100001111000011110000;
        w_en = 0;
        #100; // Wait for some time
        
        // Read operation
        r_en = 1;
        adr = 32'b0000000000000000;
        r_en = 0;
        #100; // Wait for some time
        
        // Branch operation
        branch = 1;
        pc = 8'b00000001;
        branch = 0;
        #100; // Wait for some time

        // Check the values
        $display("go: %h, ans1: %h", go, ans1);
        $finish;
    end

    // Dump VCD file
    initial begin
        $dumpfile("tb_datamemory.vcd");
        $dumpvars(0, tb_datamemory);
        #1000; // Wait for some time
        $finish;
    end

endmodule
