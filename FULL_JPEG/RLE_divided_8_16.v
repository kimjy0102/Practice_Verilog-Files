module RLE_enhanced_8(
    input clk,
    input reset,
    input [8*64-1:0] data_in, // one line
    input [3-1:0] address_in,
    output reg [4-1:0] left_16bit_mux_q,
    output reg [4-1:0] right_16bit_mux_q,
    output reg flag_16bit_mux_q,
    output reg [16*14-1:0] array_16bit_mux_q,
    output reg [5-1:0] size_16bit_mux_q
);
    // 
    reg [8*64-1:0] data_in_t;
    reg [3-1:0] address_in_t;
    reg [8*8-1:0] data_in_q;
    // 8 variables for dff
    reg flag_8bit_q;
    reg [3-1:0] left_8bit_q;
    reg [3-1:0] right_8bit_q;
    reg [8*14-1:0] array_8bit_q;
    reg [4-1:0] size_8bit_q;
    // 16
    reg flag_16bit_q;
    reg [4-1:0] left_16bit_q;
    reg [4-1:0] right_16bit_q;
    reg [16*14-1:0] array_16bit_q;
    reg [5-1:0] size_16bit_q;
    // 8 
    wire [3-1:0] left_8bit_d;
    wire [3-1:0] right_8bit_d;
    wire flag_8bit_d;
    wire [8*14-1:0] array_8bit_d;
    wire [4-1:0] size_8bit_d;
    //16
    wire [4-1:0] left_16bit_d;
    wire [4-1:0] right_16bit_d;
    wire flag_16bit_d;
    wire [14*16-1:0] array_16bit_d;
    wire [5-1:0] size_16bit_d;
    // mux out variable
    reg [3-1:0] left_8bit_mux;
    reg [3-1:0] right_8bit_mux;
    reg flag_8bit_mux;
    reg [8*14-1:0] array_8bit_mux;
    reg [4-1:0] size_8bit_mux;
    //16
    reg [4-1:0] left_16bit_mux;
    reg [4-1:0] right_16bit_mux;
    reg flag_16bit_mux;
    reg [16*14-1:0] array_16bit_mux;
    reg [5-1:0] size_16bit_mux;
    always @(*) begin
        case (address_in_t)
            3'b011: begin
                data_in_q = data_in_t[8*8-1:8*0];
            end
            3'b100: begin
                data_in_q = data_in_t[8*16-1:8*8];
            end
            3'b101: begin
                data_in_q = data_in_t[8*24-1:8*16];
            end
            3'b110: begin
                data_in_q = data_in_t[8*32-1:8*24];
            end
            3'b111: begin
                data_in_q = data_in_t[8*40-1:8*32];
            end
            3'b000: begin
                data_in_q = data_in_t[8*48-1:8*40];
            end
            3'b001: begin
                data_in_q = data_in_t[8*56-1:8*48];
            end
            3'b010: begin
                data_in_q = data_in_t[8*64-1:8*56];
            end
        endcase
    end
    module_8bit_enhanced M0(.data_in(data_in_q), .left(left_8bit_d), .right(right_8bit_d), .flag(flag_8bit_d), .array(array_8bit_d), .size(size_8bit_d));
    always @(*) begin
        if ( address_in_t[0] == 1'b1) begin
            left_8bit_mux = left_8bit_d;
            right_8bit_mux = right_8bit_d;
            flag_8bit_mux = flag_8bit_d;
            array_8bit_mux = array_8bit_d;
            size_8bit_mux = size_8bit_d;
        end
        else begin
            left_8bit_mux = left_8bit_q;
            right_8bit_mux = right_8bit_q;
            flag_8bit_mux = flag_8bit_q;
            array_8bit_mux = array_8bit_q;
            size_8bit_mux = size_8bit_q;
        end
    end
    module_16bit N0(.l_l(left_8bit_d), .l_r(right_8bit_d), .r_l(left_8bit_mux), .r_r(right_8bit_mux), .l_flag(flag_8bit_d), .r_flag(flag_8bit_mux), .l_array(array_8bit_d), .r_array(array_8bit_mux), .l_size(size_8bit_d), .r_size(size_8bit_mux), .left(left_16bit_d), .right(right_16bit_d), .flag(flag_16bit_d), .array(array_16bit_d), .size(size_16bit_d));
    always @(*) begin
        if ( address_in_t[1:0] == 2'b00) begin
            left_16bit_mux = left_16bit_d;
            right_16bit_mux = right_16bit_d;
            flag_16bit_mux = flag_16bit_d;
            array_16bit_mux = array_16bit_d;
            size_16bit_mux = size_16bit_d;
        end
        else begin
            left_16bit_mux = left_16bit_q;
            right_16bit_mux = right_16bit_q;
            flag_16bit_mux = flag_16bit_q;
            array_16bit_mux = array_16bit_q;
            size_16bit_mux = size_16bit_q;
        end
    end
    always @(posedge clk) begin
        if (!reset) begin
            flag_8bit_q <= 0;
            left_8bit_q <= 0;
            right_8bit_q <= 0;
            array_8bit_q <= 0;
            size_8bit_q <= 0;
            flag_16bit_q <= 0;
            left_16bit_q <= 0;
            right_16bit_q <= 0;
            array_16bit_q <= 0;
            size_16bit_q <= 0;
        end else begin
            flag_8bit_q <= flag_8bit_mux;
            left_8bit_q <= left_8bit_mux;
            right_8bit_q <= right_8bit_mux;
            array_8bit_q <= array_8bit_mux;
            size_8bit_q <= size_8bit_mux;
            flag_16bit_q <= flag_16bit_mux;
            left_16bit_q <= left_16bit_mux;
            right_16bit_q <= right_16bit_mux;
            array_16bit_q <= array_16bit_mux;
            size_16bit_q <= size_16bit_mux;
        end
    end
    always @(posedge clk) begin
        if (!reset) begin
            left_16bit_mux_q <= 0;
            right_16bit_mux_q <= 0;
            flag_16bit_mux_q <= 0;
            array_16bit_mux_q <= 0;
            size_16bit_mux_q <= 0;   
            address_in_t <= 0; 
            data_in_t <= 0;
        end
        else begin
            left_16bit_mux_q <= left_16bit_mux;
            right_16bit_mux_q <= right_16bit_mux;
            flag_16bit_mux_q <= flag_16bit_mux;
            array_16bit_mux_q <= array_16bit_mux;
            size_16bit_mux_q <= size_16bit_mux;
            address_in_t <= address_in;
            data_in_t <= data_in;
        end
    end
endmodule
