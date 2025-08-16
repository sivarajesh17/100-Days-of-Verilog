`timescale 1ns/1ps

module pwm_generator #(
    parameter CLOCK_FREQ = 100_000_000,  // Input clock frequency (100 MHz)
    parameter PWM_FREQ   = 1_000         // PWM frequency (1 kHz)
)(
    input wire clk,             // Clock input
    input wire [7:0] duty,      // Duty cycle in percentage (0 to 100)
    output reg pwm_out          // PWM output
);

    localparam integer PERIOD_COUNT = CLOCK_FREQ / PWM_FREQ;
    integer counter = 0;

    always @(posedge clk) begin
        counter <= counter + 1;
        if (counter >= PERIOD_COUNT)
            counter <= 0;

        if (counter < (PERIOD_COUNT * duty) / 100)
            pwm_out <= 1;
        else
            pwm_out <= 0;
    end
endmodule
