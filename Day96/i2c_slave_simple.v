
module i2c_slave_simple (
    input wire scl,        // I2C Clock from Master
    inout wire sda,        // I2C Data Line (bidirectional)
    input wire rst,        // Reset signal
    output reg [7:0] data_out // Received data
);

    parameter SLAVE_ADDR = 7'b1010000;  // Slave address

    reg [3:0] bit_count = 0;
    reg [7:0] shift_reg = 0;
    reg [6:0] address = 0;
    reg ack = 0;
    reg sda_out = 1;
    reg rw_bit = 0;
    reg receiving = 0;

    assign sda = (ack || !sda_out) ? 1'b0 : 1'bz; // Drive SDA low for ACK, else high-Z

    always @(negedge scl or posedge rst) begin
        if (rst) begin
            bit_count <= 0;
            shift_reg <= 0;
            data_out <= 0;
            receiving <= 0;
            ack <= 0;
        end
        else begin
            if (!receiving) begin
                // Receiving address + R/W bit
                shift_reg[7-bit_count] <= sda;
                bit_count <= bit_count + 1;

                if (bit_count == 7) begin
                    address <= shift_reg[7:1];
                    rw_bit <= shift_reg[0];
                    if (shift_reg[7:1] == SLAVE_ADDR) begin
                        ack <= 1; // Acknowledge address
                        receiving <= 1;
                    end
                end
            end 
            else begin
                // Receiving data byte
                shift_reg[7-bit_count] <= sda;
                bit_count <= bit_count + 1;

                if (bit_count == 7) begin
                    data_out <= shift_reg;
                    ack <= 1; // Acknowledge data
                    receiving <= 0;
                end
            end
        end
    end

endmodule
