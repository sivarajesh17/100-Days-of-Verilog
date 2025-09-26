module i2c_master (
    input logic clk,
    input logic rst,
    output logic scl,
    inout logic sda
);

    typedef enum logic [2:0] {
        IDLE, START, SEND_ADDR, SEND_DATA1, SEND_DATA2, STOP
    } state_t;

    state_t state;
    logic [7:0] slave_addr = 8'h50;   // example slave address
    logic [7:0] data1 = 8'hA5;        // first data byte
    logic [7:0] data2 = 8'h5A;        // second data byte
    logic [3:0] bit_cnt;
    logic sda_out_en;
    logic sda_out;

    assign sda = sda_out_en ? sda_out : 1'bz;

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;
            scl <= 1;
            sda_out_en <= 1;
            sda_out <= 1;
            bit_cnt <= 0;
        end else begin
            case (state)
                IDLE: begin
                    scl <= 1;
                    sda_out <= 1;
                    sda_out_en <= 1;
                    state <= START;
                end
                START: begin
                    sda_out <= 0;
                    scl <= 1;
                    state <= SEND_ADDR;
                    bit_cnt <= 7;
                end
                SEND_ADDR: begin
                    scl <= 0;
                    sda_out <= slave_addr[bit_cnt];
                    scl <= 1;
                    if (bit_cnt == 0)
                        state <= SEND_DATA1;
                    else
                        bit_cnt <= bit_cnt - 1;
                end
                SEND_DATA1: begin
                    scl <= 0;
                    sda_out <= data1[bit_cnt];
                    scl <= 1;
                    if (bit_cnt == 0)
                        state <= SEND_DATA2;
                    else
                        bit_cnt <= bit_cnt - 1;
                end
                SEND_DATA2: begin
                    scl <= 0;
                    sda_out <= data2[bit_cnt];
                    scl <= 1;
                    if (bit_cnt == 0)
                        state <= STOP;
                    else
                        bit_cnt <= bit_cnt - 1;
                end
                STOP: begin
                    scl <= 1;
                    sda_out <= 0;
                    sda_out <= 1;
                    state <= IDLE;
                end
            endcase
        end
    end
endmodule

