module module_32bit(
    input [4-1:0] l_l, // left left 0's max 0~15
    input [4-1:0] l_r, // left right 0's
    input [4-1:0] r_l, // right left 0's
    input [4-1:0] r_r, // right right 0's
    input l_flag,   // only 0000_0000_0000_0000-> 0
    input r_flag,   // only 0000_0000_0000_0000-> 0
    input [16*14-1:0] l_array, // if number -> comes as 0, if 0 -> then comes as 0 count
    // max size -> 16 && each component size -> 14bit   16 * 14 = 224
    input [16*14-1:0] r_array,
    input [5-1:0] l_size, // actually using size in array (left) max is 16 -> 10000 -> 5bit
    input [5-1:0] r_size, // actually using size in array (right)
    output reg [5-1:0] left, // output of left zero's 0 ~ 31
    output reg [5-1:0] right, // output ''
    output reg flag, // all zeros
    output reg [32*14-1:0] array, // output array
    // max size -> 32 && each component size -> 14bit 32 x 14 = 448
    output reg [6-1:0] size // actually using size in array (total) max is 32 -> 100000 -> 6bit
);
    //wire [32*14-1:0] l_concat; // stretch input l_array into larger size
    //wire [32*14-1:0] r_concat;
    //assign l_concat = l_array;
    //assign r_concat = r_array;
    wire [6-1:0] zero_count;
    assign zero_count = l_r + r_l;
    always @(*) begin
        if ({l_flag, r_flag} == 2'b00) begin // 0000_0000_0000_0000 / 0000_0000_0000_0000
            flag = 1'b0;
            left = 5'b0;
            right = 5'b0;
            array = 448'b0;
            size = 6'b0;
        end
        else if ({l_flag, r_flag} == 2'b11) begin // each left & right has at least 1 one
            flag = 1'b1;
            left = l_l;
            right = r_r;
            size = l_size + r_size;
            if ({l_r, r_l} == 8'b0000_0000) begin // ----_----_----_---1 / 1---_----_----_----
                //array = (l_concat << (r_size * 14)) + r_concat;
                case (r_size) 
                5'b00001: begin // 1
                    array[14*1-1:14*0] = r_array;
                    array[14*32-1:14*1] = l_array;
                end
                5'b00010: begin // 2
                    array[14*2-1:14*0] = r_array;
                    array[14*32-1:14*2] = l_array;
                end
                5'b00011: begin // 3
                    array[14*3-1:14*0] = r_array;
                    array[14*32-1:14*3] = l_array;
                end
                5'b00100: begin // 4
                    array[14*4-1:14*0] = r_array;
                    array[14*32-1:14*4] = l_array;
                end
                5'b00101: begin // 5
                    array[14*5-1:14*0] = r_array;
                    array[14*32-1:14*5] = l_array;
                end
                5'b00110: begin // 6
                    array[14*6-1:14*0] = r_array;
                    array[14*32-1:14*6] = l_array;
                end
                5'b00111: begin // 7
                    array[14*7-1:14*0] = r_array;
                    array[14*32-1:14*7] = l_array;
                end
                5'b01000: begin // 8
                    array[14*8-1:14*0] = r_array;
                    array[14*32-1:14*8] = l_array;
                end
                5'b01001: begin // 9
                    array[14*9-1:14*0] = r_array;
                    array[14*32-1:14*9] = l_array;
                end
                5'b01010: begin // 10
                    array[14*10-1:14*0] = r_array;
                    array[14*32-1:14*10] = l_array;
                end
                5'b01011: begin // 11
                    array[14*11-1:14*0] = r_array;
                    array[14*32-1:14*11] = l_array;
                end
                5'b01100: begin // 12
                    array[14*12-1:14*0] = r_array;
                    array[14*32-1:14*12] = l_array;
                end
                5'b01101: begin // 13
                    array[14*13-1:14*0] = r_array;
                    array[14*32-1:14*13] = l_array;
                end
                5'b01110: begin // 14
                    array[14*14-1:14*0] = r_array;
                    array[14*32-1:14*14] = l_array;
                end
                5'b01111: begin // 15
                    array[14*15-1:14*0] = r_array;
                    array[14*32-1:14*15] = l_array;
                end
                5'b10000: begin // 16
                    array[14*16-1:14*0] = r_array;
                    array[14*32-1:14*16] = l_array;
                end
                default begin
                    array = 0;
                end
                endcase
            end
            else begin // at least left or right is 1 && there is at least one in middle
                //array = (l_concat << ((r_size*14))) + r_concat + ({zero_count, 8'b0} << ((r_size-1)*14)); 
                case (r_size) 
                5'b00001: begin // 1
                    array[14*1-1:14*0] = r_array;
                    array[14*1-1:14*1-6] = zero_count;
                    array[14*32-1:14*1] = l_array;
                end
                5'b00010: begin // 2
                    array[14*2-1:14*0] = r_array;
                    array[14*2-1:14*2-6] = zero_count;
                    array[14*32-1:14*2] = l_array;
                end
                5'b00011: begin // 3
                    array[14*3-1:14*0] = r_array;
                    array[14*3-1:14*3-6] = zero_count;
                    array[14*32-1:14*3] = l_array;
                end
                5'b00100: begin // 4
                    array[14*4-1:14*0] = r_array;
                    array[14*4-1:14*4-6] = zero_count;
                    array[14*32-1:14*4] = l_array;
                end
                5'b00101: begin // 5
                    array[14*5-1:14*0] = r_array;
                    array[14*5-1:14*5-6] = zero_count;
                    array[14*32-1:14*5] = l_array;
                end
                5'b00110: begin // 6
                    array[14*6-1:14*0] = r_array;
                    array[14*6-1:14*6-6] = zero_count;
                    array[14*32-1:14*6] = l_array;
                end
                5'b00111: begin // 7
                    array[14*7-1:14*0] = r_array;
                    array[14*7-1:14*7-6] = zero_count;
                    array[14*32-1:14*7] = l_array;
                end
                5'b01000: begin // 8
                    array[14*8-1:14*0] = r_array;
                    array[14*8-1:14*8-6] = zero_count;
                    array[14*32-1:14*8] = l_array;
                end
                5'b01001: begin // 9
                    array[14*9-1:14*0] = r_array;
                    array[14*9-1:14*9-6] = zero_count;
                    array[14*32-1:14*9] = l_array;
                end
                5'b01010: begin // 10
                    array[14*10-1:14*0] = r_array;
                    array[14*10-1:14*10-6] = zero_count;
                    array[14*32-1:14*10] = l_array;
                end
                5'b01011: begin // 11
                    array[14*11-1:14*0] = r_array;
                    array[14*11-1:14*11-6] = zero_count;
                    array[14*32-1:14*11] = l_array;
                end
                5'b01100: begin // 12
                    array[14*12-1:14*0] = r_array;
                    array[14*12-1:14*12-6] = zero_count;
                    array[14*32-1:14*12] = l_array;
                end
                5'b01101: begin // 13
                    array[14*13-1:14*0] = r_array;
                    array[14*13-1:14*13-6] = zero_count;
                    array[14*32-1:14*13] = l_array;
                end
                5'b01110: begin // 14
                    array[14*14-1:14*0] = r_array;
                    array[14*14-1:14*14-6] = zero_count;
                    array[14*32-1:14*14] = l_array;
                end
                5'b01111: begin // 15
                    array[14*15-1:14*0] = r_array;
                    array[14*15-1:14*15-6] = zero_count;
                    array[14*32-1:14*15] = l_array;
                end
                5'b10000: begin // 16
                    array[14*16-1:14*0] = r_array;
                    array[14*16-1:14*16-6] = zero_count;
                    array[14*32-1:14*16] = l_array;
                end
                default begin
                    array = 0;
                end
                endcase
            end
        end
        else if ({l_flag, r_flag} == 2'b01) begin   // 0000_0000_0000_0000 / number
            flag = 1'b1;
            left = 5'b10000 + r_l;
            right = r_r;
            array = r_array;
            size = r_size;
        end
        else begin
            flag = 1'b1;
            left = l_l;
            right = l_r + 5'b10000;
            array = l_array;
            size = l_size;
        end            
    end

        
endmodule
