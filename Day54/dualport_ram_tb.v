`timescale 1ns/1ps

module dual_port_ram_tb;

    reg clk_a, we_a;
    reg [2:0] addr_a;
    reg [7:0] din_a;
    wire [7:0] dout_a;

    reg clk_b, we_b;
    reg [2:0] addr_b;
    reg [7:0] din_b;
    wire [7:0] dout_b;

    dual_port_ram uut (
        .clk_a(clk_a), .we_a(we_a), .addr_a(addr_a), .din_a(din_a), .dout_a(dout_a),
        .clk_b(clk_b), .we_b(we_b), .addr_b(addr_b), .din_b(din_b), .dout_b(dout_b)
    );

    initial begin
        clk_a = 0; forever #5 clk_a = ~clk_a;
    end

    initial begin
        clk_b = 0; forever #7 clk_b = ~clk_b;
    end

    initial begin
        $display("Time\tPortA: we addr din | dout   || PortB: we addr din | dout");
        $monitor("%0dns\t  %b   %b   %h   |  %h    ||   %b   %b   %h   |  %h",
            $time, we_a, addr_a, din_a, dout_a, we_b, addr_b, din_b, dout_b);

        // Port A writes
        we_a = 1; addr_a = 3'b000; din_a = 8'hA1;
        we_b = 0; addr_b = 3'b000; din_b = 8'h00; #10;

        we_a = 1; addr_a = 3'b001; din_a = 8'hB2; #10;

        // Port B writes
        we_b = 1; addr_b = 3'b010; din_b = 8'hC3;
        we_a = 0; addr_a = 3'b010; #10;

        // Read from both ports
        we_a = 0; addr_a = 3'b000;
        we_b = 0; addr_b = 3'b001; #10;

        addr_a = 3'b001; addr_b = 3'b010; #10;

        $finish;
    end

endmodule

