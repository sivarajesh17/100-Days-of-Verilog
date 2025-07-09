
module piso (
    input clk,
    input reset,
    input load,
    input [3:0] din,
    output dout
);

    reg [3:0] shift;

    assign dout = shift[3];

    always @(posedge clk or posedge reset) begin
        if (reset)
            shift <= 4'b0000;
        else if (load)
            shift <= din;
        else
            shift <= {shift[2:0], 1'b0};
    end

endmodule
