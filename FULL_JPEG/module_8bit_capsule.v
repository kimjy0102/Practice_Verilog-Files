module module_8bit_capsule(
    input [8*8-1:0] data_in,
    output reg [3-1:0] left,
    output reg [3-1:0] right,
    output reg flag,
    output reg [8*14-1:0] array,
    output reg [4-1:0] size
);
    reg left_flag, right_flag;
    reg [2-1:0] left_left, left_right, right_right, right_left;
    reg [4*14-1:0] left_array, right_array;
    reg [3-1:0] left_size, right_size;
    wire [8-1:0] truncated_data; // if data is non zero -> 1 , zero -> 0
    module_4bit M4_L(.data_in_0(data_in[8*5-1:8*4]), .data_in_1(data_in[8*6-1:8*5]), .data_in_2(data_in[8*7-1:8*6]), .data_in_3(data_in[8*8-1:8*7]), .flag(left_flag), .left(left_left), .right(left_right), .array(left_array), .size(left_size));
    module_4bit M4_R(.data_in_0(data_in[8*1-1:8*0]), .data_in_1(data_in[8*2-1:8*1]), .data_in_2(data_in[8*3-1:8*2]), .data_in_3(data_in[8*4-1:8*3]), .flag(right_flag), .left(right_left), .right(right_right), .array(right_array), .size(right_size));
    ////// 4bit 4bit -> 8bit case handle
    wire [8*14-1:0] l_concat;
    assign l_concat = left_array;
    wire [8*14-1:0] r_concat;
    assign r_concat = right_array;
    wire [6-1:0] zero_count;
    assign zero_count = left_right + right_left;
    always @(*) begin
        if ({left_flag,right_flag} == 2'b00) begin // 0000 / 0000
            flag = 1'b0;
            left = 2'b0;
            right = 2'b0;
            array = 112'b0;
            size = 3'b0;
        end 
        else if ({left_flag,right_flag} == 2'b11) begin // each left & right has at leat 1 one
            flag = 1'b1;
            left = left_left;
            right = right_right;
            size = left_size + right_size;            
            if ({left_right,right_left} == 4'b0000) begin // ---1 / 1---
                array = (l_concat << (right_size * 14)) + r_concat;
            end
            else begin // at leat left or right is 1 && there are at leat one 0 in middle
                array = (l_concat << (right_size * 14)) + r_concat + ({zero_count, 8'b0} << ((right_size-1) * 14));
            end
        end
        else if ({left_flag,right_flag} ==2'b01) begin // 0000 / right has at least 1 &  one
            flag = 1'b1;
            left = 3'b100 + right_left;
            right = right_right;
            array = r_concat; // l_concat is all zeros only r_concat has value
            size = right_size;
        end
        else begin // left has at least 1 & one / 0000
            flag = 1'b1;
            left = left_left;
            right = left_right + 3'b100;
            array = l_concat; // same
            size = left_size;
        end
    end
endmodule
