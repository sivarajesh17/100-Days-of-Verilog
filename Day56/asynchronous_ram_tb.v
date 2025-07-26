`timescale 1ns/1ps

module asynchronous_ram_tb;

    reg clk, we;
    reg [2:0] addr;
    reg [7:0] din;
    wire [7:0] dout;

    asynchronous_ram uut (
        .clk(clk),
        .we(we),
        .addr(addr),
        .din(din),
        .dout(dout)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;  
    end

    initial begin
        $display("Time\tWE Addr Din  | Dout");
        $monitor("%0dns\t %b   %b   %h  |  %h", $time, we, addr, din, dout);

        we = 1; addr = 3'b000; din = 8'hAA; #10;
        addr = 3'b001; din = 8'h55; #10;
        addr = 3'b010; din = 8'hF0; #10;

        
        we = 0;
        addr = 3'b000; #5;
        addr = 3'b001; #5;
        addr = 3'b010; #5;
        addr = 3'b011; #5;  

        $finish;
    end

endmodule

