`timescale 1ns/1ps

module tb_self_reload_counter;

parameter WIDTH = 4;
parameter LOAD_VALUE = 4'd5;

reg clk;
reg reset;
wire [WIDTH-1:0] count;

self_reload_counter #(
    .WIDTH(WIDTH),
    .LOAD_VALUE(LOAD_VALUE)
) dut (
    .clk(clk),
    .reset(reset),
    .count(count)
);

always #5 clk = ~clk;

initial begin
    $monitor("Time=%0t | reset=%b | count=%d", $time, reset, count);
    clk = 0;
    reset = 1;
    #10 reset = 0;
    #100 $stop;
end

endmodule

