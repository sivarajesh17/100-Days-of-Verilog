`timescale 1ns/1ps

module tb_pwm_generator;
    reg clk;
    reg [7:0] duty;
    wire pwm_out;

    // Instantiate PWM Generator
    pwm_generator #(
        .CLOCK_FREQ(100_000_000),
        .PWM_FREQ(1_000)
    ) uut (
        .clk(clk),
        .duty(duty),
        .pwm_out(pwm_out)
    );

    // Generate 100 MHz clock (10 ns period)
    initial clk = 0;
    always #5 clk = ~clk;

    // Test sequence
    initial begin
        $display("Starting PWM Generator Test...");
        duty = 8'd20;  // 20% duty cycle
        #10_000_000;   // wait 10 ms

        duty = 8'd50;  // 50% duty cycle
        #10_000_000;   // wait 10 ms

        duty = 8'd80;  // 80% duty cycle
        #10_000_000;   // wait 10 ms

        $stop;  // End simulation
    end
endmodule

