module dec4to16_tb;

  reg [3:0] A;
  reg EN;
  wire [15:0] Y;

  // Instantiate one version (choose one):
  dec4to16 uut (.Y(Y), .A(A), .EN(EN));
  // decoder4to16_behavioral uut (.Y(Y), .A(A), .EN(EN));

  integer i; // Loop control variable

  initial begin
    $display("Time\tEN A\tY");
    $monitor("%0t\t%b  %b\t%b", $time, EN, A, Y);

    EN = 0; A = 4'b0000; #10; // Disabled state

    EN = 1;
    for (i = 0; i < 16; i = i + 1) begin
      A = i;
      #10;
    end

    EN = 0; #10; // Disable after testing

    $finish;
  end

endmodule


