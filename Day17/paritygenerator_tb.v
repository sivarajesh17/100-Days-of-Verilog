`timescale 1ns/1ps

module paritygenerator_tb;

    reg  [3:0] data;
    wire even_parity;
    wire odd_parity;

    // Instantiate the DUT (Device Under Test)
    paritygenerator uut (
        .data(data),
        .even_parity(even_parity),
        .odd_parity(odd_parity)
    );

    initial begin
        $display("Time\tData\tEven\tOdd");
        $monitor("%0dns\t%b\t%b\t%b", $time, data, even_parity, odd_parity);

        data = 4'b0000; #10;
        data = 4'b0001; #10;
        data = 4'b0011; #10;
        data = 4'b0111; #10;
        data = 4'b1111; #10;
        data = 4'b1010; #10;
        data = 4'b1001; #10;
        data = 4'b0101; #10;

        $finish;
    end

endmodule

