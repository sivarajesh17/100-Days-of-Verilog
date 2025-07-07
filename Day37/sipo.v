module sipo (
    input clk,
    input reset,
    input din,
    output reg [3:0] dout
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            dout <= 4'b0000;
        else
            dout <= {dout[2:0], din};
    end

endmodule
