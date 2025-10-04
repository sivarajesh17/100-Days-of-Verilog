module stopwatch (
    input clk,         // clock input (1 Hz or divided clock)
    input reset,       // asynchronous reset
    input start_stop,  // start/stop control
    input clear,       // clear stopwatch
    output reg [3:0] sec_ones, // seconds ones digit
    output reg [3:0] sec_tens, // seconds tens digit
    output reg running          // flag showing stopwatch is running
);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            sec_ones <= 0;
            sec_tens <= 0;
            running <= 0;
        end 
        else if (clear) begin
            sec_ones <= 0;
            sec_tens <= 0;
        end 
        else if (start_stop) begin
            running <= ~running; // toggle start/stop
        end 
        else if (running) begin
            if (sec_ones == 9) begin
                sec_ones <= 0;
                if (sec_tens == 5)
                    sec_tens <= 0;
                else
                    sec_tens <= sec_tens + 1;
            end 
            else
                sec_ones <= sec_ones + 1;
        end
    end
endmodule

