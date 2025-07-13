`timescale 1ns/1ps

module ring_counter_tb;

    reg clk, reset;
    wire [3:0] out;

    ring_counter uut (
        .clk(clk),
        .reset(reset),
        .out(out)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $display("Time\tclk rst | out");
        $monitor("%0dns\t  %b   %b  | %b", $time, clk, reset, out);

        reset = 1; #10;
        reset = 0;

        #100;

        reset = 1; #10;
        reset = 0;

        #50;
        $finish;
    end

endmodule

