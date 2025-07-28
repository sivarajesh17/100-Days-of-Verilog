`timescale 1ns/1ps

module barrel_shifter_tb;

    reg [7:0] in;
    reg [2:0] shift;
    reg dir;
    wire [7:0] out;

    barrel_shifter uut (
        .in(in),
        .shift(shift),
        .dir(dir),
        .out(out)
    );

    initial begin
        $display("Time\tDir Shift In     | Out");
        $monitor("%0dns\t %b    %d   %b | %b", $time, dir, shift, in, out);

        in = 8'b10110011; dir = 0; shift = 3'd1; #10;
        shift = 3'd2; #10;
        dir = 1; shift = 3'd1; #10;
        shift = 3'd3; #10;
        $finish;
    end

endmodule

