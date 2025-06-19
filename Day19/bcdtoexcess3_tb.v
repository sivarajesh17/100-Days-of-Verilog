module tb_bcd_to_excess3;
    reg  [3:0] bcd;
    wire [3:0] excess3;

    // Instantiate the Unit Under Test (UUT)
    bcd_to_excess3 uut (
        .bcd(bcd),
        .excess3(excess3)
    );

    initial begin
        $display("Time | BCD  | Excess-3");
        $display("-----|------|----------");
        $monitor("%4t | %b |   %b", $time, bcd, excess3);
        
        bcd = 4'd0; #10;
        bcd = 4'd1; #10;
        bcd = 4'd2; #10;
        bcd = 4'd3; #10;
        bcd = 4'd4; #10;
        bcd = 4'd5; #10;
        bcd = 4'd6; #10;
        bcd = 4'd7; #10;
        bcd = 4'd8; #10;
        bcd = 4'd9; #10;
        
        $finish;
    end
endmodule

