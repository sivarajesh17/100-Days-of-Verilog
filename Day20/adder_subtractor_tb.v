module tb_adder_subtractor;
    reg  [3:0] a, b;
    reg        sel;
    wire [3:0] result;
    wire       carry_out, overflow;

    adder_subtractor uut (
        .a(a),
        .b(b),
        .sel(sel),
        .result(result),
        .carry_out(carry_out),
        .overflow(overflow)
    );

    initial begin
        $display("Time | A  | B  | Sel | Result | Carry | Overflow");
        $monitor("%4t | %2d | %2d |  %b  |   %2d   |   %b   |    %b", $time, a, b, sel, result, carry_out, overflow);

        // Addition examples
        sel = 0;
        a = 4'd3; b = 4'd5; #10;
        a = 4'd9; b = 4'd6; #10;

        // Subtraction examples
        sel = 1;
        a = 4'd9; b = 4'd4; #10;
        a = 4'd2; b = 4'd7; #10;

        $finish;
    end
endmodule

