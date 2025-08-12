module tb_nbit_comparator;

    parameter N = 4;
    reg  [N-1:0] A, B;
    wire A_eq_B, A_gt_B, A_lt_B;

    nbit_comparator #(N) uut (
        .A(A),
        .B(B),
        .A_eq_B(A_eq_B),
        .A_gt_B(A_gt_B),
        .A_lt_B(A_lt_B)
    );

    initial begin
        A = 4'd5; B = 4'd5; #10;
        A = 4'd8; B = 4'd3; #10;
        A = 4'd2; B = 4'd7; #10;
        A = 4'd4; B = 4'd4; #10;
        $finish;
    end

    initial begin
        $monitor("Time=%0t | A=%d B=%d | EQ=%b GT=%b LT=%b",
                 $time, A, B, A_eq_B, A_gt_B, A_lt_B);
    end

endmodule

