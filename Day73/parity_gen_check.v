module parity_gen_chk #(
    parameter N = 8  
)(
    input   [N-1:0] data_in,
    output parity_even,
    output  parity_odd
);
    assign parity_even = ^data_in;  
    assign parity_odd  = ~^data_in;
endmodule

