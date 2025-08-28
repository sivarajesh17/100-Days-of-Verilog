module tb_traffic_light_controller;
    reg clk;
    reg rst;
    wire [2:0] light;

    traffic_light_controller uut (
        .clk(clk),
        .rst(rst),
        .light(light)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst = 1;
        #10 rst = 0;
        #200 $stop;
    end
endmodule

