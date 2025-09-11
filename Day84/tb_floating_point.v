`timescale 1ns/1ps
module tb_simple_fpu;

    reg [31:0] a, b;
    reg [1:0] op;
    wire [31:0] result;

    simple_fpu uut (
        .a(a),
        .b(b),
        .op(op),
        .result(result)
    );

    initial begin
        a = 32'h41200000;  // 10.0 in IEEE-754
        b = 32'h40800000;  // 4.0 in IEEE-754

        op = 2'b00;  // ADD
        #10;
        op = 2'b01;  // SUB
        #10;
        op = 2'b10;  // AND
        #10;
        op = 2'b11;  // OR
        #10;

        $finish;
    end

    initial begin
        $monitor("Time=%0t | op=%b | a=%h b=%h | result=%h", $time, op, a, b, result);
    end

endmodule

