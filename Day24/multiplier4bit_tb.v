module multiplier4bit_tb;

    // Inputs
    reg [3:0] A;
    reg [3:0] B;

    // Output
    wire [7:0] P;

    // Instantiate the Unit Under Test (UUT)
    multiplier4bit uut (
        .A(A),
        .B(B),
        .P(P)
    );

    initial begin
        // Display header
        $display("Time\tA\tB\tProduct");

        // Monitor outputs
        $monitor("%0t\t%0d\t%0d\t%0d", $time, A, B, P);

        // Test cases
        A = 4'd0; B = 4'd0; #10;
        A = 4'd3; B = 4'd2; #10;
        A = 4'd7; B = 4'd4; #10;
        A = 4'd15; B = 4'd15; #10;
        A = 4'd9; B = 4'd6; #10;
        A = 4'd12; B = 4'd5; #10;

        // Finish simulation
        $finish;
    end

endmodule

