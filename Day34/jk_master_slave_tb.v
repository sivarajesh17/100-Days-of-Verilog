`timescale 1ns/1ps

module jk_master_slave_tb;

    reg J, K, clk;
    wire Q, Qbar;

    jk_master_slave uut (
        .J(J),
        .K(K),
        .clk(clk),
        .Q(Q),
        .Qbar(Qbar)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    initial begin
        $display("Time\tJ K clk | Q Qbar");
        $monitor("%0dns\t%b %b  %b   | %b  %b", $time, J, K, clk, Q, Qbar);

        J = 0; K = 0;
        #11 J = 0; K = 1;  // Reset
        #10 J = 1; K = 0;  // Set
        #10 J = 1; K = 1;  // Toggle
        #10 J = 1; K = 1;  // Toggle again
        #10 J = 0; K = 0;  // Hold
        #10 $finish;
    end

endmodule

