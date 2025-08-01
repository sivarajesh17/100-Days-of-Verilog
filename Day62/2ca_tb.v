`timescale 1ns/1ps

module twos_complement_adder_tb;

    reg signed [3:0] a, b;
    wire signed [4:0] sum;

    twos_complement_adder uut (
        .a(a),
        .b(b),
        .sum(sum)
    );

    initial begin
        $display("Time\ta   b   | sum");
        $monitor("%0dns\t%d  %d  |  %d", $time, a, b, sum);

        a = 4'd3;   b = 4'd2;   #10;  //  3 + 2 = 5
        a = -4'd3;  b = 4'd2;   #10;  // -3 + 2 = -1
        a = -4'd4;  b = -4'd3;  #10;  // -4 + -3 = -7
        a = 4'd7;   b = -4'd5;  #10;  //  7 + (-5) = 2
        a = -4'd8;  b = -4'd1;  #10;  // -8 + -1 = -9 (overflow)

        $finish;
    end

endmodule

