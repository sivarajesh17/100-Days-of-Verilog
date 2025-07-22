module arithmetic_right_shifter (
    input clk,
    input reset,
    input [3:0] din,
    input enable,
    output reg [3:0] dout
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            dout <= 4'b0000;
        else if (enable)
            dout <= {dout[3], dout[3:1]};  // Arithmetic shift: replicate MSB
        else
            dout <= din;
    end

endmodule

