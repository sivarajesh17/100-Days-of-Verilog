module tb_d_latch_mux;

    reg D, EN;
    wire Q;

    d_latch_mux uut (
        .D(D),
        .EN(EN),
        .Q(Q)
    );

    initial begin
        D = 0; EN = 0;
        #10 D = 1; EN = 1;
        #10 EN = 0;
        #10 D = 0; EN = 1;
        #10 EN = 0;
        #10 $finish;
    end

    initial begin
        $monitor("Time=%0t | D=%b EN=%b Q=%b", $time, D, EN, Q);
    end

endmodule

