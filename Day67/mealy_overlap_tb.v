`timescale 1ns/1ps

module sequence_detector_101_overlap_mealy_tb;

    reg clk = 0;
    reg reset;
    reg in_bit;
    wire detected;

    sequence_detector_101_overlap_mealy uut (
        .clk(clk),
        .reset(reset),
        .in_bit(in_bit),
        .detected(detected)
    );

    always #5 clk = ~clk;

    initial begin
        $display("Time\tin_bit  detected");
        $monitor("%0dns\t   %b       %b", $time, in_bit, detected);

        reset = 1; in_bit = 0; #10;
        reset = 0;

        // Input pattern: 1 0 1 0 1 
        in_bit = 1; #10;
        in_bit = 0; #10;
        in_bit = 1; #10; // Detect 101
        in_bit = 0; #10;
        in_bit = 1; #10; 

        // One more test: 1 0 1
        in_bit = 1; #10;
        in_bit = 0; #10;
        in_bit = 1; #10; 

        $finish;
    end

endmodule

