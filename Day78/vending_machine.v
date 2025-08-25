`timescale 1ns/1ps
module vending_machine_basic(
    input  clk,
    input  reset,     // async active-high
    input  coin5,     // pulse 1 clk when a ?5 coin is inserted
    output reg dispense  // 1-cycle pulse when item is dispensed
);
    // State encoding (Moore FSM)
    localparam S0  = 2'd0;  // ?0
    localparam S5  = 2'd1;  // ?5
    localparam S10 = 2'd2;  // ?10 ? dispense

    reg [1:0] state, next;

    // State register
    always @(posedge clk or posedge reset) begin
        if (reset) state <= S0;
        else       state <= next;
    end

    // Next state logic
    always @* begin
        next = state;
        case (state)
            S0:  if (coin5) next = S5;
            S5:  if (coin5) next = S10;
            S10:            next = S0;   // dispense then return to idle
            default:        next = S0;
        endcase
    end

    // Moore output: high only in S10 (one clock)
    always @* begin
        dispense = (state == S10);
    end
endmodule

