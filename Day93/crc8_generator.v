module crc8_generator (
    input clk,
    input rst_n,
    input data_in,
    input data_valid,
    output reg [7:0] crc_out
);
    parameter POLY = 8'h07;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            crc_out <= 8'h00;
        else if (data_valid) begin
            if (crc_out[7] ^ data_in)
                crc_out <= (crc_out << 1) ^ POLY;
            else
                crc_out <= (crc_out << 1);
        end
    end
endmodule

