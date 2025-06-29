module t_latch (
    input T,
    input enable,
    output reg Q,
    output reg Qbar
);

    initial begin
        Q = 0;
        Qbar = 1;
    end

    always @(*) begin
        if (enable) begin
            if (T)
                Q <= ~Q;
        end
        Qbar <= ~Q;
    end

endmodule

