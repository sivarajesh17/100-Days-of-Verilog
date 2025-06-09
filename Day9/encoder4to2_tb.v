module encoder4to2_tb;

  reg [3:0] D;
  wire [1:0] Y;

  // Instantiate the encoder
  enc4to2 uut (
    .Y(Y),
    .D(D)
  );

  initial begin
    $display("Time\tD\t\tY");
    $monitor("%0t\t%b\t%b", $time, D, Y);

    // Apply one-hot inputs
    D = 4'b0001; #10;
    D = 4'b0010; #10;
    D = 4'b0100; #10;
    D = 4'b1000; #10;

    // Apply invalid inputs
    D = 4'b0000; #10;
    D = 4'b1010; #10;

    $finish;
  end

endmodule

