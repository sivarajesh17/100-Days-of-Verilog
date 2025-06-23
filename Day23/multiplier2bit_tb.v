`timescale 1ns/1ps

module multiplier2bit_tb;

  reg  [1:0] a;
  reg  [1:0] b;
  wire [3:0] product;

  // Instantiate the multiplier
  multiplier2bit uut (
    .a(a),
    .b(b),
    .product(product)
  );

  initial begin
    $display("Time\t a b | product");
    $monitor("%0t\t %b %b | %b", $time, a, b, product);

    // Test all possible combinations
    a = 2'b00; b = 2'b00; #10;
    a = 2'b00; b = 2'b01; #10;
    a = 2'b00; b = 2'b10; #10;
    a = 2'b00; b = 2'b11; #10;

    a = 2'b01; b = 2'b00; #10;
    a = 2'b01; b = 2'b01; #10;
    a = 2'b01; b = 2'b10; #10;
    a = 2'b01; b = 2'b11; #10;

    a = 2'b10; b = 2'b00; #10;
    a = 2'b10; b = 2'b01; #10;
    a = 2'b10; b = 2'b10; #10;
    a = 2'b10; b = 2'b11; #10;

    a = 2'b11; b = 2'b00; #10;
    a = 2'b11; b = 2'b01; #10;
    a = 2'b11; b = 2'b10; #10;
    a = 2'b11; b = 2'b11; #10;

    $finish;
  end

endmodule

