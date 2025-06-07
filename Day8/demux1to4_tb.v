module tb_demux_1to4;

reg din;
reg [1:0] sel;
wire y0, y1, y2, y3;

demux_1to4 uut (
    .din(din),
    .sel(sel),
    .y0(y0),
    .y1(y1),
    .y2(y2),
    .y3(y3)
);

initial begin
    $display("Time | din sel | y0 y1 y2 y3");
    $monitor("%4t |  %b   %b  |  %b  %b  %b  %b", $time, din, sel, y0, y1, y2, y3);
    
    din = 0; sel = 2'b00; #10;
    din = 1; sel = 2'b00; #10;
    din = 1; sel = 2'b01; #10;
    din = 1; sel = 2'b10; #10;
    din = 1; sel = 2'b11; #10;
    din = 0; sel = 2'b10; #10;
    $finish;
end

endmodule

