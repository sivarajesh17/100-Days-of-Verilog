module d_with_sr (
    input D,
    input clk,
    output Q,
    output Qbar
);

    wire S, R;

    assign S = D;
    assign R = ~D;

    sr_flipflop sr_ff (
        .S(S),
        .R(R),
        .clk(clk),
        .Q(Q),
        .Qbar(Qbar)
    );

endmodule

