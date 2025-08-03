`timescale 1ns/1ps

module sequence_detector_101_tb;

    reg clk = 0;
    reg reset;
    reg in_bit;
    wire detected;

    sequence_detector_101 uut (
        .clk(clk),
        .reset(reset),
        .in_bit(in_bit),
        .detected(detected)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        $display("Time\tin_bit  detected");
        $monitor("%0dns\t   %b       %b", $time, in_bit, detected);

        // Initialize
        reset = 1; in_bit = 0; #10;
        reset = 0;

        // Input sequence: 1 0 1 => DETECTED
        in_bit = 1; #10;
        in_bit = 0; #10;
        in_bit = 1; #10;

        // Input sequence: 0 1 => No detection
        in_bit = 0; #10;
        in_bit = 1; #10;

        // Input sequence: 0 1 0 1 => DETECTED again
        in_bit = 0; #10;
        in_bit = 1; #10;
        in_bit = 0; #10;
        in_bit = 1; #10;

        $finish;
    end

endmodule

