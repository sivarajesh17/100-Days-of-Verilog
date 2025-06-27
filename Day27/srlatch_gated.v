
module sr_gated_latch (
    input wire S,
    input wire R,
    input wire EN,
    output reg Q,
    output wire Qn
);

assign Qn = ~Q;

always @(*) begin
    if (EN) begin
        case ({S, R})
            2'b00: Q = Q;       
            2'b01: Q = 0;       
            2'b10: Q = 1;       
            2'b11: Q = 1'bx;   
        endcase
    end
end

endmodule

