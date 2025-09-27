module tb_uart_tx;
    reg clk, rst_n, tx_start;
    reg [7:0] tx_data;
    wire tx, tx_busy;

    uart_tx #(.CLK_FREQ(50000000), .BAUD_RATE(9600)) uut (
        .clk(clk),
        .rst_n(rst_n),
        .tx_start(tx_start),
        .tx_data(tx_data),
        .tx(tx),
        .tx_busy(tx_busy)
    );

    // clock gen
    initial begin
        clk = 0;
        forever #10 clk = ~clk; // 50 MHz -> period = 20ns
    end

    initial begin
        rst_n = 0; tx_start = 0; tx_data = 0;
        #50 rst_n = 1;

        // Send a byte
        #100 tx_data = 8'hA5; // 1010_0101
        tx_start = 1; #20 tx_start = 0;

        // wait for tx to complete
        wait(!tx_busy);

        #200 $stop;
    end
endmodule

