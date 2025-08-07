module mod_n_counter #(parameter N = 10, parameter WIDTH = 4)(
    input clk,
    input reset,
    output reg [WIDTH-1:0] count
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            count <= 0;
        else if (count == N-1)
            count <= 0;
        else
            count <= count + 1;
    end

endmodule

