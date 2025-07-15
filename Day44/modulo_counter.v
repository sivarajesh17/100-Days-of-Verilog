module modulo_counter #(parameter N = 5)(
    input clk,
    input reset,
    output reg [$clog2(N)-1:0] count
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

