`timescale 1ns/1ps

module alu_tb;

    reg [3:0] A, B;
    reg [2:0] sel;
    wire [3:0] Y;
    wire carry, zero;

    alu uut (
        .A(A),
        .B(B),
        .sel(sel),
        .Y(Y),
        .carry(carry),
        .zero(zero)
    );

    initial begin
        $display("Time\tA B sel | Y carry zero");
        $monitor("%0dns\t%b %b  %b  | %b   %b     %b", $time, A, B, sel, Y, carry, zero);

        A = 4'b0101; B = 4'b0011;

        sel = 3'b000; #10;  // ADD
        sel = 3'b001; #10;  // SUB
        sel = 3'b010; #10;  // AND
        sel = 3'b011; #10;  // OR
        sel = 3'b100; #10;  // XOR
        sel = 3'b101; #10;  // NOT A
        sel = 3'b110; #10;  // SHL
        sel = 3'b111; #10;  // SHR

f        $finish;
    end

endmodule

