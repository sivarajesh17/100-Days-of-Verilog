module sr_flipflop (
    input S,
    input R,
    input clk,
    output reg Q,
    output Qbar
);

    assign Qbar = ~Q;

    initial Q = 0;

    always @(posedge clk) begin
        if (S == 0 && R == 0)
            Q <= Q;
        else if (S == 0 && R == 1)
            Q <= 0;
        else if (S == 1 && R == 0)
            Q <= 1;
        else
            Q <= 1'bx;
    end

endmodule

