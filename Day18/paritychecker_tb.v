module paritychecker_tb;

    reg [7:0] data;
    reg parity_bit;
    wire error;

    // Instantiate the Unit Under Test (UUT)
    paritychecker uut (
        .data(data),
        .parity_bit(parity_bit),
        .error(error)
    );

    initial begin
        $display("Time\tData\tParity Bit\tError");
        $monitor("%0t\t%b\t%b\t\t%b", $time, data, parity_bit, error);

        // Test Case 1: Correct even parity
        data = 8'b10101010;   // 4 ones
        parity_bit = 0;       // Even parity
        #10;

        // Test Case 2: Incorrect parity
        data = 8'b10101010;   // 4 ones
        parity_bit = 1;       // Odd parity => error
        #10;

        // Test Case 3: 3 ones => need parity_bit = 1
        data = 8'b00000111;   // 3 ones
        parity_bit = 1;
        #10;

        // Test Case 4: Incorrect parity
        data = 8'b00000111;   // 3 ones
        parity_bit = 0;
        #10;

        $finish;
    end

endmodule

