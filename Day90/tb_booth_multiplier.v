module tb_booth_multiplier;
    reg clk, start;
    reg signed [3:0] multiplicand, multiplier;
    wire signed [7:0] product;
    wire done;

    booth_multiplier uut (
        .clk(clk),
        .start(start),
        .multiplicand(multiplicand),
        .multiplier(multiplier),
        .product(product),
        .done(done)
    );

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        // Monitor outputs
        $monitor("Time=%0t, Multiplicand=%d, Multiplier=%d, Product=%d, Done=%b",
                 $time, multiplicand, multiplier, product, done);

        // Test 1: 3 × 2 = 6
        start = 1; multiplicand = 3; multiplier = 2;
        #10 start = 0;
        wait(done);

        // Test 2: -3 × 2 = -6
        #20 start = 1; multiplicand = -3; multiplier = 2;
        #10 start = 0;
        wait(done);

        // Test 3: -4 × -2 = 8
        #20 start = 1; multiplicand = -4; multiplier = -2;
        #10 start = 0;
        wait(done);

        // Test 4: 7 × -3 = -21
        #20 start = 1; multiplicand = 7; multiplier = -3;
        #10 start = 0;
        wait(done);

        #50 $finish;
    end
endmodule

