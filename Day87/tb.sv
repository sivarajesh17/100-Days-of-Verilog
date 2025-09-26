module tb;
    logic clk;
    logic rst;
    wire scl;
    wire sda;

    // Instantiate DUT
    i2c_master dut (
        .clk(clk),
        .rst(rst),
        .scl(scl),
        .sda(sda)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        $display("Starting I2C Master Testbench...");
        clk = 0;
        rst = 1;
        #20;
        rst = 0;

        #10;
        $display("\n================ FINAL WRITE SUMMARY ================");
        $display("Slave Address Sent : 0x%02h", dut.slave_addr);
        $display("Data Byte 1 Sent   : 0x%02h", dut.data1);
        $display("Data Byte 2 Sent   : 0x%02h", dut.data2);
        $display("=====================================================\n");

        $finish;
    end
endmodule

