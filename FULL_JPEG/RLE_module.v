module RLE(
    input [512-1:0] data_in, // 512-bit input data
    output [14*64-1:0] encoded_data
); 
    // 4bit module outputs
    wire [2-1:0] l_o_4 [0:15]; 
    wire [2-1:0] r_o_4 [0:15];
    wire [16-1:0] flag_4bit;
    wire [4*14-1:0] array_4bit [0:15];
    wire [3-1:0] size_4bit [0:15];
    module_4bit M0(.data_in_0(data_in[8*1-1:8*0]), .data_in_1(data_in[8*2-1:8*1]), .data_in_2(data_in[8*3-1:8*2]), .data_in_3(data_in[8*4-1:8*3]), .flag(flag_4bit[0]), .left(l_o_4[0]), .right(r_o_4[0]), .array(array_4bit[0]), .size(size_4bit[0]));
    module_4bit M1(.data_in_0(data_in[8*5-1:8*4]), .data_in_1(data_in[8*6-1:8*5]), .data_in_2(data_in[8*7-1:8*6]), .data_in_3(data_in[8*8-1:8*7]), .flag(flag_4bit[1]), .left(l_o_4[1]), .right(r_o_4[1]), .array(array_4bit[1]), .size(size_4bit[1]));
    module_4bit M2(.data_in_0(data_in[8*9-1:8*8]), .data_in_1(data_in[8*10-1:8*9]), .data_in_2(data_in[8*11-1:8*10]), .data_in_3(data_in[8*12-1:8*11]), .flag(flag_4bit[2]), .left(l_o_4[2]), .right(r_o_4[2]), .array(array_4bit[2]), .size(size_4bit[2]));
    module_4bit M3(.data_in_0(data_in[8*13-1:8*12]), .data_in_1(data_in[8*14-1:8*13]), .data_in_2(data_in[8*15-1:8*14]), .data_in_3(data_in[8*16-1:8*15]), .flag(flag_4bit[3]), .left(l_o_4[3]), .right(r_o_4[3]), .array(array_4bit[3]), .size(size_4bit[3]));
    module_4bit M4(.data_in_0(data_in[8*17-1:8*16]), .data_in_1(data_in[8*18-1:8*17]), .data_in_2(data_in[8*19-1:8*18]), .data_in_3(data_in[8*20-1:8*19]), .flag(flag_4bit[4]), .left(l_o_4[4]), .right(r_o_4[4]), .array(array_4bit[4]), .size(size_4bit[4]));
    module_4bit M5(.data_in_0(data_in[8*21-1:8*20]), .data_in_1(data_in[8*22-1:8*21]), .data_in_2(data_in[8*23-1:8*22]), .data_in_3(data_in[8*24-1:8*23]), .flag(flag_4bit[5]), .left(l_o_4[5]), .right(r_o_4[5]), .array(array_4bit[5]), .size(size_4bit[5]));
    module_4bit M6(.data_in_0(data_in[8*25-1:8*24]), .data_in_1(data_in[8*26-1:8*25]), .data_in_2(data_in[8*27-1:8*26]), .data_in_3(data_in[8*28-1:8*27]), .flag(flag_4bit[6]), .left(l_o_4[6]), .right(r_o_4[6]), .array(array_4bit[6]), .size(size_4bit[6]));
    module_4bit M7(.data_in_0(data_in[8*29-1:8*28]), .data_in_1(data_in[8*30-1:8*29]), .data_in_2(data_in[8*31-1:8*30]), .data_in_3(data_in[8*32-1:8*31]), .flag(flag_4bit[7]), .left(l_o_4[7]), .right(r_o_4[7]), .array(array_4bit[7]), .size(size_4bit[7]));
    module_4bit M8(.data_in_0(data_in[8*33-1:8*32]), .data_in_1(data_in[8*34-1:8*33]), .data_in_2(data_in[8*35-1:8*34]), .data_in_3(data_in[8*36-1:8*35]), .flag(flag_4bit[8]), .left(l_o_4[8]), .right(r_o_4[8]), .array(array_4bit[8]), .size(size_4bit[8]));
    module_4bit M9(.data_in_0(data_in[8*37-1:8*36]), .data_in_1(data_in[8*38-1:8*37]), .data_in_2(data_in[8*39-1:8*38]), .data_in_3(data_in[8*40-1:8*39]), .flag(flag_4bit[9]), .left(l_o_4[9]), .right(r_o_4[9]), .array(array_4bit[9]), .size(size_4bit[9]));
    module_4bit M10(.data_in_0(data_in[8*41-1:8*40]), .data_in_1(data_in[8*42-1:8*41]), .data_in_2(data_in[8*43-1:8*42]), .data_in_3(data_in[8*44-1:8*43]), .flag(flag_4bit[10]), .left(l_o_4[10]), .right(r_o_4[10]), .array(array_4bit[10]), .size(size_4bit[10]));
    module_4bit M11(.data_in_0(data_in[8*45-1:8*44]), .data_in_1(data_in[8*46-1:8*45]), .data_in_2(data_in[8*47-1:8*46]), .data_in_3(data_in[8*48-1:8*47]), .flag(flag_4bit[11]), .left(l_o_4[11]), .right(r_o_4[11]), .array(array_4bit[11]), .size(size_4bit[11]));
    module_4bit M12(.data_in_0(data_in[8*49-1:8*48]), .data_in_1(data_in[8*50-1:8*49]), .data_in_2(data_in[8*51-1:8*50]), .data_in_3(data_in[8*52-1:8*51]), .flag(flag_4bit[12]), .left(l_o_4[12]), .right(r_o_4[12]), .array(array_4bit[12]), .size(size_4bit[12]));
    module_4bit M13(.data_in_0(data_in[8*53-1:8*52]), .data_in_1(data_in[8*54-1:8*53]), .data_in_2(data_in[8*55-1:8*54]), .data_in_3(data_in[8*56-1:8*55]), .flag(flag_4bit[13]), .left(l_o_4[13]), .right(r_o_4[13]), .array(array_4bit[13]), .size(size_4bit[13]));
    module_4bit M14(.data_in_0(data_in[8*57-1:8*56]), .data_in_1(data_in[8*58-1:8*57]), .data_in_2(data_in[8*59-1:8*58]), .data_in_3(data_in[8*60-1:8*59]), .flag(flag_4bit[14]), .left(l_o_4[14]), .right(r_o_4[14]), .array(array_4bit[14]), .size(size_4bit[14]));
    module_4bit M15(.data_in_0(data_in[8*61-1:8*60]), .data_in_1(data_in[8*62-1:8*61]), .data_in_2(data_in[8*63-1:8*62]), .data_in_3(data_in[8*64-1:8*63]), .flag(flag_4bit[15]), .left(l_o_4[15]), .right(r_o_4[15]), .array(array_4bit[15]), .size(size_4bit[15]));
    // 8bit module outputs
    wire [3-1:0] l_o_8 [0:7];
    wire [3-1:0] r_o_8 [0:7];
    wire [8-1:0] flag_8bit;
    wire [8*14-1:0] array_8bit [0:7];
    wire [4-1:0] size_8bit [0:7];
    module_8bit N0(.l_l(l_o_4[1]), .l_r(r_o_4[1]), .r_l(l_o_4[0]), .r_r(r_o_4[0]), .l_flag(flag_4bit[1]), .r_flag(flag_4bit[0]), .l_array(array_4bit[1]), .r_array(array_4bit[0]), .l_size(size_4bit[1]), .r_size(size_4bit[0]), .left(l_o_8[0]), .right(r_o_8[0]), .flag(flag_8bit[0]), .array(array_8bit[0]), .size(size_8bit[0]));
    module_8bit N1(.l_l(l_o_4[3]), .l_r(r_o_4[3]), .r_l(l_o_4[2]), .r_r(r_o_4[2]), .l_flag(flag_4bit[3]), .r_flag(flag_4bit[2]), .l_array(array_4bit[3]), .r_array(array_4bit[2]), .l_size(size_4bit[3]), .r_size(size_4bit[2]), .left(l_o_8[1]), .right(r_o_8[1]), .flag(flag_8bit[1]), .array(array_8bit[1]), .size(size_8bit[1]));
    module_8bit N2(.l_l(l_o_4[5]), .l_r(r_o_4[5]), .r_l(l_o_4[4]), .r_r(r_o_4[4]), .l_flag(flag_4bit[5]), .r_flag(flag_4bit[4]), .l_array(array_4bit[5]), .r_array(array_4bit[4]), .l_size(size_4bit[5]), .r_size(size_4bit[4]), .left(l_o_8[2]), .right(r_o_8[2]), .flag(flag_8bit[2]), .array(array_8bit[2]), .size(size_8bit[2]));
    module_8bit N3(.l_l(l_o_4[7]), .l_r(r_o_4[7]), .r_l(l_o_4[6]), .r_r(r_o_4[6]), .l_flag(flag_4bit[7]), .r_flag(flag_4bit[6]), .l_array(array_4bit[7]), .r_array(array_4bit[6]), .l_size(size_4bit[7]), .r_size(size_4bit[6]), .left(l_o_8[3]), .right(r_o_8[3]), .flag(flag_8bit[3]), .array(array_8bit[3]), .size(size_8bit[3]));
    module_8bit N4(.l_l(l_o_4[9]), .l_r(r_o_4[9]), .r_l(l_o_4[8]), .r_r(r_o_4[8]), .l_flag(flag_4bit[9]), .r_flag(flag_4bit[8]), .l_array(array_4bit[9]), .r_array(array_4bit[8]), .l_size(size_4bit[9]), .r_size(size_4bit[8]), .left(l_o_8[4]), .right(r_o_8[4]), .flag(flag_8bit[4]), .array(array_8bit[4]), .size(size_8bit[4]));
    module_8bit N5(.l_l(l_o_4[11]), .l_r(r_o_4[11]), .r_l(l_o_4[10]), .r_r(r_o_4[10]), .l_flag(flag_4bit[11]), .r_flag(flag_4bit[10]), .l_array(array_4bit[11]), .r_array(array_4bit[10]), .l_size(size_4bit[11]), .r_size(size_4bit[10]), .left(l_o_8[5]), .right(r_o_8[5]), .flag(flag_8bit[5]), .array(array_8bit[5]), .size(size_8bit[5]));
    module_8bit N6(.l_l(l_o_4[13]), .l_r(r_o_4[13]), .r_l(l_o_4[12]), .r_r(r_o_4[12]), .l_flag(flag_4bit[13]), .r_flag(flag_4bit[12]), .l_array(array_4bit[13]), .r_array(array_4bit[12]), .l_size(size_4bit[13]), .r_size(size_4bit[12]), .left(l_o_8[6]), .right(r_o_8[6]), .flag(flag_8bit[6]), .array(array_8bit[6]), .size(size_8bit[6]));
    module_8bit N7(.l_l(l_o_4[15]), .l_r(r_o_4[15]), .r_l(l_o_4[14]), .r_r(r_o_4[14]), .l_flag(flag_4bit[15]), .r_flag(flag_4bit[14]), .l_array(array_4bit[15]), .r_array(array_4bit[14]), .l_size(size_4bit[15]), .r_size(size_4bit[14]), .left(l_o_8[7]), .right(r_o_8[7]), .flag(flag_8bit[7]), .array(array_8bit[7]), .size(size_8bit[7]));
    // 16bit module
    wire [4-1:0] l_o_16 [0:3];
    wire [4-1:0] r_o_16 [0:3];
    wire [4-1:0] flag_16bit;
    wire [16*14-1:0] array_16bit [0:3];
    wire [5-1:0] size_16bit [0:3];
    module_16bit O0(.l_l(l_o_8[1]), .l_r(r_o_8[1]), .r_l(l_o_8[0]), .r_r(r_o_8[0]), .l_flag(flag_8bit[1]), .r_flag(flag_8bit[0]), .l_array(array_8bit[1]), .r_array(array_8bit[0]), .l_size(size_8bit[1]), .r_size(size_8bit[0]), .left(l_o_16[0]), .right(r_o_16[0]), .flag(flag_16bit[0]), .array(array_16bit[0]), .size(size_16bit[0]));
    module_16bit O1(.l_l(l_o_8[3]), .l_r(r_o_8[3]), .r_l(l_o_8[2]), .r_r(r_o_8[2]), .l_flag(flag_8bit[3]), .r_flag(flag_8bit[2]), .l_array(array_8bit[3]), .r_array(array_8bit[2]), .l_size(size_8bit[3]), .r_size(size_8bit[2]), .left(l_o_16[1]), .right(r_o_16[1]), .flag(flag_16bit[1]), .array(array_16bit[1]), .size(size_16bit[1]));
    module_16bit O2(.l_l(l_o_8[5]), .l_r(r_o_8[5]), .r_l(l_o_8[4]), .r_r(r_o_8[4]), .l_flag(flag_8bit[5]), .r_flag(flag_8bit[4]), .l_array(array_8bit[5]), .r_array(array_8bit[4]), .l_size(size_8bit[5]), .r_size(size_8bit[4]), .left(l_o_16[2]), .right(r_o_16[2]), .flag(flag_16bit[2]), .array(array_16bit[2]), .size(size_16bit[2]));
    module_16bit O3(.l_l(l_o_8[7]), .l_r(r_o_8[7]), .r_l(l_o_8[6]), .r_r(r_o_8[6]), .l_flag(flag_8bit[7]), .r_flag(flag_8bit[6]), .l_array(array_8bit[7]), .r_array(array_8bit[6]), .l_size(size_8bit[7]), .r_size(size_8bit[6]), .left(l_o_16[3]), .right(r_o_16[3]), .flag(flag_16bit[3]), .array(array_16bit[3]), .size(size_16bit[3]));
    // 32bit module
    wire [5-1:0] l_o_32 [0:1];
    wire [5-1:0] r_o_32 [0:1];
    wire [2-1:0] flag_32bit;
    wire [32*14-1:0] array_32bit [0:1];
    wire [6-1:0] size_32bit [0:1];
    module_32bit P0(.l_l(l_o_16[1]), .l_r(r_o_16[1]), .r_l(l_o_16[0]), .r_r(r_o_16[0]), .l_flag(flag_16bit[1]), .r_flag(flag_16bit[0]), .l_array(array_16bit[1]), .r_array(array_16bit[0]), .l_size(size_16bit[1]), .r_size(size_16bit[0]), .left(l_o_32[0]), .right(r_o_32[0]), .flag(flag_32bit[0]), .array(array_32bit[0]), .size(size_32bit[0]));
    module_32bit P1(.l_l(l_o_16[3]), .l_r(r_o_16[3]), .r_l(l_o_16[2]), .r_r(r_o_16[2]), .l_flag(flag_16bit[3]), .r_flag(flag_16bit[2]), .l_array(array_16bit[3]), .r_array(array_16bit[2]), .l_size(size_16bit[3]), .r_size(size_16bit[2]), .left(l_o_32[1]), .right(r_o_32[1]), .flag(flag_32bit[1]), .array(array_32bit[1]), .size(size_32bit[1]));
    //64 bit module output
    wire [6-1:0] l_o_64;
    wire [6-1:0] r_o_64;
    wire flag_64bit;
    wire [64*14-1:0] array_64bit;
    wire [6-1:0] size_64bit;
    module_64bit Q0(.l_l(l_o_32[1]), .l_r(r_o_32[1]), .r_l(l_o_32[0]), .r_r(r_o_32[0]), .l_flag(flag_32bit[1]), .r_flag(flag_32bit[0]), .l_array(array_32bit[1]), .r_array(array_32bit[0]), .l_size(size_32bit[1]), .r_size(size_32bit[0]), .left(l_o_64), .right(r_o_64), .flag(flag_64bit), .array(array_64bit), .size(size_64bit));
    // output concatenation
    wire [10-1:0] shifter;
    assign shifter = (64 - size_64bit) * 14;
    assign encoded_data = flag_64bit ? ((array_64bit << shifter) + (14'b1111_1111_1111_11 << (shifter - 14))) : (14'b1111_1111_1111_11 << 882);
endmodule 





    
