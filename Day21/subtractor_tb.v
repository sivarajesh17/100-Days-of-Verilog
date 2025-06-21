module tb_subtractor_4bit;
    reg  [3:0] a, b;
    wire [3:0] diff;
    wire       borrow_out;

    subtractor_4bit uut (
        .a(a),
        .b(b),
        .diff(diff),
        .borrow_out(borrow_out)
    );

    initial begin
        $display(" A  | B  | Diff | Borrow");
        $monitor("%2d | %2d |  %2d  |   %b", a, b, diff, borrow_out);

        a = 4'd9;  b = 4'd4;  #10;
        a = 4'd5;  b = 4'd7;  #10;
        a = 4'd15; b = 4'd15; #10;
        a = 4'd3;  b = 4'd8;  #10;

        $finish;
    end
endmodule

