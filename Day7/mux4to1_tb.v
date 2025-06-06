module mux4to1_tb();
reg [3:0]i;
reg[1:0]s;
wire y;
mux4to1 uut(i,s,y);
initial begin
$display("Time\ti\ts\ty");
$monitor("%0dns\t%0b\t%0b\t%0b",$time,i,s,y);
i=4'b1010;
s=2'b00;#10;
s=2'b01;#10;
s=2'b10;#10;
s=2'b11;#10;
$finish;
end 
endmodule
