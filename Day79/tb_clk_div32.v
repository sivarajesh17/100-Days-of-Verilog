`timescale 1ns/1ps

module tb_clk_div32;

    reg clk;
    reg rst;
    wire clk_out;

    // Instantiate the divider
    clk_div32 uut (
        .clk(clk),
        .rst(rst),
        .clk_out(clk_out)
    );

    // Generate clock = 10ns period -> 100 MHz
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Stimulus
    initial begin
        rst = 1;
        #20;
        rst = 0;

        // Run simulation for 2000 ns
        #2000;
        $stop;
    end

endmodule

