`timescale 1ns/1ps
module tb_vending_machine_basic;
    reg clk = 0;
    reg reset;
    reg coin5;
    wire dispense;

    vending_machine_basic uut (
        .clk(clk),
        .reset(reset),
        .coin5(coin5),
        .dispense(dispense)
    );

    always #5 clk = ~clk; // 100 MHz

    task pulse5;
    begin
        coin5 = 1;
        @(posedge clk);
        coin5 = 0;
    end
    endtask

    initial begin
        reset = 1; coin5 = 0;
        repeat (2) @(posedge clk);
        reset = 0;

        // 5 + 5 ? dispense
        pulse5();
        pulse5();
        repeat (2) @(posedge clk);

        // 5 + 5 + 5 ? two transactions across runs: first (5 pending), then complete, then start again
        pulse5();
        pulse5();   // completes one vend
        repeat (1) @(posedge clk);
        pulse5();   // starts next

        repeat (8) @(posedge clk);
        $finish;
    end

    initial begin
        $display("  time  coin5  dispense");
        $monitor("%6t    %b       %b", $time, coin5, dispense);
    end
endmodule

