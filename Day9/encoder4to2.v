module enc4to2(output [1:0] Y, input [3:0] D);

  assign Y = (D == 4'b0001) ? 2'b00 :
             (D == 4'b0010) ? 2'b01 :
             (D == 4'b0100) ? 2'b10 :
             (D == 4'b1000) ? 2'b11 :
             2'bxx; // Invalid input

endmodule

