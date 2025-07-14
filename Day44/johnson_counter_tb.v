`timescale 1ns/1ps

module johnson_counter_tb;

    reg clk;
    reg reset;
    wire [3:0] count;

    // Instantiate the Johnson counter
    johnson_counter uut (
        .clk(clk),
        .reset(reset),
        .count(count)
    );

    // Generate clock: 10ns period
    always #5 clk = ~clk;

    initial begin
        $display("Time\tReset\tCount");
        $monitor("%0dns\t%b\t%b", $time, reset, count);

        // Initialize
        clk = 0;
        reset = 1;

        // Release reset after some time
        #10 reset = 0;

        // Run simulation for some clock cycles
        #100;

        $finish;
    end

endmodule

