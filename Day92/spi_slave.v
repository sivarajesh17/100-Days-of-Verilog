module spi_slave (
    input sclk,
    input cs_n,
    input mosi,
    output reg miso,
    output reg [7:0] rx_data,
    input [7:0] tx_data
);
    reg [2:0] bit_cnt;
    reg [7:0] shifter;

    always @(negedge cs_n) begin
        bit_cnt <= 7;
        shifter <= tx_data;
    end

    always @(posedge sclk) begin
        if (!cs_n) begin
            rx_data[bit_cnt] <= mosi;
            miso <= shifter[bit_cnt];
            if (bit_cnt > 0)
                bit_cnt <= bit_cnt - 1;
        end
    end
endmodule

