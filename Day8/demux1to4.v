module demux_1to4(
    input wire din,
    input wire [1:0] sel,
    output wire y0,
    output wire y1,
    output wire y2,
    output wire y3
);

assign y0 = (~sel[1] & ~sel[0]) & din;
assign y1 = (~sel[1] &  sel[0]) & din;
assign y2 = ( sel[1] & ~sel[0]) & din;
assign y3 = ( sel[1] &  sel[0]) & din;

endmodule

