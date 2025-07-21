module shift_right_register (
    input clk,
    input reset,
    input serial_in,
    output reg [3:0] q
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 4'b0000;
        else
            q <= {serial_in, q[3:1]};
    end

endmodule

