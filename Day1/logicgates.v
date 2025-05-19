module logic_gates (
    input A, B,
    output AND_out, OR_out, XOR_out, NOT_A_out, NOT_B_out, NAND_out, NOR_out, XNOR_out
);

    assign AND_out = A & B;
    assign OR_out = A | B;
    assign XOR_out = A ^ B;
    assign NOT_A_out = ~A;
    assign NOT_B_out = ~B;
    assign NAND_out = ~(A & B);
    assign NOR_out = ~(A | B);
    assign XNOR_out = ~(A ^ B);

endmodule
