`timescale 1ns/1ps
module tb_dual_edge_dff;
    reg clk;
    reg rst;
    reg d;
    wire q;
    wire qbar;

    dual_edge_dff uut (
        .clk(clk),
        .rst(rst),
        .d(d),
        .q(q),
        .qbar(qbar)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst = 1; d = 0;
        #10 rst = 0;
        #10 d = 1;
        #10 d = 0;
        #10 d = 1;
        #20 $finish;
    end

    initial begin
        $monitor("Time=%0t | clk=%b d=%b q=%b qbar=%b", $time, clk, d, q, qbar);
    end

endmodule

