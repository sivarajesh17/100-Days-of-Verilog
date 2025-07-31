module fifo (
    input clk,
    input wr_en,
    input rd_en,
    input [7:0] data_in,
    output reg [7:0] data_out
);
    reg [7:0] mem [31:0];
    reg [4:0] wr_ptr, rd_ptr;

    initial begin
        wr_ptr = 0;
        rd_ptr = 0;
        data_out = 0;
    end

    always @(posedge clk) begin
        if (wr_en) begin
            mem[wr_ptr] = data_in;
            wr_ptr = wr_ptr + 1;
        end else if (rd_en) begin
            data_out = mem[rd_ptr];
            rd_ptr = rd_ptr + 1;
        end
    end
endmodule

