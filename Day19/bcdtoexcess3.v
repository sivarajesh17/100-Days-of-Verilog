module bcd_to_excess3 (
    input  [3:0] bcd,       // 4-bit BCD input (0000 to 1001)
    output [3:0] excess3    // 4-bit Excess-3 output
);
    assign excess3 = bcd + 4'd3; // Add 3 to convert BCD to Excess-3
endmodule

