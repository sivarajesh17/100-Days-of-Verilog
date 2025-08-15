`timescale 1ns/1ps  // Add this line

module clk_gen_100mhz(output reg clk);
    initial clk = 0;
    always #5 clk = ~clk;  // 10 ns period -> 100 MHz
endmodule

