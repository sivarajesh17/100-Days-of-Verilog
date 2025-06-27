
`timescale 1ns / 1ps

module tb_sr_gated_latch;

    reg S, R, EN;
    wire Q, Qn;

    sr_gated_latch uut (
        .S(S),
        .R(R),
        .EN(EN),
        .Q(Q),
        .Qn(Qn)
    );

    initial begin
        $display("Time\tEN\tS\tR\tQ\tQn");
        $monitor("%0dns\t%b\t%b\t%b\t%b\t%b", $time, EN, S, R, Q, Qn);

       
        EN = 0; S = 0; R = 0; #10;
        EN = 1; S = 1; R = 0; #10;
        S = 0; R = 0; #10;
        S = 0; R = 1; #10;
        S = 0; R = 0; #10;
	S = 1; R = 1; #10;
        EN = 0; S = 0; R = 1; #10;

        $finish;
    end

endmodule

