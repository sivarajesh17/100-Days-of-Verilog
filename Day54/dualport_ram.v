module dual_port_ram (
    input clk_a,
    input we_a,
    input [2:0] addr_a,
    input [7:0] din_a,
    output reg [7:0] dout_a,

    input clk_b,
    input we_b,
    input [2:0] addr_b,
    input [7:0] din_b,
    output reg [7:0] dout_b
);

    reg [7:0] mem [0:7];

    always @(posedge clk_a) begin
        if (we_a)
            mem[addr_a] <= din_a;
        dout_a <= mem[addr_a];
    end

    always @(posedge clk_b) begin
        if (we_b)
            mem[addr_b] <= din_b;
        dout_b <= mem[addr_b];
    end

endmodule

