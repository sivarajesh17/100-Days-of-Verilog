// Design a counter using DFF that counts in the sequence: 0,4,2,7,0,4,2,7,0,4?......
module counter_sequence (
    input clk,
    input rst,
    output reg [2:0] q
);

    always @(posedge clk or posedge rst) begin
        if (rst)
            q <= 3'b000;
        else begin
            case (q)
                3'b000: q <= 3'b100;  // 0 ? 4
                3'b100: q <= 3'b010;  // 4 ? 2
                3'b010: q <= 3'b111;  // 2 ? 7
                3'b111: q <= 3'b000;  // 7 ? 0
                default: q <= 3'b000;
            endcase
        end
    end

endmodule
