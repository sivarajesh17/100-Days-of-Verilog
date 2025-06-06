module mux2to1_tb();
reg a,b,s;
wire y;
mux2to1 uut(a,b,s,y);
initial begin
$display("Time\ta b s | y");
$monitor("%0t\t%b %b %b | %b", $time, a, b, s, y);

// Test all combinations
a = 0; b = 0; s = 0; #10;
a = 0; b = 1; s = 0; #10;
a = 1; b = 0; s = 0; #10;
a = 1; b = 1; s = 0; #10;

a = 0; b = 0; s = 1; #10;
a = 0; b = 1; s = 1; #10;
a = 1; b = 0; s = 1; #10;
a = 1; b = 1; s = 1; #10;

    $finish;
  end

endmodule
