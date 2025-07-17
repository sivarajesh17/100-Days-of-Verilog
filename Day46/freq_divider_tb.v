`timescale 1ns/1ps

module freq_divider_tb;

    reg clk_in, reset;
    wire clk_out;

    freq_divider #(4) uut (
        .clk_in(clk_in),
        .reset(reset),
        .clk_out(clk_out)
    );

    initial begin
        clk_in = 0;
        forever #2 clk_in = ~clk_in;  // 4ns clock period
    end

    initial begin
        $display("Time\tclk_in reset | clk_out");
        $monitor("%0dns\t   %b      %b   |    %b", $time, clk_in, reset, clk_out);

        reset = 1; #5;
        reset = 0;

        #100;

        reset = 1; #5;
        reset = 0;

        #50;
f        $finish;
    end

endmodule

