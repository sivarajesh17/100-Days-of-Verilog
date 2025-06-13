module comparator_tb;

    reg [3:0] a, b;
    wire lt, eq, gt;

    comparator4bit uut (
        .a(a),
        .b(b),
        .lt(lt),
        .eq(eq),
        .gt(gt)
    );

    initial begin
        $display("Time\t a\t b\t lt eq gt");
        $monitor("%0t\t %b\t %b\t %b  %b  %b", $time, a, b, lt, eq, gt);

        // Test Case 1: a < b
        a = 4'b0010; b = 4'b0100; #10;

        // Test Case 2: a == b
        a = 4'b1010; b = 4'b1010; #10;

        // Test Case 3: a > b
        a = 4'b1110; b = 4'b0111; #10;

        // Test Case 4: a = 0, b = 15
        a = 4'b0000; b = 4'b1111; #10;

        // Test Case 5: a = 15, b = 0
        a = 4'b1111; b = 4'b0000; #10;

        // End of simulation
        $finish;
    end

endmodule

