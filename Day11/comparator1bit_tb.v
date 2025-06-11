module tb_comparator1bit_tb();
    reg A;
    reg B;
    wire A_gt_B;
    wire A_eq_B;
    wire A_lt_B;

    // Instantiate the Unit Under Test (UUT)
    comparator1bit uut (
        .A(A), 
        .B(B), 
        .A_gt_B(A_gt_B), 
        .A_eq_B(A_eq_B), 
        .A_lt_B(A_lt_B)
    );

    initial begin
        $display("A B | A_gt_B A_eq_B A_lt_B");
        $display("--------------------------");

        // Test case 1: A=0, B=0
        A = 0; B = 0; #10;
        $display("%b %b |   %b      %b      %b", A, B, A_gt_B, A_eq_B, A_lt_B);

        // Test case 2: A=0, B=1
        A = 0; B = 1; #10;
        $display("%b %b |   %b      %b      %b", A, B, A_gt_B, A_eq_B, A_lt_B);

        // Test case 3: A=1, B=0
        A = 1; B = 0; #10;
        $display("%b %b |   %b      %b      %b", A, B, A_gt_B, A_eq_B, A_lt_B);

        // Test case 4: A=1, B=1
        A = 1; B = 1; #10;
        $display("%b %b |   %b      %b      %b", A, B, A_gt_B, A_eq_B, A_lt_B);

        $finish;
    end

endmodule

