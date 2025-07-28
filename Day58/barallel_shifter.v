
module barrel_shifter (
    input [7:0] in,
    input [2:0] shift,
    input dir,
    output reg [7:0] out
);

    always @(*) begin
        case (dir)
            1'b0: out = in << shift;
            1'b1: out = in >> shift;
        endcase
    end

endmodule
