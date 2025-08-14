module duty_cycle_60 (
    input clk,
    input rst,
    output reg pwm_out
);
    reg [4:0] count;

    always @(posedge clk or posedge rst) begin
        if (rst)
            count <= 0;
        else
            count <= (count == 9) ? 0 : count + 1;
    end

    always @(*) begin
        if (count < 6) // 60% duty cycle
            pwm_out = 1;
        else
            pwm_out = 0;
    end
endmodule


