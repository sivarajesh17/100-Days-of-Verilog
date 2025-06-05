module fs_tb();
reg a,b,bin;
wire diff,borr;
fs uut(.a(a),.b(b),.bin(bin),.difference(diff),.borrow(borr));
initial begin
$display("Time]\ta\tb\tbin\tdiffference\tborrow");
$monitor("%0dns\t%b\t%b\t%b\t%b\t%b",$time,a,b,bin,diff,borr);
a=0;b=0;bin=0;#10;
a=0;b=0;bin=1;#10;
a=0;b=1;bin=0;#10;
a=0;b=1;bin=1;#10;
a=1;b=0;bin=0;#10;
a=1;b=0;bin=1;#10;
a=1;b=1;bin=0;#10;
a=1;b=1;bin=1;#10;
$finish;
end
endmodule

