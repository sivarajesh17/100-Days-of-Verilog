
`timescale 1ns/1ps
module tb_counter_dff_sequence;
    reg clk;
    reg rst;
    wire [2:0] q;

    counter_sequence uut (
        .clk(clk),
        .rst(rst),
        .q(q)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst = 1;
        #10 rst = 0;
        #100 $finish;
    end

    initial begin
        $monitor("Time=%0t | Count=%d", $time, q);
    end
endmodule
