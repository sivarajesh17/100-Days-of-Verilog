`timescale 1ns/1ps

module bcd_counter_tb;

    reg clk, reset, enable;
    wire [3:0] q;

    bcd_counter uut (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .q(q)
    );

    initial begin
        clk = 0;
        forever #20 clk = ~clk;  
    end

    initial begin
        $display("Time\tReset En | Q");
        $monitor("%0dns\t  %b     %b | %d", $time, reset, enable, q);

      
        reset = 1; enable = 0; #10;
        reset = 0;
        enable = 1; #100;
        #50;
        enable = 0; #30;
        enable = 1; #50;
        reset = 1; #10;
        reset = 0; #20;

        $finish;
    end

endmodule

