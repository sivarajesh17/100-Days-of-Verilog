module spi_master (
    input clk,
    input rst_n,
    input start,
    input [7:0] mosi_data,
    output reg sclk,
    output reg mosi,
    input miso,
    output reg [7:0] miso_data,
    output reg cs_n,
    output reg done
);
    reg [2:0] bit_cnt;
    reg [7:0] shifter;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            sclk <= 0;
            cs_n <= 1;
            done <= 0;
            bit_cnt <= 0;
            mosi <= 0;
            miso_data <= 0;
        end else begin
            if (start) begin
                cs_n <= 0;
                shifter <= mosi_data;
                bit_cnt <= 7;
                done <= 0;
            end else if (cs_n == 0) begin
                sclk <= ~sclk;
                if (sclk == 0) begin
                    mosi <= shifter[bit_cnt];
                    if (bit_cnt == 0) begin
                        cs_n <= 1;
                        done <= 1;
                    end else
                        bit_cnt <= bit_cnt - 1;
                end else begin
                    miso_data[bit_cnt] <= miso;
                end
            end
        end
    end
endmodule

