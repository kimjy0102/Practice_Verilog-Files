module module_16bit(
    input [3-1:0] l_l, // left left 0's max 0~7
    input [3-1:0] l_r, // left right 0's
    input [3-1:0] r_l, // right left 0's
    input [3-1:0] r_r, // right right 0's
    input l_flag,   // only 0000 -> 0
    input r_flag,   // only 0000 -> 0
    input [8*14-1:0] l_array, // if number -> comes as data, if 0 -> then comes as 0 count
    // max size -> 8  && each component size -> 14bit 8 * 14 = 112
    input [8*14-1:0] r_array,
    input [4-1:0] l_size, // actually using size in array (left) max is 8 -> 1000 -> 4bit 
    input [4-1:0] r_size, // actually using size in array (right)
    output reg [4-1:0] left, // output of left zero's 0 ~ 15
    output reg [4-1:0] right, // output ''
    output reg flag, // 0000_0000_0000_0000
    output reg [14*16-1:0] array, // output array
    // max size -> 16 && each component size -> 14bit   16*14 = 224
    output reg [5-1:0] size // actually using size in array (total) max is 16 -> 10000 -> 5bit
);
    //wire [8*16-1:0] l_concat; // stretch input l_array into larger size
    //wire [8*16-1:0] r_concat;
    //assign l_concat = l_array;
    //assign r_concat = r_array;
    wire [6-1:0] zero_count;
    assign zero_count = l_r + r_l;
    always @(*) begin
        if ({l_flag, r_flag} == 2'b00) begin // 0000_0000 / 0000_0000
            flag = 1'b0;
            left = 4'b0;
            right = 4'b0;
            array = 224'b0;
            size = 5'b0;
        end
        else if ({l_flag, r_flag} == 2'b11) begin // each left & right has at least 1 one
            flag = 1'b1;
            left = l_l;
            right = r_r;
            size = l_size + r_size;
            if ({l_r, r_l} == 6'b000_000) begin // ----_---1 / 1---_----
                //array = (l_concat << (r_size * 14)) + r_concat;
                case (r_size) 
                    4'b0001: begin // 1, 1
                        array[14*1-1:14*0] = r_array;
                        array[14*16-1:14*1] = l_array;
                    end
                    4'b0010: begin // 1,2
                        array[14*2-1:14*0] = r_array;
                        array[14*16-1:14*2] = l_array;
                    end
                    4'b0011: begin // 1,3
                        array[14*3-1:14*0] = r_array;
                        array[14*16-1:14*3] = l_array;
                    end
                    4'b0100: begin // 1,4
                        array[14*4-1:14*0] = r_array;
                        array[14*16-1:14*4] = l_array;
                    end
                    4'b0101: begin // 1,5
                        array[14*5-1:14*0] = r_array;
                        array[14*16-1:14*5] = l_array;
                    end
                    4'b0110: begin // 1,6
                        array[14*6-1:14*0] = r_array;
                        array[14*16-1:14*6] = l_array;
                    end
                    4'b0111: begin // 1,7
                        array[14*7-1:14*0] = r_array;
                        array[14*16-1:14*7] = l_array;
                    end
                    4'b1000: begin // 1,8
                        array[14*8-1:14*0] = r_array;
                        array[14*16-1:14*8] = l_array;
                    end
                    default : begin
                        array = 0;
                    end
                endcase
            end
            else begin // at least left or right is 1 && there are at least one 0 in middle
                //array = (l_concat << (r_size * 14)) + r_concat + ({zero_count, 8'b0} << ((r_size-1)*14));
                case (r_size) 
                    4'b0001: begin // 1, 1
                        array[14*1-1:14*0] = r_array;
                        array[14*1-1:14*1-6] = zero_count;
                        array[14*16-1:14*1] = l_array;
                    end
                    4'b0010: begin // 1,2
                        array[14*2-1:14*0] = r_array;
                        array[14*2-1:14*2-6] = zero_count;
                        array[14*16-1:14*2] = l_array;
                    end
                    4'b0011: begin // 1,3
                        array[14*3-1:14*0] = r_array;
                        array[14*3-1:14*3-6] = zero_count;
                        array[14*16-1:14*3] = l_array;
                    end
                    4'b0100: begin // 1,4
                        array[14*4-1:14*0] = r_array;
                        array[14*4-1:14*4-6] = zero_count;
                        array[14*16-1:14*4] = l_array;
                    end
                    4'b0101: begin // 1,5
                        array[14*5-1:14*0] = r_array;
                        array[14*5-1:14*5-6] = zero_count;
                        array[14*16-1:14*5] = l_array;
                    end
                    4'b0110: begin // 1,6
                        array[14*6-1:14*0] = r_array;
                        array[14*6-1:14*6-6] = zero_count;
                        array[14*16-1:14*6] = l_array;
                    end
                    4'b0111: begin // 1,7
                        array[14*7-1:14*0] = r_array;
                        array[14*7-1:14*7-6] = zero_count;
                        array[14*16-1:14*7] = l_array;
                    end
                    4'b1000: begin // 1,8
                        array[14*8-1:14*0] = r_array;
                        array[14*8-1:14*8-6] = zero_count;
                        array[14*16-1:14*8] = l_array;
                    end
                    default : begin
                        array = 0;
                    end
                endcase
            end
        end
        else if ({l_flag, r_flag} == 2'b01) begin // 0000_0000 / right has at least 1 & one
            flag = 1'b1;
            left = 4'b1000 + r_l;
            right = r_r;
            array = r_array; // l_concat is all zeros only r_concat has value
            size = r_size;
        end
        else begin // left has at least 1 & one / 0000_0000
            flag = 1'b1;
            left = l_l;
            right = l_r + 4'b1000;
            array = l_array; // same
            size = l_size;
        end
    end

endmodule

