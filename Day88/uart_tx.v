module uart_tx #(
    parameter CLK_FREQ = 50000000,   // 50 MHz clock
    parameter BAUD_RATE = 9600       // default baud rate
)(
    input  wire clk,
    input  wire rst_n,
    input  wire tx_start,       // trigger to start transmission
    input  wire [7:0] tx_data,  // 8-bit data to transmit
    output reg  tx,             // UART TX line
    output reg  tx_busy         // High when transmitting
);

    // Baud rate generator
    localparam integer BAUD_TICK = CLK_FREQ / BAUD_RATE;
    reg [15:0] baud_cnt;
    reg baud_tick;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            baud_cnt  <= 0;
            baud_tick <= 0;
        end else begin
            if (baud_cnt == BAUD_TICK-1) begin
                baud_cnt  <= 0;
                baud_tick <= 1;
            end else begin
                baud_cnt  <= baud_cnt + 1;
                baud_tick <= 0;
            end
        end
    end

    // UART TX FSM
    reg [3:0] bit_idx;
    reg [9:0] tx_shift;  // start + 8 data + stop

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            tx       <= 1;   // idle = high
            tx_busy  <= 0;
            bit_idx  <= 0;
            tx_shift <= 10'b1111111111;
        end else begin
            if (tx_start && !tx_busy) begin
                // load shift register: start(0), data[7:0], stop(1)
                tx_shift <= {1'b1, tx_data, 1'b0};
                tx_busy  <= 1;
                bit_idx  <= 0;
            end else if (tx_busy && baud_tick) begin
                tx       <= tx_shift[bit_idx];
                bit_idx  <= bit_idx + 1;
                if (bit_idx == 9) begin
                    tx_busy <= 0; // done transmitting
                end
            end
        end
    end

endmodule

