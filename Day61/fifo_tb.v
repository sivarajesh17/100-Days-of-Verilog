`timescale 1ns/1ps

module fifo_tb;
    reg clk;
    reg wr_en, rd_en;
    reg [7:0] data_in;
    wire [7:0] data_out;

    fifo uut (
        .clk(clk),
        .wr_en(wr_en),
        .rd_en(rd_en),
        .data_in(data_in),
        .data_out(data_out)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        wr_en = 0;
        rd_en = 0;
        data_in = 0;

        #10;
        wr_en = 1; data_in = 8'hA1; #10;
        data_in = 8'hB2; #10;
        data_in = 8'hC3; #10;
        wr_en = 0;

        #10;
        rd_en = 1; #10;
        #10;
        #10;
        rd_en = 0;

        #10;
        wr_en = 1; data_in = 8'hD4; #10;
        wr_en = 0;

        #10;
        rd_en = 1; #10;
        rd_en = 0;

        #20;
        $finish;
    end
endmodule

