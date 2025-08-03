module sequence_detector_101 (
    input clk,
    input reset,
    input in_bit,
    output reg detected
);

    // State encoding
    parameter S0 = 2'b00,  // Initial state
              S1 = 2'b01,  // Saw '1'
              S2 = 2'b10,  // Saw '10'
              S3 = 2'b11;  // Saw '101'

    reg [1:0] current_state, next_state;

    // State transition on clock
    always @(posedge clk or posedge reset) begin
        if (reset)
            current_state <= S0;
        else
            current_state <= next_state;
    end

    // Next-state logic
    always @(*) begin
        case (current_state)
            S0: next_state = in_bit ? S1 : S0;
            S1: next_state = in_bit ? S1 : S2;
            S2: next_state = in_bit ? S3 : S0;
            S3: next_state = in_bit ? S1 : S2;
            default: next_state = S0;
        endcase
    end

    // Output logic (Moore: output depends on state only)
    always @(posedge clk or posedge reset) begin
        if (reset)
            detected <= 0;
        else
            detected <= (current_state == S3);
    end

endmodule

