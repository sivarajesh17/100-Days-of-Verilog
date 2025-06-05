module fs(input a,b,bin,
	  output difference,borrow);
assign difference=a^b^bin;
assign borrow=((~a)&b)|(b&bin)|(bin&(~a));
endmodule
