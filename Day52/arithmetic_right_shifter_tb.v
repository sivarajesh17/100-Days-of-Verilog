`timescale 1ns/1ps

module arithmetic_right_shifter_tb;

    reg clk, reset, enable;
    reg [3:0] din;
    wire [3:0] dout;

    arithmetic_right_shifter uut (
        .clk(clk),
        .reset(reset),
        .din(din),
        .enable(enable),
        .dout(dout)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $display("Time\tclk rst en  din  | dout");
        $monitor("%0dns\t  %b   %b   %b  %b |  %b", $time, clk, reset, enable, din, dout);

        reset = 1; din = 4'b0000; enable = 0; #10;
        reset = 0;

        din = 4'b1010; enable = 0; #10;  // Load signed value -6
        enable = 1; #10;  // Shift
        #10;              // Shift again
        #10;

        din = 4'b0100; enable = 0; #10;  // Load positive value +4
        enable = 1; #10;
        #10;

        $finish;
    end

endmodule

