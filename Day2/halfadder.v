module halfadder(input a,b,
		 output sum,carry);
assign sum=a^b;
assign carry=a&b;
endmodule

/*module halfadder(input a,b,
		   output sum,carry);
xor G1(sum,a,b);
and G2(carry,a,b);
endmodule
  
*/
