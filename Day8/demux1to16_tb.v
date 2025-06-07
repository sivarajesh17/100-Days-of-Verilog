module tb_demux_1to16;

reg din;
reg [3:0] sel;
wire [15:0] y;

demux_1to16 uut (
    .din(din),
    .sel(sel),
    .y(y)
);

integer i;

initial begin
    $display("Time | din sel  | y");
    $monitor("%4t |  %b   %b | %b", $time, din, sel, y);

    din = 0; sel = 4'b0000; #10;
    din = 1;
    for (i = 0; i < 16; i = i + 1) begin
        sel = i;
        #10;
    end

    din = 0; sel = 4'b1010; #10;

    $finish;
end

endmodule

