`timescale 1ns/1ps

module single_port_ram_tb;

    reg clk, we;
    reg [2:0] addr;
    reg [7:0] din;
    wire [7:0] dout;

    single_port_ram uut (
        .clk(clk),
        .we(we),
        .addr(addr),
        .din(din),
        .dout(dout)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10ns clock period
    end

    initial begin
        $display("Time\tWE Addr Din   | Dout");
        $monitor("%0dns\t %b   %b   %h |  %h", $time, we, addr, din, dout);

        we = 1; addr = 3'b000; din = 8'hA5; #10; // Write A5 to addr 0
        addr = 3'b001; din = 8'h5A; #10;         // Write 5A to addr 1
        addr = 3'b010; din = 8'hFF; #10;         // Write FF to addr 2

        we = 0; addr = 3'b000; #10;              // Read addr 0 (A5)
        addr = 3'b001; #10;                      // Read addr 1 (5A)
        addr = 3'b010; #10;                      // Read addr 2 (FF)

        $finish;
    end

endmodule

