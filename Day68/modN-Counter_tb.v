module tb_mod_n_counter;

    reg clk;
    reg reset;
    wire [3:0] count;

    // Instantiate Mod-10 counter (N=10, WIDTH=4)
    mod_n_counter #(10, 4) uut (
        .clk(clk),
        .reset(reset),
        .count(count)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Stimulus
    initial begin
        reset = 1;
        #10;
        reset = 0;

        #200; // run for 20 clock cycles
        $finish;
    end

    // Monitor
    initial begin
        $monitor("Time = %0t | count = %0d", $time, count);
    end

endmodule

