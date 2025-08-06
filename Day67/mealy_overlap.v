module sequence_detector_101_overlap_mealy (
    input clk,
    input reset,
    input in_bit,
    output reg detected
);

   
    parameter S0 = 2'b00,
              S1 = 2'b01,
              S2 = 2'b10;

    reg [1:0] current_state, next_state;

   
    always @(posedge clk or posedge reset) begin
        if (reset)
            current_state <= S0;
        else
            current_state <= next_state;
    end

    
    always @(*) begin
        detected = 0;

        case (current_state)
            S0: begin
                next_state = in_bit ? S1 : S0;
            end
            S1: begin
                next_state = in_bit ? S1 : S2;
            end
            S2: begin
                if (in_bit) begin
                    detected = 1;      
                    next_state = S1;   
                end else begin
                    next_state = S0;
                end
            end
            default: begin
                next_state = S0;
            end
        endcase
    end

endmodule

