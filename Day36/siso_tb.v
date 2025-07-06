`timescale 1ns/1ps

module siso_tb;

    reg clk, reset, din;
    wire dout;

    siso uut (
        .clk(clk),
        .reset(reset),
        .din(din),
        .dout(dout)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $display("Time\tclk rst din | dout");
        $monitor("%0dns\t  %b   %b   %b  |   %b", $time, clk, reset, din, dout);

        reset = 1; din = 0; #10;
        reset = 0;

        din = 1; #10;
        din = 0; #10;
        din = 1; #10;
        din = 1; #10;
        din = 0; #10;
        din = 0; #10;
        din = 0; #10;
        din = 1; #10;

        #10 $finish;
    end

endmodule

