module uart_rx #(
    parameter CLK_FREQ = 50000000,   // 50 MHz system clock
    parameter BAUD_RATE = 9600
)(
    input  wire clk,
    input  wire rst_n,
    input  wire rx,           // UART RX line
    output reg  [7:0] rx_data,// received byte
    output reg  rx_done,      // high for 1 clk when byte is received
    output reg  rx_busy       // high while receiving
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

    // RX FSM
    reg [3:0] bit_idx;
    reg [7:0] data_buf;
    reg [1:0] state;

    localparam IDLE  = 2'b00;
    localparam START = 2'b01;
    localparam DATA  = 2'b10;
    localparam STOP  = 2'b11;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state   <= IDLE;
            bit_idx <= 0;
            data_buf<= 0;
            rx_data <= 0;
            rx_done <= 0;
            rx_busy <= 0;
        end else begin
            rx_done <= 0; // default
            if (baud_tick) begin
                case (state)
                    IDLE: begin
                        if (!rx) begin  // start bit detected
                            state   <= START;
                            rx_busy <= 1;
                            bit_idx <= 0;
                        end
                    end
                    START: begin
                        // sample in middle of start bit
                        if (!rx) state <= DATA;
                        else     state <= IDLE;
                    end
                    DATA: begin
                        data_buf[bit_idx] <= rx;
                        bit_idx <= bit_idx + 1;
                        if (bit_idx == 7) state <= STOP;
                    end
                    STOP: begin
                        if (rx) begin
                            rx_data <= data_buf;
                            rx_done <= 1;
                        end
                        rx_busy <= 0;
                        state   <= IDLE;
                    end
                endcase
            end
        end
    end

endmodule

