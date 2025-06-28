`timescale 1ns/1ps

module d_latch_tb;

    reg D, enable;
    wire Q, Qbar;

    d_latch uut (
        .D(D),
        .enable(enable),
        .Q(Q),
        .Qbar(Qbar)
    );

    initial begin
        $display("Time\tEnable D | Q Qbar");
        $monitor("%0dns\t   %b     %b | %b  %b", $time, enable, D, Q, Qbar);

        D = 0; enable = 0;
        #10 D = 1; enable = 0;
        #10 enable = 1;
        #10 D = 0;
        #10 enable = 0;
        #10 D = 1;
        #10 enable = 1;
        #10 $finish;
    end

endmodule

