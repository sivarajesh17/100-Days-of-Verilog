module d_flipflop (
    input D,
    input clk,
    output reg Q,
    output Qbar
);

    assign Qbar = ~Q;

    initial Q = 0;

    always @(posedge clk) begin
        Q <= D;
    end

endmodule

