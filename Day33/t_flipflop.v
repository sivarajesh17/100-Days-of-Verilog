module t_flipflop (
    input T,
    input clk,
    output reg Q,
    output Qbar
);

    assign Qbar = ~Q;

    initial Q = 0;

    always @(posedge clk) begin
        if (T)
            Q <= ~Q;
    end

endmodule

