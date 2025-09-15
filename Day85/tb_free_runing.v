`timescale 1ns/1ps
module tb_free_running_counter;

    reg clk;
    reg rst;
    wire [7:0] count;

    free_running_counter uut (
        .clk(clk),
        .rst(rst),
        .count(count)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst = 1;
        #10 rst = 0;
        #200 $finish;
    end

    initial begin
        $monitor("Time=%0t | Count=%d", $time, count);
    end

endmodule

