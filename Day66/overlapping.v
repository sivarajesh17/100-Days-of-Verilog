module sequence_detector_101_overlap_moore (
    input clk,
    input reset,
    input in_bit,
    output reg detected
);
    parameter S0 = 2'b00,
              S1 = 2'b01,
              S2 = 2'b10,
              S3 = 2'b11;

    reg [1:0] current_state, next_state;

   
    always @(posedge clk or posedge reset) begin
        if (reset)
            current_state <= S0;
        else
            current_state <= next_state;
    end

    
    always @(*) begin
        case (current_state)
            S0: next_state = in_bit ? S1 : S0;
            S1: next_state = in_bit ? S1 : S2;
            S2: next_state = in_bit ? S3 : S0;
            S3: next_state = in_bit ? S1 : S2; 
            default: next_state = S0;
        endcase
    end


    always @(posedge clk or posedge reset) begin
        if (reset)
            detected <= 0;
        else
            detected <= (current_state == S3);
    end

endmodule

