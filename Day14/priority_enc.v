module priority_enc(
    input [3:0] in,   // Input lines
    output reg [1:0] out, // Encoded output
    output reg valid      // Indicates if input is valid (any input is high)
);

always @(*) begin
    valid = 1;  // Assume valid unless no input is high
    casex (in)
        4'b1xxx: out = 2'b11; // Highest priority (bit 3)
        4'b01xx: out = 2'b10; // bit 2
        4'b001x: out = 2'b01; // bit 1
        4'b0001: out = 2'b00; // bit 0
        default: begin
            out = 2'b00;
            valid = 0;  // No valid input
        end
    endcase
end

endmodule

