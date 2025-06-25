module sr_latch (
    input S,     // Set
    input R,     // Reset
    output reg Q,
    output Q_bar
);

    always @ (S or R)
    begin
        case ({S, R})
            2'b00: ;              // No change
            2'b01: Q <= 0;        // Reset
            2'b10: Q <= 1;        // Set
            2'b11: Q <= 1'bx;     // Invalid state
        endcase
    end

    assign Q_bar = ~Q;

endmodule

