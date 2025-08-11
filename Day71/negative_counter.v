module negative_counter #(parameter WIDTH = 4) (
    input clk,
    input reset,
    output reg signed [WIDTH-1:0] count
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            count <= 0;
        else
            count <= count - 1;  // subtract 1 each clock cycle
    end

endmodule

