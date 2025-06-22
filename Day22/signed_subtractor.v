module signed_subtractor_4bit (
    input  [3:0] a,     // 4-bit signed input A
    input  [3:0] b,     // 4-bit signed input B
    output [3:0] result,// 4-bit signed result
    output overflow     // Overflow flag
);
    wire [4:0] a_ext = {a[3], a};  // Sign-extend a to 5 bits
    wire [4:0] b_ext = {b[3], b};  // Sign-extend b to 5 bits
    wire [4:0] diff = a_ext - b_ext;

    assign result = diff[3:0];  // Truncate to 4 bits
    assign overflow = (a[3] != b[3]) && (result[3] != a[3]);
endmodule

