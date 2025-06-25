`timescale 1ns / 1ps

module sr_latch_tb;

    reg S, R;
    wire Q, Q_bar;

    // Instantiate the SR latch module
    sr_latch uut (
        .S(S),
        .R(R),
        .Q(Q),
        .Q_bar(Q_bar)
    );

    initial begin
        $display("Time\tS R | Q Q_bar");
        $monitor("%g\t%b %b | %b %b", $time, S, R, Q, Q_bar);

        // Initial state
        S = 0; R = 0; #10;

        // Set state
        S = 1; R = 0; #10;

        // Hold state
        S = 0; R = 0; #10;

        // Reset state
        S = 0; R = 1; #10;

        // Hold state
        S = 0; R = 0; #10;

        // Invalid state
        S = 1; R = 1; #10;

        // Back to valid state
        S = 0; R = 0; #10;

        $finish;
    end

endmodule

