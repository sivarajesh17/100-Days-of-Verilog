module comparator2bit_tb;

  reg [1:0] A, B;
  wire A_gt_B, A_eq_B, A_lt_B;

  comparator2bit uut (
    .A(A),
    .B(B),
    .A_gt_B(A_gt_B),
    .A_eq_B(A_eq_B),
    .A_lt_B(A_lt_B)
  );

  integer i, j;

  initial begin
    $display("Time\tA  B  | A>B A==B A<B");
    $monitor("%0t\t%b  %b  |  %b    %b    %b", $time, A, B, A_gt_B, A_eq_B, A_lt_B);

    for (i = 0; i < 4; i = i + 1) begin
      for (j = 0; j < 4; j = j + 1) begin
        A = i; B = j; #10;
      end
    end

    $finish;
  end

endmodule

