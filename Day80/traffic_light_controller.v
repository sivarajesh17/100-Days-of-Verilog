module traffic_light_controller(
    input clk,
    input rst,
    output reg [2:0] light
);
    reg [1:0] state;
    reg [3:0] count;

    parameter RED = 2'b00, GREEN = 2'b01, YELLOW = 2'b10;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= RED;
            count <= 0;
            light <= 3'b100;
        end else begin
            count <= count + 1;
            case(state)
                RED: begin
                    light <= 3'b100;
                    if (count == 4'd5) begin
                        state <= GREEN;
                        count <= 0;
                    end
                end
                GREEN: begin
                    light <= 3'b010;
                    if (count == 4'd5) begin
                        state <= YELLOW;
                        count <= 0;
                    end
                end
                YELLOW: begin
                    light <= 3'b001;
                    if (count == 4'd3) begin
                        state <= RED;
                        count <= 0;
                    end
                end
            endcase
        end
    end
endmodule

