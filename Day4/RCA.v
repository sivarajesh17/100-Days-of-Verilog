module fulladder(input a,b,cin,
		 output sum,carry);
assign sum=a^b^cin;
assign carry=(a&b)|(b&cin)|(cin&a);
endmodule

module rca(
    input  [3:0] A,
    input  [3:0] B,
    input        Cin,
    output [3:0] Sum,
    output       Cout
);
  wire c1, c2, c3;

  fulladder fa0 (A[0], B[0], Cin,  Sum[0], c1);
  fulladder fa1 (A[1], B[1], c1,   Sum[1], c2);
  fulladder fa2 (A[2], B[2], c2,   Sum[2], c3);
  fulladder fa3 (A[3], B[3], c3,   Sum[3], Cout);

endmodule 
