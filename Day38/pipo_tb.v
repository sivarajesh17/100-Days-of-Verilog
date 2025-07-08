`timescale 1ns/1ps

module pipo_tb;

    reg clk, reset, load;
    reg [3:0] din;
    wire [3:0] dout;

    pipo uut (
        .clk(clk),
        .reset(reset),
        .load(load),
        .din(din),
        .dout(dout)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $display("Time\tclk rst load din  | dout");
        $monitor("%0dns\t  %b   %b    %b   %b |  %b", $time, clk, reset, load, din, dout);

        reset = 1; load = 0; din = 4'b0000; #10;
        reset = 0;

        load = 1; din = 4'b1010; #10;
        load = 1; din = 4'b0101; #10;
        load = 0; din = 4'b1111; #10;

        #10 $finish;
    end

endmodule

