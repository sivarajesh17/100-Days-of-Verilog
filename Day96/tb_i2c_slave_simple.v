module tb_i2c_slave_simple;
    reg scl, rst;
    wire sda;
    reg sda_master;
    wire sda_bus;
    wire [7:0] data_out;

    assign sda_bus = (sda_master == 1'bz) ? 1'bz : sda_master;
    assign sda = sda_bus;

    // Instantiate slave
    i2c_slave_simple uut (
        .scl(scl),
        .sda(sda_bus),
        .rst(rst),
        .data_out(data_out)
    );

    initial begin
        scl = 1;
        sda_master = 1'bz;
        rst = 1;
        #10 rst = 0;

        // Simulate sending 7-bit address (1010000) + Write bit (0)
        send_byte(8'b10100000); 
        // Send one data byte (e.g., 11001100)
        send_byte(8'b11001100);

        #100 $finish;
    end

    task send_byte(input [7:0] data);
        integer i;
        begin
            for (i = 7; i >= 0; i = i - 1) begin
                sda_master = data[i];
                #5 scl = 0;
                #5 scl = 1;
            end
            sda_master = 1'bz; // Release line for ACK
            #10;
        end
    endtask
endmodule

