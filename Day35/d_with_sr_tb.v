`timescale 1ns/1ps

module d_with_sr_tb;

    reg D, clk;
    wire Q, Qbar;

    d_with_sr uut (
        .D(D),
        .clk(clk),
        .Q(Q),
        .Qbar(Qbar)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $display("Time\tD clk | Q Qbar");
        $monitor("%0dns\t%b  %b   | %b  %b", $time, D, clk, Q, Qbar);

        D = 0; #11;
        D = 1; #10;
        D = 0; #10;
        D = 1; #10;
        D = 1; #10;
        D = 0; #10;
        $finish;
    end

endmodule

