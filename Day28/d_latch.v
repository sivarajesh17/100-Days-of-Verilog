module d_latch (
    input D,
    input enable,
    output reg Q,
    output Qbar
);

    assign Qbar = ~Q;

    always @(*) begin
        if (enable)
            Q <= D;
    end

endmodule

