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
    wire [64*14-1:0] l_concat; // stretch input l_array into larger size
    wire [64*14-1:0] r_concat;
    assign l_concat = l_array;
    assign r_concat = r_array;
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
                array = (l_concat << (r_size * 14)) + r_concat;
            end
            else begin
                array = (l_concat << ((r_size * 14))) + r_concat + ({zero_count, 8'b0} << ((r_size-1)*14));
            end
        end
        else if ({l_flag, r_flag} == 2'b01) begin
            flag = 1'b1;
            left = 6'b100000 + r_l;
            right = r_r;
            array = r_concat;
            size = r_size;
        end
        else begin
            flag = 1'b1;
            left = l_l;
            right = l_r + 6'b100000;
            array = l_concat;
            size = l_size;
        end
    end
endmodule

