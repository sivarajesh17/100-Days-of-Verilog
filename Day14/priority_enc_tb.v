module priority_enc_tb;

reg [3:0] in;
wire [1:0] out;
wire valid;

priority_enc uut (
    .in(in),
    .out(out),
    .valid(valid)
);

initial begin
    $display("Time\tInput\tOutput\tValid");
    $monitor("%0t\t%b\t%02b\t%b", $time, in, out, valid);

    in = 4'b0000; #10;
    in = 4'b0001; #10;
    in = 4'b0010; #10;
    in = 4'b0100; #10;
    in = 4'b1000; #10;
    in = 4'b1010; #10;
    in = 4'b1111; #10;

    $finish;
end

endmodule

