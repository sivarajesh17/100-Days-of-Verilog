module d_latch_mux(
    input D,
    input EN,
    output Q
);
    wire mux_out;
    reg q_reg;

    assign mux_out = EN ? D : q_reg;

    always @(*) begin
        q_reg = mux_out;
    end

    assign Q = q_reg;

endmodule

