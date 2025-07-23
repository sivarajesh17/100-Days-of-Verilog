module single_port_ram (
    input clk,
    input we,                    // write enable
    input [2:0] addr,            // 3-bit address (0 to 7)
    input [7:0] din,             // data input
    output reg [7:0] dout        // data output
);

    reg [7:0] mem [0:7];

    always @(posedge clk) begin
        if (we)
            mem[addr] <= din;
        else
            dout <= mem[addr];
    end

endmodule

