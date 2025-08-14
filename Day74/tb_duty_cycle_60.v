`timescale 1ns/1ps

module tb_duty_cycle_60;
    reg clk;
    reg rst;
    wire pwm_out;

    // Instantiate the DUT (Device Under Test)
    duty_cycle_60 uut (
        .clk(clk),
        .rst(rst),
        .pwm_out(pwm_out)
    );

    // Clock generation (100 MHz ? 10 ns period)
    always #5 clk = ~clk;

    initial begin
        // Initialize
        clk = 0;
        rst = 1;

        // Reset pulse
        #20;
        rst = 0;

        // Run for some time to observe waveform
        #200;
        
        $stop;
    end

    // Monitor outputs
    initial begin
        $monitor("Time=%0t | pwm_out=%b", $time, pwm_out);
    end
endmodule

