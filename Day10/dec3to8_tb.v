module dec3to8_tb;

  reg [2:0] A;
  reg EN;
  wire [7:0] Y;

  dec3to8 uut (
    .Y(Y),
    .A(A),
    .EN(EN)
  );

  initial begin
    $display("Time\tEN A\tY");
    $monitor("%0t\t%b  %b\t%b", $time, EN, A, Y);

    EN = 0; A = 3'b000; #10; // Disabled
    EN = 1; A = 3'b000; #10;
    A = 3'b001; #10;
    A = 3'b010; #10;
    A = 3'b011; #10;
    A = 3'b100; #10;
    A = 3'b101; #10;
    A = 3'b110; #10;
    A = 3'b111; #10;
    EN = 0; A = 3'b101; #10; // Disabled again

    $finish;
  end

endmodule

