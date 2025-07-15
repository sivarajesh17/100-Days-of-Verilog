`timescale 1ns/1ps

module modulo_counter_tb;

    reg clk, reset;
    wire [2:0] count;

    modulo_counter #(5) uut (
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
        $monitor("%0dns\t  %b   %b  |  %d", $time, clk, reset, count);

        reset = 1; #10;
        reset = 0;

        #100;

        reset = 1; #10;
        reset = 0;

        #50;
        $finish;
    end

endmodule

