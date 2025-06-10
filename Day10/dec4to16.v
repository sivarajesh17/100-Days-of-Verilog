module dec4to16(output reg [15:0] Y, input [3:0] A, input EN);

  always @(*) begin
    if (EN)
      Y = 16'b1 << A;
    else
      Y = 16'b0;
  end

endmodule

