module tb_parity;
    parameter N = 8;
    reg  [N-1:0] data_in;
    wire parity_even, parity_odd;
    integer i; 

    
    parity_gen_chk #(N) uut (
        .data_in(data_in),
        .parity_even(parity_even),
        .parity_odd(parity_odd)
    );

    initial begin
        $display("Data_in    EvenP  OddP");
        for (i = 0; i < 10; i = i + 1) begin
            data_in = $random;
            #1 $display("%b   %b     %b", data_in, parity_even, parity_odd);
        end
        $finish;
    end
endmodule

