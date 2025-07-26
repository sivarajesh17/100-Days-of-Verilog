module asynchronous_ram (
    input clk,
    input we,                   // Write enable
    input [2:0] addr,           // 3-bit address
    input [7:0] din,            // Data input
    output [7:0] dout           // Data output
);

    reg [7:0] mem [0:7];

    assign dout = mem[addr];    // Asynchronous read

    always @(posedge clk) begin
        if (we)
            mem[addr] <= din;   // Synchronous write
    end

endmodule

