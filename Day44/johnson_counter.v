module johnson_counter (
    input clk,
    input reset,
    output reg [3:0] count
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            count <= 4'b0000;
        else
            count <= {~count[0], count[3:1]}; // Right shift with inversion
    end

endmodule

