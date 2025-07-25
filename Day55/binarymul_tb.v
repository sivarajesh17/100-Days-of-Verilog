
`timescale 1ns/1ps

module binary_multiplier_tb;

    reg clk, reset, start;
    reg [3:0] A, B;
    wire [7:0] product;
    wire done;

    binary_multiplier uut (
        .clk(clk),
        .reset(reset),
        .start(start),
        .A(A),
        .B(B),
        .product(product),
        .done(done)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;  
    end

    initial begin
        $display("Time\tA B | Product | Done");
        $monitor("%0dns\t%d %d |   %d    |  %b", $time, A, B, product, done);

        reset = 1; start = 0; A = 0; B = 0; #10;
        reset = 0;

        A = 4'd5; B = 4'd3; start = 1; #10;
        start = 0;

        wait(done); #10;

        A = 4'd9; B = 4'd2; start = 1; #10;
        start = 0;

        wait(done); #10;

        $finish;
    end

endmodule
