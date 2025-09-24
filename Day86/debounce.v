module debounce (
    input  wire clk,       // system clock
    input  wire rst_n,     // active-low reset
    input  wire noisy_btn, // raw button input (noisy)
    output reg  clean_btn  // debounced output
);

    reg [15:0] counter;
    reg btn_sync1, btn_sync2;
    reg btn_state;

    // Synchronize noisy button to clock domain
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            btn_sync1 <= 0;
            btn_sync2 <= 0;
        end else begin
            btn_sync1 <= noisy_btn;
            btn_sync2 <= btn_sync1;
        end
    end

    // Debounce logic with counter
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            counter   <= 0;
            btn_state <= 0;
            clean_btn <= 0;
        end else begin
            if (btn_sync2 != btn_state) begin
                counter <= counter + 1;
                if (counter == 16'hFFFF) begin
                    btn_state <= btn_sync2;
                    clean_btn <= btn_sync2;
                    counter   <= 0;
                end
            end else begin
                counter <= 0;
            end
        end
    end

endmodule

