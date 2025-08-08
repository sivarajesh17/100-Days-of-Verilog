module tb_universal_shift_register;

    parameter N = 4;
    reg clk, reset;
    reg [1:0] mode;
    reg [N-1:0] parallel_in;
    reg serial_in_left, serial_in_right;
    wire [N-1:0] q;

    universal_shift_register #(N) uut (
        .clk(clk),
        .reset(reset),
        .mode(mode),
        .parallel_in(parallel_in),
        .serial_in_left(serial_in_left),
        .serial_in_right(serial_in_right),
        .q(q)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        reset = 1; mode = 0; parallel_in = 0; serial_in_left = 0; serial_in_right = 0;
        #10 reset = 0;

        mode = 2'b11; parallel_in = 4'b1010; #10; // Parallel Load
        mode = 2'b01; serial_in_left = 1; #10;    // Shift Right
        mode = 2'b10; serial_in_right = 0; #10;   // Shift Left
        mode = 2'b00; #10;                        // Hold

        $finish;
    end

    initial begin
        $monitor("Time=%0t | mode=%b | q=%b", $time, mode, q);
    end

endmodule

