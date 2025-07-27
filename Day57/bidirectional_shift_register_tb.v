`timescale 1ns/1ps

module bids_tb;

    reg clk, reset;
    reg [1:0] mode;
    reg [3:0] parallel_in;
    reg serial_in_left, serial_in_right;
    wire [3:0] q;

    bidirectional_shift_register uut (
        .clk(clk),
        .reset(reset),
        .mode(mode),
        .parallel_in(parallel_in),
        .serial_in_left(serial_in_left),
        .serial_in_right(serial_in_right),
        .q(q)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10ns clock period
    end

    initial begin
        $display("Time\tMode | q");
        $monitor("%0dns\t %b  | %b", $time, mode, q);

        reset = 1; mode = 2'b00; parallel_in = 4'b0000; serial_in_left = 0; serial_in_right = 0; #10;
        reset = 0;

        mode = 2'b11; parallel_in = 4'b1010; #10;   // Parallel Load
        mode = 2'b00; #10;                          // Hold
        mode = 2'b10; serial_in_right = 1; #10;     // Shift Right
        mode = 2'b10; serial_in_right = 0; #10;
        mode = 2'b01; serial_in_left = 1; #10;      // Shift Left
        mode = 2'b01; serial_in_left = 0; #10;

        $finish;
    end

endmodule

