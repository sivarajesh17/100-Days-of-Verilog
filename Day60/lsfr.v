module lfsr (
    input clk,
    input reset,
    output reg [3:0] q
);

    wire feedback;
    assign feedback = q[3] ^ q[2];  // Example: taps at bit 3 and 2

    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 4'b0001;  // Non-zero seed
        else
            q <= {q[2:0], feedback};
    end

endmodule

