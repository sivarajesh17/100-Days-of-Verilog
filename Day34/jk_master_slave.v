module jk_master_slave (
    input J,
    input K,
    input clk,
    output reg Q,
    output Qbar
);

    reg master_q;

    assign Qbar = ~Q;

    always @(*) begin
        if (clk) begin
            case ({J, K})
                2'b00: master_q = Q;
                2'b01: master_q = 0;
                2'b10: master_q = 1;
                2'b11: master_q = ~Q;
            endcase
        end
    end

    always @(negedge clk) begin
        Q <= master_q;
    end

endmodule

