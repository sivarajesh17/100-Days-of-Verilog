`timescale 1ns/1ps

module shift_right_register_tb;

    reg clk, reset, serial_in;
    wire [3:0] q;

    shift_right_register uut (
        .clk(clk),
        .reset(reset),
        .serial_in(serial_in),
        .q(q)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $display("Time\tclk rst sin | q");
        $monitor("%0dns\t  %b   %b   %b  | %b", $time, clk, reset, serial_in, q);

        reset = 1; serial_in = 0; #10;
        reset = 0;

        serial_in = 1; #10;
        serial_in = 0; #10;
        serial_in = 1; #10;
        serial_in = 1; #10;
        serial_in = 0; #10;

        $finish;
    end

endmodule

