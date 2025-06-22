module tb_signed_subtractor_4bit;
    reg  [3:0] a, b;
    wire [3:0] result;
    wire overflow;

    signed_subtractor_4bit uut (
        .a(a),
        .b(b),
        .result(result),
        .overflow(overflow)
    );

    initial begin
        $display("A     B     Result Overflow");
        $monitor("%b %b => %b     %b", a, b, result, overflow);

        a = 4'b0011; b = 4'b0001; #10;  // 3 - 1 = 2
        a = 4'b1000; b = 4'b0001; #10;  // -8 - 1 = -9 (overflow)
        a = 4'b0111; b = 4'b1111; #10;  // 7 - (-1) = 8 (overflow)
        a = 4'b1100; b = 4'b1101; #10;  // -4 - (-3) = -1
        a = 4'b0000; b = 4'b0001; #10;  // 0 - 1 = -1
        a = 4'b1111; b = 4'b1111; #10;  // -1 - (-1) = 0

        $finish;
    end
endmodule
module tb_signed_subtractor_4bit;
    reg  [3:0] a, b;
    wire [3:0] result;
    wire overflow;

    signed_subtractor_4bit uut (
        .a(a),
        .b(b),
        .result(result),
        .overflow(overflow)
    );

    initial begin
        $display("A     B     Result Overflow");
        $monitor("%b %b => %b     %b", a, b, result, overflow);

        a = 4'b0011; b = 4'b0001; #10;  // 3 - 1 = 2
        a = 4'b1000; b = 4'b0001; #10;  // -8 - 1 = -9 (overflow)
        a = 4'b0111; b = 4'b1111; #10;  // 7 - (-1) = 8 (overflow)
        a = 4'b1100; b = 4'b1101; #10;  // -4 - (-3) = -1
        a = 4'b0000; b = 4'b0001; #10;  // 0 - 1 = -1
        a = 4'b1111; b = 4'b1111; #10;  // -1 - (-1) = 0

        $finish;
    end
endmodule

