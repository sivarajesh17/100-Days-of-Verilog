`timescale 1ns/1ps

module jk_flipflop_tb;

    reg J, K, clk;
    wire Q, Qbar;

    jk_flipflop uut (
        .J(J),
        .K(K),
        .clk(clk),
        .Q(Q),
        .Qbar(Qbar)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $display("Time\tJ K clk | Q Qbar");
        $monitor("%0dns\t%b %b  %b   | %b  %b", $time, J, K, clk, Q, Qbar);

        J = 0; K = 0;
        #12 J = 0; K = 1;
        #10 J = 1; K = 0;
        #10 J = 1; K = 1;
        #10 J = 0; K = 0;
        #10 $finish;
    end

endmodule

