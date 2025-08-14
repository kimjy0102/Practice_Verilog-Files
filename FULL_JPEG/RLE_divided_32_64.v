module RLE_enhanced_32(
    input clk,
    input reset,
    input [3-1:0] address_in,
    input [4-1:0] left_16bit,
    input [4-1:0] right_16bit,
    input flag_16bit,
    input [16*14-1:0] array_16bit,
    input [5-1:0] size_16bit,
    input [4-1:0] left_16bit_mux,
    input [4-1:0] right_16bit_mux,
    input flag_16bit_mux,
    input [14*16-1:0] array_16bit_mux,
    input [5-1:0] size_16bit_mux,
    output reg [14*64-1:0] encoded_data_q
);
    reg [3-1:0] address_d;
    reg [4-1:0] left_16bit_d;
    reg [4-1:0] right_16bit_d;
    reg flag_16bit_d;
    reg [16*14-1:0] array_16bit_d;
    reg [5-1:0] size_16bit_d;
    reg [4-1:0] left_16bit_mux_d;
    reg [4-1:0] right_16bit_mux_d;
    reg flag_16bit_mux_d;
    reg [14*16-1:0] array_16bit_mux_d;
    reg [5-1:0] size_16bit_mux_d;
    // 32
    reg flag_32bit_q;
    reg [5-1:0] left_32bit_q;
    reg [5-1:0] right_32bit_q;
    reg [32*14-1:0] array_32bit_q;
    reg [6-1:0] size_32bit_q;
    // 32
    wire [5-1:0] left_32bit_d;
    wire [5-1:0] right_32bit_d;
    wire flag_32bit_d;
    wire [14*32-1:0] array_32bit_d;
    wire [6-1:0] size_32bit_d;
    // mux out variable
    // 32
    reg [5-1:0] left_32bit_mux;
    reg [5-1:0] right_32bit_mux;
    reg flag_32bit_mux;
    reg [32*14-1:0] array_32bit_mux;
    reg [6-1:0] size_32bit_mux;
    // 64
    wire [6-1:0] left_64bit;
    wire [6-1:0] right_64bit;
    wire flag_64bit;
    wire [64*14-1:0] array_64bit;
    wire [6-1:0] size_64bit;

    module_32bit O0(.l_l(left_16bit_d), .l_r(right_16bit_d), .r_l(left_16bit_mux_d), .r_r(right_16bit_mux_d), .l_flag(flag_16bit_d), .r_flag(flag_16bit_mux_d), .l_array(array_16bit_d), .r_array(array_16bit_mux_d), .l_size(size_16bit_d), .r_size(size_16bit_mux_d), .left(left_32bit_d), .right(right_32bit_d), .flag(flag_32bit_d), .array(array_32bit_d), .size(size_32bit_d));
    always @(*) begin
        if (address_d[2:0] == 3'b110) begin
            left_32bit_mux = left_32bit_d;
            right_32bit_mux = right_32bit_d;
            flag_32bit_mux = flag_32bit_d;
            array_32bit_mux = array_32bit_d;
            size_32bit_mux = size_32bit_d;
        end
        else begin
            left_32bit_mux = left_32bit_q;
            right_32bit_mux = right_32bit_q;
            flag_32bit_mux = flag_32bit_q;
            array_32bit_mux = array_32bit_q;
            size_32bit_mux = size_32bit_q;
        end
    end
    module_64bit P0(.l_l(left_32bit_d), .l_r(right_32bit_d), .r_l(left_32bit_mux), .r_r(right_32bit_mux), .l_flag(flag_32bit_d), .r_flag(flag_32bit_mux), .l_array(array_32bit_d), .r_array(array_32bit_mux), .l_size(size_32bit_d), .r_size(size_32bit_mux), .left(left_64bit), .right(right_64bit), .flag(flag_64bit), .array(array_64bit), .size(size_64bit));
    //wire [10-1:0] shifter;
    //assign shifter = (64 - size_64bit) * 14;
    reg [14*64-1:0] encoded_data;
    //assign encoded_data = flag_64bit ? ((array_64bit << shifter) + (14'b1111_1111_1111_11 << (shifter - 14))) : ;
    always @(*) begin
        if (flag_64bit == 0) begin
            encoded_data = {14'b1111_1111_1111_11, 882'b0};
        end
        else begin
            case (size_64bit)
                6'b000001: begin // 1
                    encoded_data = {array_64bit[14*1-1:14*0], 14'b1111_1111_1111_11, 868'b0};
                end
                6'b000010: begin // 2
                    encoded_data = {array_64bit[14*2-1:14*0], 14'b1111_1111_1111_11, 854'b0}; 
                end
                6'b000011: begin // 3
                    encoded_data = {array_64bit[14*3-1:14*0], 14'b1111_1111_1111_11, 840'b0};
                end
                6'b000100: begin // 4
                    encoded_data = {array_64bit[14*4-1:14*0], 14'b1111_1111_1111_11, 826'b0};
                end
                6'b000101: begin // 5
                    encoded_data = {array_64bit[14*5-1:14*0], 14'b1111_1111_1111_11, 812'b0};
                end
                6'b000110: begin // 6
                    encoded_data = {array_64bit[14*6-1:14*0], 14'b1111_1111_1111_11, 798'b0};
                end
                6'b000111: begin // 7
                    encoded_data = {array_64bit[14*7-1:14*0], 14'b1111_1111_1111_11, 784'b0};
                end
                6'b001000: begin // 8
                    encoded_data = {array_64bit[14*8-1:14*0], 14'b1111_1111_1111_11, 770'b0};
                end
                6'b001001: begin // 9
                    encoded_data = {array_64bit[14*9-1:14*0], 14'b1111_1111_1111_11, 756'b0};
                end
                6'b001010: begin // 10
                    encoded_data = {array_64bit[14*10-1:14*0], 14'b1111_1111_1111_11, 742'b0};
                end
                6'b001011: begin // 11
                    encoded_data = {array_64bit[14*11-1:14*0], 14'b1111_1111_1111_11, 728'b0};
                end
                6'b001100: begin // 12
                    encoded_data = {array_64bit[14*12-1:14*0], 14'b1111_1111_1111_11, 714'b0};
                end
                6'b001101: begin // 13
                    encoded_data = {array_64bit[14*13-1:14*0], 14'b1111_1111_1111_11, 700'b0};
                end
                6'b001110: begin // 14
                    encoded_data = {array_64bit[14*14-1:14*0], 14'b1111_1111_1111_11, 686'b0};
                end
                6'b001111: begin // 15
                    encoded_data = {array_64bit[14*15-1:14*0], 14'b1111_1111_1111_11, 672'b0};
                end
                6'b010000: begin // 16
                    encoded_data = {array_64bit[14*16-1:14*0], 14'b1111_1111_1111_11, 658'b0};
                end
                6'b010001: begin // 17
                    encoded_data = {array_64bit[14*17-1:14*0], 14'b1111_1111_1111_11, 644'b0};
                end
                6'b010010: begin // 18
                    encoded_data = {array_64bit[14*18-1:14*0], 14'b1111_1111_1111_11, 630'b0};
                end
                6'b010011: begin // 19
                    encoded_data = {array_64bit[14*19-1:14*0], 14'b1111_1111_1111_11, 616'b0};
                end
                6'b010100: begin // 20
                    encoded_data = {array_64bit[14*20-1:14*0], 14'b1111_1111_1111_11, 602'b0};
                end
                6'b010101: begin // 21
                    encoded_data = {array_64bit[14*21-1:14*0], 14'b1111_1111_1111_11, 588'b0};
                end
                6'b010110: begin // 22
                    encoded_data = {array_64bit[14*22-1:14*0], 14'b1111_1111_1111_11, 574'b0};
                end
                6'b010111: begin // 23 
                    encoded_data = {array_64bit[14*23-1:14*0], 14'b1111_1111_1111_11, 560'b0};
                end
                6'b011000: begin // 24
                    encoded_data = {array_64bit[14*24-1:14*0], 14'b1111_1111_1111_11, 546'b0};
                end
                6'b011001: begin // 25
                    encoded_data = {array_64bit[14*25-1:14*0], 14'b1111_1111_1111_11, 532'b0};
                end
                6'b011010: begin // 26
                    encoded_data = {array_64bit[14*26-1:14*0], 14'b1111_1111_1111_11, 518'b0}; 
                end
                6'b011011: begin // 27
                    encoded_data = {array_64bit[14*27-1:14*0], 14'b1111_1111_1111_11, 504'b0};
                end
                6'b011100: begin // 28
                    encoded_data = {array_64bit[14*28-1:14*0], 14'b1111_1111_1111_11, 490'b0};
                end
                6'b011101: begin // 29
                    encoded_data = {array_64bit[14*29-1:14*0], 14'b1111_1111_1111_11, 476'b0};
                end
                6'b011110: begin // 30
                    encoded_data = {array_64bit[14*30-1:14*0], 14'b1111_1111_1111_11, 462'b0};
                end
                6'b011111: begin // 31
                    encoded_data = {array_64bit[14*31-1:14*0], 14'b1111_1111_1111_11, 448'b0};
                end
                6'b100000: begin // 32
                    encoded_data = {array_64bit[14*32-1:14*0], 14'b1111_1111_1111_11, 434'b0};
                end
                6'b100001: begin // 33
                    encoded_data = {array_64bit[14*33-1:14*0], 14'b1111_1111_1111_11, 420'b0};
                end
                6'b100010: begin // 34
                    encoded_data = {array_64bit[14*34-1:14*0], 14'b1111_1111_1111_11, 406'b0};
                end
                6'b100011: begin // 35
                    encoded_data = {array_64bit[14*35-1:14*0], 14'b1111_1111_1111_11, 392'b0};
                end
                6'b100100: begin // 36
                    encoded_data = {array_64bit[14*36-1:14*0], 14'b1111_1111_1111_11, 378'b0};
                end
                6'b100101: begin // 37
                    encoded_data = {array_64bit[14*37-1:14*0], 14'b1111_1111_1111_11, 364'b0};
                end
                6'b100110: begin // 38
                    encoded_data = {array_64bit[14*38-1:14*0], 14'b1111_1111_1111_11, 350'b0};
                end
                6'b100111: begin // 39
                    encoded_data = {array_64bit[14*39-1:14*0], 14'b1111_1111_1111_11, 336'b0};
                end
                6'b101000: begin // 40
                    encoded_data = {array_64bit[14*40-1:14*0], 14'b1111_1111_1111_11, 322'b0};
                end
                6'b101001: begin // 41
                    encoded_data = {array_64bit[14*41-1:14*0], 14'b1111_1111_1111_11, 308'b0};
                end
                6'b101010: begin // 42
                    encoded_data = {array_64bit[14*42-1:14*0], 14'b1111_1111_1111_11, 294'b0};
                end
                6'b101011: begin // 43 
                    encoded_data = {array_64bit[14*43-1:14*0], 14'b1111_1111_1111_11, 280'b0};
                end
                6'b101100: begin // 44
                    encoded_data = {array_64bit[14*44-1:14*0], 14'b1111_1111_1111_11, 266'b0};
                end
                6'b101101: begin // 45
                    encoded_data = {array_64bit[14*45-1:14*0], 14'b1111_1111_1111_11, 252'b0};
                end
                6'b101110: begin // 46
                    encoded_data = {array_64bit[14*46-1:14*0], 14'b1111_1111_1111_11, 238'b0};
                end
                6'b101111: begin // 47
                    encoded_data = {array_64bit[14*47-1:14*0], 14'b1111_1111_1111_11, 224'b0};
                end
                6'b110000: begin // 48
                    encoded_data = {array_64bit[14*48-1:14*0], 14'b1111_1111_1111_11, 210'b0};
                end
                6'b110001: begin // 49
                    encoded_data = {array_64bit[14*49-1:14*0], 14'b1111_1111_1111_11, 196'b0};
                end
                6'b110010: begin // 50
                    encoded_data = {array_64bit[14*50-1:14*0], 14'b1111_1111_1111_11, 182'b0};
                end
                6'b110011: begin // 51
                    encoded_data = {array_64bit[14*51-1:14*0], 14'b1111_1111_1111_11, 168'b0};
                end
                6'b110100: begin // 52
                    encoded_data = {array_64bit[14*52-1:14*0], 14'b1111_1111_1111_11, 154'b0};
                end
                6'b110101: begin // 53
                    encoded_data = {array_64bit[14*53-1:14*0], 14'b1111_1111_1111_11, 140'b0};
                end
                6'b110110: begin // 54
                    encoded_data = {array_64bit[14*54-1:14*0], 14'b1111_1111_1111_11, 126'b0};
                end
                6'b110111: begin // 55
                    encoded_data = {array_64bit[14*55-1:14*0], 14'b1111_1111_1111_11, 112'b0};
                end
                6'b111000: begin // 56
                    encoded_data = {array_64bit[14*56-1:14*0], 14'b1111_1111_1111_11, 98'b0};
                end
                6'b111001: begin // 57
                    encoded_data = {array_64bit[14*57-1:14*0], 14'b1111_1111_1111_11, 84'b0};
                end
                6'b111010: begin // 58
                    encoded_data = {array_64bit[14*58-1:14*0], 14'b1111_1111_1111_11, 70'b0};
                end
                6'b111011: begin // 59
                    encoded_data = {array_64bit[14*59-1:14*0], 14'b1111_1111_1111_11, 56'b0};
                end
                6'b111100: begin // 60
                    encoded_data = {array_64bit[14*60-1:14*0], 14'b1111_1111_1111_11, 42'b0};
                end
                6'b111101: begin // 61
                    encoded_data = {array_64bit[14*61-1:14*0], 14'b1111_1111_1111_11, 28'b0};
                end
                6'b111110: begin // 62
                    encoded_data = {array_64bit[14*62-1:14*0], 14'b1111_1111_1111_11, 14'b0};
                end
                6'b111111: begin // 63
                    encoded_data = {array_64bit[14*63-1:14*0], 14'b1111_1111_1111_11};
                end
                default : begin
                    encoded_data = {14'b1111_1111_1111_11, 882'b0}; 
                end
            endcase 
        end
    end
    always @(posedge clk) begin
        if (!reset) begin
            flag_32bit_q <= 0;
            left_32bit_q <= 0;
            right_32bit_q <= 0;
            array_32bit_q <= 0;
            size_32bit_q <= 0;
        end else begin
            flag_32bit_q <= flag_32bit_mux;
            left_32bit_q <= left_32bit_mux;
            right_32bit_q <= right_32bit_mux;
            array_32bit_q <= array_32bit_mux;
            size_32bit_q <= size_32bit_mux;
        end
    end
    always @(posedge clk) begin
        if (!reset) begin
            address_d <= 0;
            left_16bit_d <= 0;
            right_16bit_d <= 0;
            flag_16bit_d <= 0;
            array_16bit_d <= 0;
            size_16bit_d <= 0;
            left_16bit_mux_d <= 0;
            right_16bit_mux_d <= 0;
            flag_16bit_mux_d <= 0;
            array_16bit_mux_d <= 0;
            size_16bit_mux_d <= 0;
            encoded_data_q <= 0;
        end
        else begin
            address_d <= address_in;
            left_16bit_d <= left_16bit;
            right_16bit_d <= right_16bit;
            flag_16bit_d <= flag_16bit;
            array_16bit_d <= array_16bit;
            size_16bit_d <= size_16bit;
            left_16bit_mux_d <= left_16bit_mux;
            right_16bit_mux_d <= right_16bit_mux;
            flag_16bit_mux_d <= flag_16bit_mux;
            array_16bit_mux_d <= array_16bit_mux;
            size_16bit_mux_d <= size_16bit_mux;
            encoded_data_q <= encoded_data;
        end
    end
endmodule
