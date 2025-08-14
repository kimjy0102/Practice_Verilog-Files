module module_8bit_enhanced(
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
    assign truncated_data[0] = | data_in[8*1-1:8*0];
    assign truncated_data[1] = | data_in[8*2-1:8*1];
    assign truncated_data[2] = | data_in[8*3-1:8*2];
    assign truncated_data[3] = | data_in[8*4-1:8*3];
    assign truncated_data[4] = | data_in[8*5-1:8*4];
    assign truncated_data[5] = | data_in[8*6-1:8*5];
    assign truncated_data[6] = | data_in[8*7-1:8*6];
    assign truncated_data[7] = | data_in[8*8-1:8*7];
    // data_in_0 : data_in[8*1-1:8*0];
    always @(*) begin   
        case (truncated_data[3:0])      // case for right input
            4'b0000: begin
                right_flag = 1'b0; 
                right_left = 2'b0;
                right_right = 2'b0;
                right_array = 56'b0;
                right_size = 3'b0;
            end
            4'b0001: begin
                right_flag = 1'b1; 
                right_left = 2'b11; // 3
                right_right = 2'b00; // 0
                right_array = {14'b0, 14'b0, 14'b0, 6'b0, data_in[8*1-1:8*0]};
                right_size = 3'b001; // 1
            end
            4'b0010: begin
                right_flag = 1'b1;
                right_left = 2'b10; //2
                right_right = 2'b01; //1
                right_array = {14'b0, 14'b0, 14'b0, 6'b0, data_in[8*2-1:8*1]};
                right_size = 3'b001; //1
            end
            4'b0011: begin
                right_flag = 1'b1;
                right_left = 2'b10; //2
                right_right = 2'b00; //0
                right_array = {14'b0, 14'b0, 6'b0, data_in[8*2-1:8*1], 6'b0, data_in[8*1-1:8*0]};
                right_size = 3'b010; //2
            end
            4'b0100: begin
                right_flag = 1'b1;
                right_left = 2'b01; //1
                right_right = 2'b10; //2
                right_array = {14'b0, 14'b0, 14'b0, 6'b0, data_in[8*3-1:8*2]};
                right_size = 3'b001; //1
            end
            4'b0101: begin
                right_flag = 1'b1;
                right_left = 2'b01; // 1
                right_right = 2'b00; // 0
                right_array = {14'b0, 14'b0, 6'b0, data_in[8*3-1:8*2], 6'b000001, data_in[8*1-1:8*0]};
                right_size = 3'b010; //2
            end
            4'b0110: begin
                right_flag = 1'b1;
                right_left = 2'b01; //1
                right_right = 2'b01; //1
                right_array = {14'b0, 14'b0, 6'b0, data_in[8*3-1:8*2], 6'b0, data_in[8*2-1:8*1]};
                right_size = 3'b010; //2
            end
            4'b0111: begin
                right_flag = 1'b1;
                right_left = 2'b01; //1
                right_right = 2'b00; // 0
                right_array = {14'b0, 6'b0, data_in[8*3-1:8*2], 6'b0, data_in[8*2-1:8*1], 6'b0, data_in[8*1-1:8*0]};
                right_size = 3'b011; //3
            end
            4'b1000: begin
               right_flag = 1'b1;
               right_left = 2'b00; //0
               right_right = 2'b11; //3
               right_array = {14'b0, 14'b0, 14'b0, 6'b0, data_in[8*4-1:8*3]};
               right_size = 3'b001; //1 
            end
            4'b1001: begin
                right_flag = 1'b1;
                right_left = 2'b00; //0
                right_right = 2'b00; //0
                right_array = {14'b0, 14'b0, 6'b0, data_in[8*4-1:8*3], 6'b000010, data_in[8*1-1:8*0]};
                right_size = 3'b010; //2
            end
            4'b1010: begin
                right_flag = 1'b1;
                right_left = 2'b00; //0
                right_right = 2'b01; //1
                right_array = {14'b0, 14'b0, 6'b0, data_in[8*4-1:8*3], 6'b000001, data_in[8*2-1:8*1]};
                right_size = 3'b010; // 2
            end
            4'b1011: begin
                right_flag = 1'b1;
                right_left = 2'b00; // 0
                right_right = 2'b00; //0
                right_array = {14'b0, 6'b0, data_in[8*4-1:8*3], 6'b000001, data_in[8*2-1:8*1], 6'b0, data_in[8*1-1:8*0]};
                right_size = 3'b011; //3
            end
            4'b1100: begin
                right_flag = 1'b1;
                right_left = 2'b00;   //0
                right_right = 2'b10; //2
                right_array = {14'b0, 14'b0, 6'b0, data_in[8*4-1:8*3], 6'b0, data_in[8*3-1:8*2]};
                right_size = 3'b010; //2
            end
            4'b1101: begin
                right_flag = 1'b1;
                right_left = 2'b00; //0
                right_right = 2'b00; //0
                right_array = {14'b0, 6'b0, data_in[8*4-1:8*3], 6'b0, data_in[8*3-1:8*2], 6'b000001, data_in[8*1-1:8*0]};
                right_size = 3'b011; //3
            end
            4'b1110: begin
                right_flag = 1'b1;
                right_left = 2'b00; //0
                right_right = 2'b01; //1
                right_array = {14'b0, 6'b0, data_in[8*4-1:8*3], 6'b0, data_in[8*3-1:8*2], 6'b0, data_in[8*2-1:8*1]};
                right_size = 3'b011; //3
            end
            4'b1111: begin
                right_flag = 1'b1;
                right_left = 2'b00; //0
                right_right = 2'b00; //0
                right_array ={6'b0, data_in[8*4-1:8*3], 6'b0, data_in[8*3-1:8*2], 6'b0, data_in[8*2-1:8*1], 6'b0, data_in[8*1-1:8*0]};
                right_size = 3'b100; //4
            end
        endcase
    end
    always @(*) begin   
        case (truncated_data[7:4])      // case for left side input (higher bit)
            4'b0000: begin
                left_flag = 1'b0; 
                left_left = 2'b0;
                left_right = 2'b0;
                left_array = 56'b0;
                left_size = 3'b0;
            end
            4'b0001: begin
                left_flag = 1'b1; 
                left_left = 2'b11; // 3
                left_right = 2'b00; // 0
                left_array = {14'b0, 14'b0, 14'b0, 6'b0, data_in[8*5-1:8*4]};
                left_size = 3'b001; // 1
            end
            4'b0010: begin
                left_flag = 1'b1;
                left_left = 2'b10; //2
                left_right = 2'b01; //1
                left_array = {14'b0, 14'b0, 14'b0, 6'b0, data_in[8*6-1:8*5]};
                left_size = 3'b001; //1
            end
            4'b0011: begin
                left_flag = 1'b1;
                left_left = 2'b10; //2
                left_right = 2'b00; //0
                left_array = {14'b0, 14'b0, 6'b0, data_in[8*6-1:8*5], 6'b0, data_in[8*5-1:8*4]};
                left_size = 3'b010; //2
            end
            4'b0100: begin
                left_flag = 1'b1;
                left_left = 2'b01; //1
                left_right = 2'b10; //2
                left_array = {14'b0, 14'b0, 14'b0, 6'b0, data_in[8*7-1:8*6]};
                left_size = 3'b001; //1
            end
            4'b0101: begin
                left_flag = 1'b1;
                left_left = 2'b01; // 1
                left_right = 2'b00; // 0
                left_array = {14'b0, 14'b0, 6'b0, data_in[8*7-1:8*6], 6'b000001, data_in[8*5-1:8*4]};
                left_size = 3'b010; //2
            end
            4'b0110: begin
                left_flag = 1'b1;
                left_left = 2'b01; //1
                left_right = 2'b01; //1
                left_array = {14'b0, 14'b0, 6'b0, data_in[8*7-1:8*6], 6'b0, data_in[8*6-1:8*5]};
                left_size = 3'b010; //2
            end
            4'b0111: begin
                left_flag = 1'b1;
                left_left = 2'b01; //1
                left_right = 2'b00; // 0
                left_array = {14'b0, 6'b0, data_in[8*7-1:8*6], 6'b0, data_in[8*6-1:8*5], 6'b0, data_in[8*5-1:8*4]};
                left_size = 3'b011; //3
            end
            4'b1000: begin
                left_flag = 1'b1;
                left_left = 2'b00; //0
                left_right = 2'b11; //3
                left_array = {14'b0, 14'b0, 14'b0, 6'b0, data_in[8*8-1:8*7]};
                left_size = 3'b001; //1 
            end
            4'b1001: begin
                left_flag = 1'b1;
                left_left = 2'b00; //0
                left_right = 2'b00; //0
                left_array = {14'b0, 14'b0, 6'b0, data_in[8*8-1:8*7], 6'b000010, data_in[8*5-1:8*4]};
                left_size = 3'b010; //2
            end
            4'b1010: begin
                left_flag = 1'b1;
                left_left = 2'b00; //0
                left_right = 2'b01; //1
                left_array = {14'b0, 14'b0, 6'b0, data_in[8*8-1:8*7], 6'b000001, data_in[8*6-1:8*5]};
                left_size = 3'b010; // 2
            end
            4'b1011: begin
                left_flag = 1'b1;
                left_left = 2'b00; // 0
                left_right = 2'b00; //0
                left_array = {14'b0, 6'b0, data_in[8*8-1:8*7], 6'b000001, data_in[8*6-1:8*5], 6'b0, data_in[8*5-1:8*4]};
                left_size = 3'b011; //3
            end
            4'b1100: begin
                left_flag = 1'b1;
                left_left = 2'b00;   //0
                left_right = 2'b10; //2
                left_array = {14'b0, 14'b0, 6'b0, data_in[8*8-1:8*7], 6'b0, data_in[8*7-1:8*6]};
                left_size = 3'b010; //2
            end
            4'b1101: begin
                left_flag = 1'b1;
                left_left = 2'b00; //0
                left_right = 2'b00; //0
                left_array = {14'b0, 6'b0, data_in[8*8-1:8*7], 6'b0, data_in[8*7-1:8*6], 6'b000001, data_in[8*5-1:8*4]};
                left_size = 3'b011; //3
            end
            4'b1110: begin
                left_flag = 1'b1;
                left_left = 2'b00; //0
                left_right = 2'b01; //1
                left_array = {14'b0, 6'b0, data_in[8*8-1:8*7], 6'b0, data_in[8*7-1:8*6], 6'b0, data_in[8*6-1:8*5]};
                left_size = 3'b011; //3
            end
            4'b1111: begin
                left_flag = 1'b1;
                left_left = 2'b00; //0
                left_right = 2'b00; //0
                left_array ={6'b0, data_in[8*8-1:8*7], 6'b0, data_in[8*7-1:8*6], 6'b0, data_in[8*6-1:8*5], 6'b0, data_in[8*5-1:8*4]};
                left_size = 3'b100; //4
            end
        endcase
    end
    ////// 4bit 4bit -> 8bit case handle
    //wire [8*14-1:0] l_concat;
    //assign l_concat = left_array;
    //wire [8*14-1:0] r_concat;
    //assign r_concat = right_array;
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
                //array = (l_concat << (right_size * 14)) + r_concat;
                case (right_size) 
                    3'b001 : begin // 1, 1
                        array[14*1-1:14*0] = right_array[14*1-1:14*0];
                        array[14*8-1:14*1] = left_array;
                    end
                    3'b010 : begin // 1, 2
                        array[14*2-1:14*0] = right_array[14*2-1:14*0];
                        array[14*8-1:14*2] = left_array;
                    end
                    3'b011 : begin  // 1, 3
                        array[14*3-1:14*0] = right_array[14*3-1:14*0];
                        array[14*8-1:14*3] = left_array;
                    end
                    3'b100: begin   // 1, 4
                        array[14*4-1:14*0] = right_array[14*4-1:14*0];
                        array[14*8-1:14*4] = left_array;
                    end
                    default : begin
                        array = 0;
                    end
                endcase
            end
            else begin // at leat left or right is 1 && there are at leat one 0 in middle
                //array = (l_concat << (right_size * 14)) + r_concat + ({zero_count, 8'b0} << ((right_size-1) * 14));
                case (right_size) 
                    3'b001 : begin // 1, 1
                        array[14*1-1:14*0] = right_array[14*1-1:14*0];
                        array[14*1-1:14*1-6] = zero_count;
                        array[14*8-1:14*1] = left_array;
                    end
                    3'b010 : begin // 1, 2
                        array[14*2-1:14*0] = right_array[14*2-1:14*0];
                        array[14*2-1:14*2-6] = zero_count;
                        array[14*8-1:14*2] = left_array;
                    end
                    3'b011 : begin  // 1, 3
                        array[14*3-1:14*0] = right_array[14*3-1:14*0];
                        array[14*3-1:14*3-6] = zero_count;
                        array[14*8-1:14*3] = left_array;
                    end
                    3'b100: begin   // 1, 4
                        array[14*4-1:14*0] = right_array[14*4-1:14*0];
                        array[14*4-1:14*4-6] = zero_count;
                        array[14*8-1:14*4] = left_array;
                    end
                    default : begin
                        array = 0;
                    end
                endcase
            end
        end
        else if ({left_flag,right_flag} ==2'b01) begin // 0000 / right has at least 1 &  one
            flag = 1'b1;
            left = 3'b100 + right_left;
            right = right_right;
            array = right_array; // l_concat is all zeros only r_concat has value
            size = right_size;
        end
        else begin // left has at least 1 & one / 0000
            flag = 1'b1;
            left = left_left;
            right = left_right + 3'b100;
            array = left_array; // same
            size = left_size;
        end
    end
endmodule