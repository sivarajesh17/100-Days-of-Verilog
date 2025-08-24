`timescale 1ns/1ps

module tb_clk_gen_30pct;
    wire clk;

    // Instantiate DUT
    clk_gen_30pct uut(.clk(clk));

    initial begin
        $dumpfile("clk_gen_30pct.vcd");
        $dumpvars(0, tb_clk_gen_30pct);
        #500 $finish;  // Run for 500 ns
    end
endmodule

