module nbit_comparator #(parameter N = 4)(
    input  [N-1:0] A,
    input  [N-1:0] B,
    output A_eq_B,
    output A_gt_B,
    output A_lt_B
);

    assign A_eq_B = (A == B);
    assign A_gt_B = (A >  B);
    assign A_lt_B = (A <  B);

endmodule

