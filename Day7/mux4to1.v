module mux4to1_behavioral(output reg Y, input I0, I1, I2, I3, input S0, S1);
  always @(*) begin
    case ({S1, S0})
      2'b00: Y = I0;
      2'b01: Y = I1;
      2'b10: Y = I2;
      2'b11: Y = I3;
    endcase
  end
endmodule

