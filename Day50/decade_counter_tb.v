`timescale 1ns/1ps

module decade_counter_tb;

    reg clk, reset;
    wire [3:0] count;

    decade_counter uut (
        .clk(clk),
        .reset(reset),
        .count(count)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns period
    end

    initial begin
        $display("Time\tclk rst | count");
        $monitor("%0dns\t  %b   %b  |  %d", $time, clk, reset, count);

        reset = 1; #10;
        reset = 0;

        #200; // Let it run for 20 clocks

        reset = 1; #10;
        reset = 0;

        #100;
        $finish;
    end

endmodule

