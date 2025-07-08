module pipo (
    input clk,
    input reset,
    input load,
    input [3:0] din,
    output reg [3:0] dout
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            dout <= 4'b0000;
        else if (load)
            dout <= din;
    end

endmodule

