module dec3to8(output [7:0] Y, input [2:0] A, input EN);

  assign Y = EN ? (1 << A) : 8'b00000000;

endmodule

