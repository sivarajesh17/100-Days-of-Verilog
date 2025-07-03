`timescale 1ns/1ps

module t_flipflop_tb;

    reg T, clk;
    wire Q, Qbar;

    t_flipflop uut (
        .T(T),
        .clk(clk),
        .Q(Q),
        .Qbar(Qbar)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $display("Time\tT clk | Q Qbar");
        $monitor("%0dns\t%b  %b   | %b  %b", $time, T, clk, Q, Qbar);

        T = 0;
        #11 T = 1;
        #10 T = 1;
        #10 T = 0;
        #10 T = 1;
        #10 T = 1;
        #10 T = 0;
        #10 $finish;
    end

endmodule

