module tb_crc8;
    reg clk, rst_n, data_in, data_valid;
    wire [7:0] crc_out;

    crc8_generator UUT (
        .clk(clk), .rst_n(rst_n),
        .data_in(data_in),
        .data_valid(data_valid),
        .crc_out(crc_out)
    );

    // Clock generator
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst_n = 0;
        data_in = 0;
        data_valid = 0;
        #12 rst_n = 1;

        // Send data stream: 11010011
        send_bit(1);
        send_bit(1);
        send_bit(0);
        send_bit(1);
        send_bit(0);
        send_bit(0);
        send_bit(1);
        send_bit(1);

        #50 $display("Final CRC = %h", crc_out);
        #20 $stop;
    end

    task send_bit;
        input d;
        begin
            @(posedge clk);
            data_in = d;
            data_valid = 1;
            @(posedge clk);
            data_valid = 0;
        end
    endtask
endmodule

