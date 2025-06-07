module demux_1to16 (
    input wire din,              // Data input
    input wire [3:0] sel,        // Selection input (4-bit)
    output reg [15:0] y          // 16-bit output
);

    integer i;

    always @(*) begin
        y = 16'b0;  // Clear all outputs
        if (din) begin
            for (i = 0; i < 16; i = i + 1) begin
                if (sel == i)
                    y[i] = 1'b1;
            end
        end
    end

endmodule

