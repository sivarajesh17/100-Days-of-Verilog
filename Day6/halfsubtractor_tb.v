module hs_tb();
reg  a,b;
wire diff,borr;
hs uut(.a(a),.b(b),.difference(diff),.borrow(borr));
initial begin
$display("Time\ta\tb\tdifference\tborrow");
$monitor("%0dns\t%b\t%b\t%b\t%b",$time,a,b,diff,borr);
a=0;b=0;#10;
a=0;b=1;#10;
a=1;b=0;#10;
a=1;b=1;#10;
$finish;
end
endmodule
