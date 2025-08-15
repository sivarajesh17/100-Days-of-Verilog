`timescale 1ns/1ps  // Match the same timescale

module tb_clk_gen_100mhz;
    wire clk;

    // Instantiate DUT
    clk_gen_100mhz uut (.clk(clk));

    initial begin
        $dumpfile("clk_gen_100mhz.vcd");
        $dumpvars(0, tb_clk_gen_100mhz);
        #100 $finish;  // Run simulation for 100 ns
    end
endmodule

