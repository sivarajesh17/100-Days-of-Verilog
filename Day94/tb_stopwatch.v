module tb_stopwatch;
    reg clk, reset, start_stop, clear;
    wire [3:0] sec_ones, sec_tens;
    wire running;

    stopwatch uut (
        .clk(clk),
        .reset(reset),
        .start_stop(start_stop),
        .clear(clear),
        .sec_ones(sec_ones),
        .sec_tens(sec_tens),
        .running(running)
    );

    // Clock generation (1 Hz equivalent for simulation)
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10 time units period
    end

    initial begin
        reset = 1; start_stop = 0; clear = 0;
        #20 reset = 0;

        // Start stopwatch
        #10 start_stop = 1; #10 start_stop = 0;

        // Run for 70 cycles
        repeat (70) @(posedge clk);

        // Stop stopwatch
        #10 start_stop = 1; #10 start_stop = 0;

        // Wait and then clear
        #50 clear = 1; #10 clear = 0;

        #50 $stop;
    end
endmodule

