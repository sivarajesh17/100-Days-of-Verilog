`timescale 1ns/1ps

module down_counter_tb;

    reg clk, reset;
    wire [3:0] count;

    down_counter uut (
        .clk(clk),
        .reset(reset),
        .count(count)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $display("Time\tclk rst | count");
        $monitor("%0dns\t  %b   %b  |  %b", $time, clk, reset, count);

        reset = 1; #10;
        reset = 0;

        #100;

        reset = 1; #10;
        reset = 0;

        #50;
        $finish;
    end

endmodule

