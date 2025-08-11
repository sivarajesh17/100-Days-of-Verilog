module tb_negative_counter;

    reg clk, reset;
    wire signed [3:0] count;

    negative_counter #(4) uut (
        .clk(clk),
        .reset(reset),
        .count(count)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    initial begin
        reset = 1; #10;
        reset = 0;
        #100 $finish;
    end

    initial begin
        $monitor("Time=%0t | count=%0d", $time, count);
    end

endmodule

