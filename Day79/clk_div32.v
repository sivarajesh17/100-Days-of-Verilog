module clk_div32 (
    input  wire clk,      // input clock
    input  wire rst,      // active-high synchronous reset
    output reg  clk_out   // divided clock output
);

    reg [4:0] count;  // 5-bit counter for divide-by-32

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            count   <= 5'd0;
            clk_out <= 1'b0;
        end 
        else begin
            count <= count + 1'b1;

            // Toggle output when counter reaches 31 (full cycle)
            if (count == 5'd31) begin
                count   <= 5'd0;
                clk_out <= ~clk_out;  // toggle every 32 cycles
            end
        end
    end

endmodule

