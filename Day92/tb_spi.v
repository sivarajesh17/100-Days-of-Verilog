module tb_spi;
    reg clk, rst_n, start;
    reg [7:0] master_data, slave_data;
    wire sclk, mosi, miso, cs_n, done;
    wire [7:0] miso_data, rx_data;

    spi_master UMASTER (
        .clk(clk), .rst_n(rst_n), .start(start),
        .mosi_data(master_data), .sclk(sclk),
        .mosi(mosi), .miso(miso),
        .miso_data(miso_data), .cs_n(cs_n), .done(done)
    );

    spi_slave USLAVE (
        .sclk(sclk), .cs_n(cs_n), .mosi(mosi), .miso(miso),
        .rx_data(rx_data), .tx_data(slave_data)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst_n = 0; start = 0; master_data = 8'hA5; slave_data = 8'h3C;
        #20 rst_n = 1;

        #50 start = 1; #10 start = 0;

        wait(done);
        $display("Master sent: %h, received: %h", master_data, miso_data);
        $display("Slave received: %h", rx_data);

        #100 $stop;
    end
endmodule

