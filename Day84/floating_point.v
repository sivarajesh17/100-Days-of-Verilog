module simple_fpu (
    input  wire [31:0] a,      // 32-bit operand a (IEEE-754 format)
    input  wire [31:0] b,      // 32-bit operand b (IEEE-754 format)
    input  wire [1:0]  op,     // Operation selector: 00=ADD, 01=SUB, 10=AND, 11=OR
    output reg  [31:0] result  // 32-bit result (IEEE-754 format for ADD/SUB)
);

    always @(*) begin
        case (op)
            2'b00: result = a + b;     // ADD
            2'b01: result = a - b;     // SUB
            2'b10: result = a & b;     // AND (bitwise)
            2'b11: result = a | b;     // OR (bitwise)
            default: result = 32'b0;
        endcase
    end

endmodule

