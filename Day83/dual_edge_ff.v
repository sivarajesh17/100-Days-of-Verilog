module dual_edge_dff (
    input wire clk,
    input wire rst,
    input wire d,
    output reg q,
    output reg qbar
);

    always @(posedge clk or negedge clk or posedge rst) begin
        if (rst) begin
            q    <= 1'b0;
            qbar <= 1'b1;
        end else begin
            q    <= d;
            qbar <= ~d;
        end
    end

endmodule

