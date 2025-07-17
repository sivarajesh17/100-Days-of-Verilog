module freq_divider #(parameter N = 4)(
    input clk_in,
    input reset,
    output reg clk_out
);

    reg [$clog2(N)-1:0] count;

    always @(posedge clk_in or posedge reset) begin
        if (reset) begin
            count <= 0;
            clk_out <= 0;
        end else begin
            if (count == (N/2 - 1)) begin
                clk_out <= ~clk_out;
                count <= 0;
            end else begin
                count <= count + 1;
            end
        end
    end

endmodule

