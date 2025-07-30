`timescale 1ns/1ps

module lfsr_tb;

    reg clk, reset;
    wire [3:0] q;

    lfsr uut (
        .clk(clk),
        .reset(reset),
        .q(q)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $display("Time\tLFSR");
        $monitor("%0dns\t%b", $time, q);

        reset = 1; #10;
        reset = 0; #100;

        $finish;
    end

endmodule

