// jk_latch_tb.v
`timescale 1ns/1ps

module jk_latch_tb;

    reg J, K, clk;
    wire Q, Qbar;

    // Instantiate the JK latch
    jk_latch uut (
        .J(J),
        .K(K),
        .clk(clk),
        .Q(Q),
        .Qbar(Qbar)
    );

    // Generate clock (just for simulating enable behavior)
    always #5 clk = ~clk;

    initial begin
        // Initialize signals
        clk = 0; J = 0; K = 0;

        $display("Time\tJ K | Q Qbar");
        $monitor("%0dns\t%b %b | %b  %b", $time, J, K, Q, Qbar);

        #10 J = 0; K = 0;  // No change
        #10 J = 0; K = 1;  // Reset
        #10 J = 1; K = 0;  // Set
        #10 J = 1; K = 1;  // Toggle
        #10 J = 1; K = 1;  // Toggle again
        #10 J = 0; K = 0;  // Hold
        #10 $finish;
    end

endmodule

