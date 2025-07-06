module siso (
    input clk,
    input reset,
    input din,
    output dout
);

    reg [3:0] shift;

    assign dout = shift[3];

    always @(posedge clk or posedge reset) begin
        if (reset)
            shift <= 4'b0000;
        else
            shift <= {shift[2:0], din};
    end

endmodule

