module adder_subtractor (
    input  [3:0] a,          // First operand
    input  [3:0] b,          // Second operand
    input        sel,        // 0: Add, 1: Subtract
    output [3:0] result,     // 4-bit result
    output       carry_out,  // Carry or borrow
    output       overflow
);
    wire [3:0] b_xor;
    wire carry_in;
    wire [4:0] sum;

    assign b_xor   = b ^ {4{sel}};     // If sel=1, take 2's complement of b
    assign carry_in = sel;             // 0 for addition, 1 for subtraction
    assign sum     = a + b_xor + carry_in;

    assign result    = sum[3:0];
    assign carry_out = sum[4];         // Carry or borrow
    assign overflow  = (a[3] ^ b_xor[3]) & ~(a[3] ^ result[3]); // Signed overflow
endmodule

