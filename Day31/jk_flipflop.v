module jk_flipflop (
    input J,
    input K,
    input clk,
    output reg Q,
    output Qbar
);

    assign Qbar = ~Q;

    initial Q = 0;

    always @(posedge clk) begin
        case ({J, K})
            2'b00: Q <= Q;
            2'b01: Q <= 0;
            2'b10: Q <= 1;
            2'b11: Q <= ~Q;
        endcase
    end

endmodule

