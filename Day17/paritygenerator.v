module paritygenerator (
    input  [3:0] data,
    output       even_parity,
    output       odd_parity
);
    assign even_parity = ~(^data);  // XOR all bits, then invert for even parity
    assign odd_parity  =  ^data;    // XOR all bits for odd parity

endmodule

