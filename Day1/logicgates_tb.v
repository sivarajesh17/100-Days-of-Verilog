module tb_logic_gates;

    reg A, B;
    wire AND_out, OR_out, XOR_out, NOT_A_out, NOT_B_out, NAND_out, NOR_out, XNOR_out;

    logic_gates uut (
        .A(A), 
        .B(B), 
        .AND_out(AND_out), 
        .OR_out(OR_out), 
        .XOR_out(XOR_out), 
        .NOT_A_out(NOT_A_out), 
        .NOT_B_out(NOT_B_out), 
        .NAND_out(NAND_out), 
        .NOR_out(NOR_out), 
        .XNOR_out(XNOR_out)
    );

    initial begin
        $monitor("A = %b, B = %b, AND = %b, OR = %b, XOR = %b, NOT_A = %b, NOT_B = %b, NAND = %b, NOR = %b, XNOR = %b", 
                 A, B, AND_out, OR_out, XOR_out, NOT_A_out, NOT_B_out, NAND_out, NOR_out, XNOR_out);
        
        A = 0; B = 0; #10;
        A = 0; B = 1; #10;
        A = 1; B = 0; #10;
        A = 1; B = 1; #10;

        $finish;
    end

endmodule

