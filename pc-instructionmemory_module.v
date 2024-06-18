//instruction memory
module program_counter_instruction_memory(
    input clk, rst,
    output [31:0] instr,
    output reg [7:0] pc
    );

    reg [31:0] ROM [12:0]; // ROM containing instructions

    // Initializing ROM with instructions
    initial begin
     ROM[0]  = 32'b00000000000000110001000001000000;
     ROM[1]  = 32'b00000000010000110001000001000001;
     ROM[2]  = 32'b00000000110000110001000001000010;
     ROM[3]  = 32'b00000000000000000110000010000011;
     ROM[4]  = 32'b00000000000000000000100010000100;
     ROM[5]  = 32'b00000000000000000010000111000101;
      
     ROM[6]  = 32'b00000000000001100000100000000110;
     ROM[7]  = 32'b00000000000000000011100011000111;
      
     ROM[8]  = 32'b00000000000000000000010000001000;
     ROM[9]  = 32'b00000000001001000000001100001001;
     ROM[10] = 32'b00000000001001001000001100001010;
     ROM[11] = 32'b00000000001001001000010000001011;
     ROM[12] = 32'b00000000000001000001100001000000;

    end

    // Program counter logic
    always @(posedge clk, posedge rst) begin
        if (rst == 1)
            pc <= 0;
        else
            pc <= pc + 1;
    end

    // Output instruction based on program counter
    assign instr = ROM[pc];                 

endmodule
