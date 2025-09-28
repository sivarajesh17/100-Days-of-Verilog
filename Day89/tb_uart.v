module tb_uart_rx;
    reg clk, rst_n;
    reg rx;                 // we drive this manually
    wire [7:0] rx_data;
    wire rx_done, rx_busy;

    // Instantiate RX
    uart_rx #(.CLK_FREQ(50000000), .BAUD_RATE(9600)) URX (
        .clk(clk), .rst_n(rst_n),
        .rx(rx), .rx_data(rx_data),
        .rx_done(rx_done), .rx_busy(rx_busy)
    );

    // Clock generation (50 MHz)
    initial begin
        clk = 0;
        forever #10 clk = ~clk;
    end

    // Task to send one UART byte (LSB first)
    task send_byte;
        input [7:0] data;
        integer i;
        begin
            // Start bit
            rx = 0;
            #(104166); // ~1/9600s in ns for 50MHz clock (~104.16us)

            // 8 data bits
            for (i = 0; i < 8; i = i + 1) begin
                rx = data[i];
                #(104166);
            end

            // Stop bit
            rx = 1;
            #(104166);
        end
    endtask

    initial begin
        rst_n = 0; rx = 1; // idle line is high
        #200 rst_n = 1;

        // Send byte 0x55
        #500 send_byte(8'h55);

        wait(rx_done);
        $display("Received data = %h", rx_data);

        // Send another byte
        #2000 send_byte(8'hA3);

        wait(rx_done);
        $display("Received data = %h", rx_data);

        #2000 $stop;
    end
endmodule

