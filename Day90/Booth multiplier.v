module booth_multiplier (
    input clk,
    input start,
    input signed [3:0] multiplicand,
    input signed [3:0] multiplier,
    output reg signed [7:0] product,
    output reg done
);
    reg [3:0] count;
    reg signed [4:0] A;   // extra bit for sign extension
    reg signed [4:0] Q;
    reg q0;
    reg signed [4:0] M;

    always @(posedge clk) begin
        if (start) begin
            A <= 5'd0;
            Q <= multiplier;
            q0 <= 0;
            M <= multiplicand;
            count <= 4;
            done <= 0;
            product <= 0;
        end
        else if (count > 0) begin
            case ({Q[0], q0})
                2'b01: A <= A + M;   // Add multiplicand
                2'b10: A <= A - M;   // Subtract multiplicand
                default: A <= A;     // No operation
            endcase

            // Arithmetic right shift
            {A, Q, q0} <= {A[4], A, Q};

            count <= count - 1;

            if (count == 1) begin
                product <= {A, Q[4:1]};
                done <= 1;
            end
        end
    end
endmodule

