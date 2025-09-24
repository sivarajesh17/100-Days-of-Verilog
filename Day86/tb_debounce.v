module tb_debounce;
    reg clk, rst_n, noisy_btn;
    wire clean_btn;

    debounce uut (
        .clk(clk),
        .rst_n(rst_n),
        .noisy_btn(noisy_btn),
        .clean_btn(clean_btn)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 100 MHz clock (10 ns period)
    end

    initial begin
        rst_n = 0; noisy_btn = 0;
        #20 rst_n = 1;

        // Simulate noisy button press (bouncing)
        #30 noisy_btn = 1; #10 noisy_btn = 0; #10 noisy_btn = 1; #10 noisy_btn = 0;
        #50 noisy_btn = 1;  // stable press
        #100 noisy_btn = 0; // stable release
        #200 $stop;
    end
endmodule

