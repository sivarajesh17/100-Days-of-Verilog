module subtractor_4bit (
    input  [3:0] a,         // Minuend
    input  [3:0] b,         // Subtrahend
    output [3:0] diff,      // Difference
    output       borrow_out // Borrow out
);
    wire [4:0] temp;

    assign temp = {1'b0, a} - {1'b0, b}; // Extend to 5 bits to catch borrow
    assign diff = temp[3:0];
    assign borrow_out = temp[4]; // If MSB is 0, borrow occurred
endmodule

