module universal_shift_register #(parameter N = 8)(
    input clk,
    input reset,
    input [1:0] mode,          // 00: Hold, 01: Shift Right, 10: Shift Left, 11: Parallel Load
    input [N-1:0] parallel_in, // Parallel data input
    input serial_in_left,      // Serial input for left shift
    input serial_in_right,     // Serial input for right shift
    output reg [N-1:0] q       // Register output
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= {N{1'b0}};
        else begin
            case (mode)
                2'b00: q <= q;                                      // Hold
                2'b01: q <= {serial_in_left, q[N-1:1]};              // Shift Right
                2'b10: q <= {q[N-2:0], serial_in_right};             // Shift Left
                2'b11: q <= parallel_in;                             // Parallel Load
            endcase
        end
    end

endmodule

