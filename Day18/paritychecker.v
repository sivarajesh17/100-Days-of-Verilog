module paritychecker (
    input [7:0] data,        // 8-bit data
    input parity_bit,        // Provided parity bit
    output reg error         // Output: 1 if parity error, else 0
);

    always @(*) begin
        // Even parity: parity_bit should make total number of 1's even
        if (^data ^ parity_bit) // ^ is reduction XOR
            error = 1; // Parity error
        else
            error = 0; // No error
    end

endmodule

