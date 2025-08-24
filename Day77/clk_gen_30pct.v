`timescale 1ns/1ps

module clk_gen_30pct(output reg clk);
    initial clk = 0;
    
    // Total period = 100 ns (10 MHz)
    // High time = 30 ns (30% duty)
    // Low time = 70 ns (70% duty)
    always begin
        clk = 1;
        #30;    // HIGH for 30 ns
        clk = 0;
        #70;    // LOW for 70 ns
    end
endmodule

