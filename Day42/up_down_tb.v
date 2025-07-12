`timescale 1ns/1ps

module updown_counter_tb;

    reg clk, reset, up_down;
    wire [3:0] count;

    updown_counter uut (
        .clk(clk),
        .reset(reset),
        .up_down(up_down),
        .count(count)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $display("Time\tclk rst up_down | count");
        $monitor("%0dns\t  %b   %b    %b     |  %b", $time, clk, reset, up_down, count);

        reset = 1; up_down = 1; #10;
        reset = 0;

        #40;

        up_down = 0; // start counting down
        #40;

        reset = 1; #10;
        reset = 0;

        up_down = 1; #30;

        $finish;
    end

endmodule

