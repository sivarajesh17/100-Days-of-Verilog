module tb_countdown_timer;
    reg clk, reset, load, start_stop;
    reg [5:0] preset;
    wire [5:0] count;
    wire done;

    countdown_timer uut (
        .clk(clk),
        .reset(reset),
        .load(load),
        .start_stop(start_stop),
        .preset(preset),
        .count(count),
        .done(done)
    );

    // Generate clock (1Hz equivalent for simulation)
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns period
    end

    initial begin
        reset = 1; load = 0; start_stop = 0; preset = 0;
        #20 reset = 0;

        // Load preset value 10
        #10 preset = 6'd10; load = 1; #10 load = 0;

        // Start countdown
        #10 start_stop = 1; #10 start_stop = 0;

        // Run until done
        wait(done);
        $display("Countdown Complete at time %0t, Count = %d", $time, count);

        // Reload new value 5 and start again
        #20 preset = 6'd5; load = 1; #10 load = 0;
        #10 start_stop = 1; #10 start_stop = 0;

        wait(done);
        $display("Second Countdown Complete at time %0t", $time);

        #50 $stop;
    end
endmodule

