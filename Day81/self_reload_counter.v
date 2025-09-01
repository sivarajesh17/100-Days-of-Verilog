module self_reload_counter #(
    parameter WIDTH = 4,
    parameter LOAD_VALUE = 4'd10
)(
    input wire clk,
    input wire reset,
    output reg [WIDTH-1:0] count
);

always @(posedge clk or posedge reset) begin
    if (reset)
        count <= LOAD_VALUE;
    else begin
        if (count == 0)
            count <= LOAD_VALUE;
        else
            count <= count - 1;
    end
end

endmodule

