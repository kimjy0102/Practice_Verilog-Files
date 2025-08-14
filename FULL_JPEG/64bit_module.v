module module_64bit(
    input [5-1:0] l_l, // left left 0's max 0~ 15
    input [5-1:0] l_r,
    input [5-1:0] r_l,
    input [5-1:0] r_r,
    input l_flag,
    input r_flag,
    input [32*14-1:0] l_array,
    // max size = 32 , && each component has 14bit -> 32x 14 = 448
    input [32*14-1:0] r_array,
    input [6-1:0] l_size, // actually using size in array max i 32
    input [6-1:0] r_size,
    output reg [6-1:0] left, // output of left zeros's 0 ~ 63
    output reg [6-1:0] right, // output of right zeros
    output reg flag, // all zeros
    output reg [64*14-1:0] array,
    // max size -> all numbers 64 && each component size 14bit 64 * 14 = 896
    output reg [6-1:0] size 
);
    //wire [64*14-1:0] l_concat; // stretch input l_array into larger size
    //wire [64*14-1:0] r_concat;
    //assign l_concat = l_array;
    //assign r_concat = r_array;
    wire [6-1:0] zero_count;
    assign zero_count = l_r + r_l;
    always @(*) begin
        if ({l_flag, r_flag} == 2'b00) begin
            flag = 1'b0;
            left = 6'b0;
            right = 6'b0;
            array = 896'b0;
            size = 6'b0;
        end
        else if ({l_flag, r_flag} == 2'b11) begin
            flag = 1'b1;
            left = l_l;
            right = r_r;
            size = l_size + r_size;
            if ({l_r, r_l} == 10'b00000_00000) begin
                //array = (l_concat << (r_size * 14)) + r_concat;
                case (r_size)
                6'b000001: begin // 1
                    array[14*1-1:14*0] = r_array;
                    array[14*64-1:14*1] = l_array;
                end
                6'b000010: begin // 2
                    array[14*2-1:14*0] = r_array;
                    array[14*64-1:14*2] = l_array;
                end
                6'b000011: begin // 3
                    array[14*3-1:14*0] = r_array;
                    array[14*64-1:14*3] = l_array;
                end
                6'b000100: begin // 4
                    array[14*4-1:14*0] = r_array;
                    array[14*64-1:14*4] = l_array;
                end
                6'b000101: begin // 5
                    array[14*5-1:14*0] = r_array;
                    array[14*64-1:14*5] = l_array;
                end
                6'b000110: begin // 6
                    array[14*6-1:14*0] = r_array;
                    array[14*64-1:14*6] = l_array;
                end
                6'b000111: begin // 7
                    array[14*7-1:14*0] = r_array;
                    array[14*64-1:14*7] = l_array;
                end
                6'b001000: begin // 8
                    array[14*8-1:14*0] = r_array;
                    array[14*64-1:14*8] = l_array;
                end
                6'b001001: begin // 9
                    array[14*9-1:14*0] = r_array;
                    array[14*64-1:14*9] = l_array;
                end
                6'b001010: begin // 10
                    array[14*10-1:14*0] = r_array;
                    array[14*64-1:14*10] = l_array;
                end
                6'b001011: begin // 11
                    array[14*11-1:14*0] = r_array;
                    array[14*64-1:14*11] = l_array;
                end
                6'b001100: begin // 12
                    array[14*12-1:14*0] = r_array;
                    array[14*64-1:14*12] = l_array;
                end
                6'b001101: begin // 13
                    array[14*13-1:14*0] = r_array;
                    array[14*64-1:14*13] = l_array;
                end
                6'b001110: begin //14
                    array[14*14-1:14*0] = r_array;
                    array[14*64-1:14*14] = l_array;
                end
                6'b001111: begin // 15
                    array[14*15-1:14*0] = r_array;
                    array[14*64-1:14*15] = l_array;
                end
                6'b010000: begin // 16
                    array[14*16-1:14*0] = r_array;
                    array[14*64-1:14*16] = l_array;
                end
                6'b010001: begin // 17
                    array[14*17-1:14*0] = r_array;
                    array[14*64-1:14*17] = l_array;
                end
                6'b010010: begin // 18
                    array[14*18-1:14*0] = r_array;
                    array[14*64-1:14*18] = l_array;
                end
                6'b010011: begin // 19
                    array[14*19-1:14*0] = r_array;
                    array[14*64-1:14*19] = l_array;
                end
                6'b010100: begin // 20
                    array[14*20-1:14*0] = r_array;
                    array[14*64-1:14*20] = l_array;
                end
                6'b010101: begin // 21
                    array[14*21-1:14*0] = r_array;
                    array[14*64-1:14*21] = l_array;
                end
                6'b010110: begin // 22
                    array[14*22-1:14*0] = r_array;
                    array[14*64-1:14*22] = l_array;
                end
                6'b010111: begin // 23
                    array[14*23-1:14*0] = r_array;
                    array[14*64-1:14*23] = l_array;
                end
                6'b011000: begin // 24
                    array[14*24-1:14*0] = r_array;
                    array[14*64-1:14*24] = l_array;
                end
                6'b011001: begin // 25
                    array[14*25-1:14*0] = r_array;
                    array[14*64-1:14*25] = l_array;
                end
                6'b011010: begin // 26
                    array[14*26-1:14*0] = r_array;
                    array[14*64-1:14*26] = l_array;
                end
                6'b011011: begin // 27
                    array[14*27-1:14*0] = r_array;
                    array[14*64-1:14*27] = l_array;
                end
                6'b011100: begin // 28 
                    array[14*28-1:14*0] = r_array;
                    array[14*64-1:14*28] = l_array;
                end
                6'b011101: begin // 29
                    array[14*29-1:14*0] = r_array;
                    array[14*64-1:14*29] = l_array;
                end
                6'b011110: begin // 30
                    array[14*30-1:14*0] = r_array;
                    array[14*64-1:14*30] = l_array;
                end
                6'b011111: begin // 31
                    array[14*31-1:14*0] = r_array;
                    array[14*64-1:14*31] = l_array;
                end
                6'b100000: begin // 32
                    array[14*32-1:14*0] = r_array;
                    array[14*64-1:14*32] = l_array;
                end
                default : begin
                    array = 0;
                end
                endcase
            end
            else begin
                //array = (l_concat << ((r_size * 14))) + r_concat + ({zero_count, 8'b0} << ((r_size-1)*14));
                case (r_size)
                6'b000001: begin // 1
                    array[14*1-1:14*0] = r_array;
                    array[14*1-1:14*1-6] = zero_count;
                    array[14*64-1:14*1] = l_array;
                end
                6'b000010: begin // 2
                    array[14*2-1:14*0] = r_array;
                    array[14*2-1:14*2-6] = zero_count;
                    array[14*64-1:14*2] = l_array;
                end
                6'b000011: begin // 3
                    array[14*3-1:14*0] = r_array;
                    array[14*3-1:14*3-6] = zero_count;
                    array[14*64-1:14*3] = l_array;
                end
                6'b000100: begin // 4
                    array[14*4-1:14*0] = r_array;
                    array[14*4-1:14*4-6] = zero_count;
                    array[14*64-1:14*4] = l_array;
                end
                6'b000101: begin // 5
                    array[14*5-1:14*0] = r_array;
                    array[14*5-1:14*5-6] = zero_count;
                    array[14*64-1:14*5] = l_array;
                end
                6'b000110: begin // 6
                    array[14*6-1:14*0] = r_array;
                    array[14*6-1:14*6-6] = zero_count;
                    array[14*64-1:14*6] = l_array;
                end
                6'b000111: begin // 7
                    array[14*7-1:14*0] = r_array;
                    array[14*7-1:14*7-6] = zero_count;
                    array[14*64-1:14*7] = l_array;
                end
                6'b001000: begin // 8
                    array[14*8-1:14*0] = r_array;
                    array[14*8-1:14*8-6] = zero_count;
                    array[14*64-1:14*8] = l_array;
                end
                6'b001001: begin // 9
                    array[14*9-1:14*0] = r_array;
                    array[14*9-1:14*9-6] = zero_count;
                    array[14*64-1:14*9] = l_array;
                end
                6'b001010: begin // 10
                    array[14*10-1:14*0] = r_array;
                    array[14*10-1:14*10-6] = zero_count;
                    array[14*64-1:14*10] = l_array;
                end
                6'b001011: begin // 11
                    array[14*11-1:14*0] = r_array;
                    array[14*11-1:14*11-6] = zero_count;
                    array[14*64-1:14*11] = l_array;
                end
                6'b001100: begin // 12
                    array[14*12-1:14*0] = r_array;
                    array[14*12-1:14*12-6] = zero_count;
                    array[14*64-1:14*12] = l_array;
                end
                6'b001101: begin // 13
                    array[14*13-1:14*0] = r_array;
                    array[14*13-1:14*13-6] = zero_count;
                    array[14*64-1:14*13] = l_array;
                end
                6'b001110: begin //14
                    array[14*14-1:14*0] = r_array;
                    array[14*14-1:14*14-6] = zero_count;
                    array[14*64-1:14*14] = l_array;
                end
                6'b001111: begin // 15
                    array[14*15-1:14*0] = r_array;
                    array[14*15-1:14*15-6] = zero_count;
                    array[14*64-1:14*15] = l_array;
                end
                6'b010000: begin // 16
                    array[14*16-1:14*0] = r_array;
                    array[14*16-1:14*16-6] = zero_count;
                    array[14*64-1:14*16] = l_array;
                end
                6'b010001: begin // 17
                    array[14*17-1:14*0] = r_array;
                    array[14*17-1:14*17-6] = zero_count;
                    array[14*64-1:14*17] = l_array;
                end
                6'b010010: begin // 18
                    array[14*18-1:14*0] = r_array;
                    array[14*18-1:14*18-6] = zero_count;
                    array[14*64-1:14*18] = l_array;
                end
                6'b010011: begin // 19
                    array[14*19-1:14*0] = r_array;
                    array[14*19-1:14*19-6] = zero_count;
                    array[14*64-1:14*19] = l_array;
                end
                6'b010100: begin // 20
                    array[14*20-1:14*0] = r_array;
                    array[14*20-1:14*20-6] = zero_count;
                    array[14*64-1:14*20] = l_array;
                end
                6'b010101: begin // 21
                    array[14*21-1:14*0] = r_array;
                    array[14*21-1:14*21-6] = zero_count;
                    array[14*64-1:14*21] = l_array;
                end
                6'b010110: begin // 22
                    array[14*22-1:14*0] = r_array;
                    array[14*22-1:14*22-6] = zero_count;
                    array[14*64-1:14*22] = l_array;
                end
                6'b010111: begin // 23
                    array[14*23-1:14*0] = r_array;
                    array[14*23-1:14*23-6] = zero_count;
                    array[14*64-1:14*23] = l_array;
                end
                6'b011000: begin // 24
                    array[14*24-1:14*0] = r_array;
                    array[14*24-1:14*24-6] = zero_count;
                    array[14*64-1:14*24] = l_array;
                end
                6'b011001: begin // 25
                    array[14*25-1:14*0] = r_array;
                    array[14*25-1:14*25-6] = zero_count;
                    array[14*64-1:14*25] = l_array;
                end
                6'b011010: begin // 26
                    array[14*26-1:14*0] = r_array;
                    array[14*26-1:14*26-6] = zero_count;
                    array[14*64-1:14*26] = l_array;
                end
                6'b011011: begin // 27
                    array[14*27-1:14*0] = r_array;
                    array[14*27-1:14*27-6] = zero_count;
                    array[14*64-1:14*27] = l_array;
                end
                6'b011100: begin // 28 
                    array[14*28-1:14*0] = r_array;
                    array[14*28-1:14*28-6] = zero_count;
                    array[14*64-1:14*28] = l_array;
                end
                6'b011101: begin // 29
                    array[14*29-1:14*0] = r_array;
                    array[14*29-1:14*29-6] = zero_count;
                    array[14*64-1:14*29] = l_array;
                end
                6'b011110: begin // 30
                    array[14*30-1:14*0] = r_array;
                    array[14*30-1:14*30-6] = zero_count;
                    array[14*64-1:14*30] = l_array;
                end
                6'b011111: begin // 31
                    array[14*31-1:14*0] = r_array;
                    array[14*31-1:14*31-6] = zero_count;
                    array[14*64-1:14*31] = l_array;
                end
                6'b100000: begin // 32
                    array[14*32-1:14*0] = r_array;
                    array[14*32-1:14*32-6] = zero_count; 
                    array[14*64-1:14*32] = l_array;
                end
                default : begin
                    array = 0;
                end
                endcase
            end
        end
        else if ({l_flag, r_flag} == 2'b01) begin
            flag = 1'b1;
            left = 6'b100000 + r_l;
            right = r_r;
            array = r_array;
            size = r_size;
        end
        else begin
            flag = 1'b1;
            left = l_l;
            right = l_r + 6'b100000;
            array = l_array;
            size = l_size;
        end
    end
endmodule

