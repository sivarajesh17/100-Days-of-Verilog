`timescale 1ns/1ps

module async_up_counter_tb;

    reg clk, rst_n;
    wire [3:0] q;

    async_up_counter uut (
        .clk(clk),
        .rst_n(rst_n),
        .q(q)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $display("Time\tReset Q");
        $monitor("%0dns\t  %b   %b", $time, rst_n, q);

        rst_n = 0; #10;
        rst_n = 1; #100;
        rst_n = 0; #10;
        rst_n = 1; #50;
        $finish;
    end

endmodule

