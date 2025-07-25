module binary_multiplier (
    input clk,
    input reset,
    input start,
    input [3:0] A,
    input [3:0] B,
    output reg [7:0] product,
    output reg done
);

    reg [3:0] multiplicand, multiplier;
    reg [7:0] acc;
    reg [2:0] count;
    reg state;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            acc <= 8'd0;
            multiplicand <= 4'd0;
            multiplier <= 4'd0;
            count <= 3'd0;
            product <= 8'd0;
            done <= 0;
            state <= 0;
        end else begin
            case (state)
                0: begin
                    if (start) begin
                        multiplicand <= A;
                        multiplier <= B;
                        acc <= 8'd0;
                        count <= 3'd4;
                        done <= 0;
                        state <= 1;
                    end
                end

                1: begin
                    if (multiplier[0])
                        acc <= acc + {4'b0000, multiplicand};
                    
                    multiplier <= multiplier >> 1;
                    acc <= {acc[7], acc[7:1]};  // Arithmetic right shift (optional)
                    count <= count - 1;

                    if (count == 1) begin
                        product <= acc;
                        done <= 1;
                        state <= 0;
                    end
                end
            endcase
        end
    end

endmodule

