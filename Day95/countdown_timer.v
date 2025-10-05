module countdown_timer (
    input clk,          // clock input (1Hz or divided clock)
    input reset,        // asynchronous reset
    input load,         // load preset value
    input start_stop,   // start or pause counting
    input [5:0] preset, // preset countdown value (0?59 seconds)
    output reg [5:0] count, // current countdown value
    output reg done     // becomes 1 when count reaches zero
);

    reg running;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            count <= 0;
            running <= 0;
            done <= 0;
        end 
        else if (load) begin
            count <= preset;
            done <= 0;
        end 
        else if (start_stop) begin
            running <= ~running; // toggle start/stop
        end 
        else if (running) begin
            if (count > 0)
                count <= count - 1;
            else
                done <= 1;
        end
    end
endmodule

