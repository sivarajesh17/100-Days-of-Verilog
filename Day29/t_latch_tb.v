`timescale 1ns/1ps

module t_latch_tb;

    reg T, enable;
    wire Q, Qbar;

    t_latch uut (
        .T(T),
        .enable(enable),
        .Q(Q),
        .Qbar(Qbar)
    );

    initial begin
        $display("Time\tEnable T | Q Qbar");
        $monitor("%0dns\t   %b     %b | %b  %b", $time, enable, T, Q, Qbar);

        T = 0; enable = 0;
        #10 enable = 1; T = 0;
        #10 T = 1;
        #10 T = 1;
        #10 T = 0;
        #10 enable = 0; T = 1;
        #10 enable = 1; T = 1;
        #10 T = 0;
        #10 $finish;
    end

endmodule

