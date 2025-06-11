module comparator1bit (
    input A, B,
    output A_gt_B, A_eq_B, A_lt_B
);

    assign A_gt_B = (A > B);
    assign A_eq_B = (A == B);
    assign A_lt_B = (A < B);

endmodule

