`timescale 1ns/1ps

module sr_flipflop_tb;

    reg S, R, clk;
    wire Q, Qbar;

    sr_flipflop uut (
        .S(S),
        .R(R),
        .clk(clk),
        .Q(Q),
        .Qbar(Qbar)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $display("Time\tS R clk | Q Qbar");
        $monitor("%0dns\t%b %b  %b   | %b  %b", $time, S, R, clk, Q, Qbar);

        S = 0; R = 0;
        #12 S = 1; R = 0;
        #10 S = 0; R = 1;
        #10 S = 1; R = 1;
        #10 S = 0; R = 0;
        #10 $finish;
    end

endmodule

