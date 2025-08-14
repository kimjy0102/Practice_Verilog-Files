//module RLE(
//    input [512-1:0] data_in, // 512-bit input data
//    output [14*64-1:0] encoded_data
//); 
//    // 4bit module outputs
//    wire [2-1:0] l_o_4 [0:15]; 
//    wire [2-1:0] r_o_4 [0:15];
//    wire [16-1:0] flag_4bit;
//    wire [4*14-1:0] array_4bit [0:15];
//    wire [3-1:0] size_4bit [0:15];
//    module_4bit M0(.data_in_0(data_in[8*1-1:8*0]), .data_in_1(data_in[8*2-1:8*1]), .data_in_2(data_in[8*3-1:8*2]), .data_in_3(data_in[8*4-1:8*3]), .flag(flag_4bit[0]), .left(l_o_4[0]), .right(r_o_4[0]), .array(array_4bit[0]), .size(size_4bit[0]));
//    module_4bit M1(.data_in_0(data_in[8*5-1:8*4]), .data_in_1(data_in[8*6-1:8*5]), .data_in_2(data_in[8*7-1:8*6]), .data_in_3(data_in[8*8-1:8*7]), .flag(flag_4bit[1]), .left(l_o_4[1]), .right(r_o_4[1]), .array(array_4bit[1]), .size(size_4bit[1]));
//    module_4bit M2(.data_in_0(data_in[8*9-1:8*8]), .data_in_1(data_in[8*10-1:8*9]), .data_in_2(data_in[8*11-1:8*10]), .data_in_3(data_in[8*12-1:8*11]), .flag(flag_4bit[2]), .left(l_o_4[2]), .right(r_o_4[2]), .array(array_4bit[2]), .size(size_4bit[2]));
//    module_4bit M3(.data_in_0(data_in[8*13-1:8*12]), .data_in_1(data_in[8*14-1:8*13]), .data_in_2(data_in[8*15-1:8*14]), .data_in_3(data_in[8*16-1:8*15]), .flag(flag_4bit[3]), .left(l_o_4[3]), .right(r_o_4[3]), .array(array_4bit[3]), .size(size_4bit[3]));
//    module_4bit M4(.data_in_0(data_in[8*17-1:8*16]), .data_in_1(data_in[8*18-1:8*17]), .data_in_2(data_in[8*19-1:8*18]), .data_in_3(data_in[8*20-1:8*19]), .flag(flag_4bit[4]), .left(l_o_4[4]), .right(r_o_4[4]), .array(array_4bit[4]), .size(size_4bit[4]));
//    module_4bit M5(.data_in_0(data_in[8*21-1:8*20]), .data_in_1(data_in[8*22-1:8*21]), .data_in_2(data_in[8*23-1:8*22]), .data_in_3(data_in[8*24-1:8*23]), .flag(flag_4bit[5]), .left(l_o_4[5]), .right(r_o_4[5]), .array(array_4bit[5]), .size(size_4bit[5]));
//    module_4bit M6(.data_in_0(data_in[8*25-1:8*24]), .data_in_1(data_in[8*26-1:8*25]), .data_in_2(data_in[8*27-1:8*26]), .data_in_3(data_in[8*28-1:8*27]), .flag(flag_4bit[6]), .left(l_o_4[6]), .right(r_o_4[6]), .array(array_4bit[6]), .size(size_4bit[6]));
//    module_4bit M7(.data_in_0(data_in[8*29-1:8*28]), .data_in_1(data_in[8*30-1:8*29]), .data_in_2(data_in[8*31-1:8*30]), .data_in_3(data_in[8*32-1:8*31]), .flag(flag_4bit[7]), .left(l_o_4[7]), .right(r_o_4[7]), .array(array_4bit[7]), .size(size_4bit[7]));
//    module_4bit M8(.data_in_0(data_in[8*33-1:8*32]), .data_in_1(data_in[8*34-1:8*33]), .data_in_2(data_in[8*35-1:8*34]), .data_in_3(data_in[8*36-1:8*35]), .flag(flag_4bit[8]), .left(l_o_4[8]), .right(r_o_4[8]), .array(array_4bit[8]), .size(size_4bit[8]));
//    module_4bit M9(.data_in_0(data_in[8*37-1:8*36]), .data_in_1(data_in[8*38-1:8*37]), .data_in_2(data_in[8*39-1:8*38]), .data_in_3(data_in[8*40-1:8*39]), .flag(flag_4bit[9]), .left(l_o_4[9]), .right(r_o_4[9]), .array(array_4bit[9]), .size(size_4bit[9]));
//    module_4bit M10(.data_in_0(data_in[8*41-1:8*40]), .data_in_1(data_in[8*42-1:8*41]), .data_in_2(data_in[8*43-1:8*42]), .data_in_3(data_in[8*44-1:8*43]), .flag(flag_4bit[10]), .left(l_o_4[10]), .right(r_o_4[10]), .array(array_4bit[10]), .size(size_4bit[10]));
//    module_4bit M11(.data_in_0(data_in[8*45-1:8*44]), .data_in_1(data_in[8*46-1:8*45]), .data_in_2(data_in[8*47-1:8*46]), .data_in_3(data_in[8*48-1:8*47]), .flag(flag_4bit[11]), .left(l_o_4[11]), .right(r_o_4[11]), .array(array_4bit[11]), .size(size_4bit[11]));
//    module_4bit M12(.data_in_0(data_in[8*49-1:8*48]), .data_in_1(data_in[8*50-1:8*49]), .data_in_2(data_in[8*51-1:8*50]), .data_in_3(data_in[8*52-1:8*51]), .flag(flag_4bit[12]), .left(l_o_4[12]), .right(r_o_4[12]), .array(array_4bit[12]), .size(size_4bit[12]));
//    module_4bit M13(.data_in_0(data_in[8*53-1:8*52]), .data_in_1(data_in[8*54-1:8*53]), .data_in_2(data_in[8*55-1:8*54]), .data_in_3(data_in[8*56-1:8*55]), .flag(flag_4bit[13]), .left(l_o_4[13]), .right(r_o_4[13]), .array(array_4bit[13]), .size(size_4bit[13]));
//    module_4bit M14(.data_in_0(data_in[8*57-1:8*56]), .data_in_1(data_in[8*58-1:8*57]), .data_in_2(data_in[8*59-1:8*58]), .data_in_3(data_in[8*60-1:8*59]), .flag(flag_4bit[14]), .left(l_o_4[14]), .right(r_o_4[14]), .array(array_4bit[14]), .size(size_4bit[14]));
//    module_4bit M15(.data_in_0(data_in[8*61-1:8*60]), .data_in_1(data_in[8*62-1:8*61]), .data_in_2(data_in[8*63-1:8*62]), .data_in_3(data_in[8*64-1:8*63]), .flag(flag_4bit[15]), .left(l_o_4[15]), .right(r_o_4[15]), .array(array_4bit[15]), .size(size_4bit[15]));
//    // 8bit module outputs
//    wire [3-1:0] l_o_8 [0:7];
//    wire [3-1:0] r_o_8 [0:7];
//    wire [8-1:0] flag_8bit;
//    wire [8*14-1:0] array_8bit [0:7];
//    wire [4-1:0] size_8bit [0:7];
//    module_8bit N0(.l_l(l_o_4[1]), .l_r(r_o_4[1]), .r_l(l_o_4[0]), .r_r(r_o_4[0]), .l_flag(flag_4bit[1]), .r_flag(flag_4bit[0]), .l_array(array_4bit[1]), .r_array(array_4bit[0]), .l_size(size_4bit[1]), .r_size(size_4bit[0]), .left(l_o_8[0]), .right(r_o_8[0]), .flag(flag_8bit[0]), .array(array_8bit[0]), .size(size_8bit[0]));
//    module_8bit N1(.l_l(l_o_4[3]), .l_r(r_o_4[3]), .r_l(l_o_4[2]), .r_r(r_o_4[2]), .l_flag(flag_4bit[3]), .r_flag(flag_4bit[2]), .l_array(array_4bit[3]), .r_array(array_4bit[2]), .l_size(size_4bit[3]), .r_size(size_4bit[2]), .left(l_o_8[1]), .right(r_o_8[1]), .flag(flag_8bit[1]), .array(array_8bit[1]), .size(size_8bit[1]));
//    module_8bit N2(.l_l(l_o_4[5]), .l_r(r_o_4[5]), .r_l(l_o_4[4]), .r_r(r_o_4[4]), .l_flag(flag_4bit[5]), .r_flag(flag_4bit[4]), .l_array(array_4bit[5]), .r_array(array_4bit[4]), .l_size(size_4bit[5]), .r_size(size_4bit[4]), .left(l_o_8[2]), .right(r_o_8[2]), .flag(flag_8bit[2]), .array(array_8bit[2]), .size(size_8bit[2]));
//    module_8bit N3(.l_l(l_o_4[7]), .l_r(r_o_4[7]), .r_l(l_o_4[6]), .r_r(r_o_4[6]), .l_flag(flag_4bit[7]), .r_flag(flag_4bit[6]), .l_array(array_4bit[7]), .r_array(array_4bit[6]), .l_size(size_4bit[7]), .r_size(size_4bit[6]), .left(l_o_8[3]), .right(r_o_8[3]), .flag(flag_8bit[3]), .array(array_8bit[3]), .size(size_8bit[3]));
//    module_8bit N4(.l_l(l_o_4[9]), .l_r(r_o_4[9]), .r_l(l_o_4[8]), .r_r(r_o_4[8]), .l_flag(flag_4bit[9]), .r_flag(flag_4bit[8]), .l_array(array_4bit[9]), .r_array(array_4bit[8]), .l_size(size_4bit[9]), .r_size(size_4bit[8]), .left(l_o_8[4]), .right(r_o_8[4]), .flag(flag_8bit[4]), .array(array_8bit[4]), .size(size_8bit[4]));
//    module_8bit N5(.l_l(l_o_4[11]), .l_r(r_o_4[11]), .r_l(l_o_4[10]), .r_r(r_o_4[10]), .l_flag(flag_4bit[11]), .r_flag(flag_4bit[10]), .l_array(array_4bit[11]), .r_array(array_4bit[10]), .l_size(size_4bit[11]), .r_size(size_4bit[10]), .left(l_o_8[5]), .right(r_o_8[5]), .flag(flag_8bit[5]), .array(array_8bit[5]), .size(size_8bit[5]));
//    module_8bit N6(.l_l(l_o_4[13]), .l_r(r_o_4[13]), .r_l(l_o_4[12]), .r_r(r_o_4[12]), .l_flag(flag_4bit[13]), .r_flag(flag_4bit[12]), .l_array(array_4bit[13]), .r_array(array_4bit[12]), .l_size(size_4bit[13]), .r_size(size_4bit[12]), .left(l_o_8[6]), .right(r_o_8[6]), .flag(flag_8bit[6]), .array(array_8bit[6]), .size(size_8bit[6]));
//    module_8bit N7(.l_l(l_o_4[15]), .l_r(r_o_4[15]), .r_l(l_o_4[14]), .r_r(r_o_4[14]), .l_flag(flag_4bit[15]), .r_flag(flag_4bit[14]), .l_array(array_4bit[15]), .r_array(array_4bit[14]), .l_size(size_4bit[15]), .r_size(size_4bit[14]), .left(l_o_8[7]), .right(r_o_8[7]), .flag(flag_8bit[7]), .array(array_8bit[7]), .size(size_8bit[7]));
//    // 16bit module
//    wire [4-1:0] l_o_16 [0:3];
//    wire [4-1:0] r_o_16 [0:3];
//    wire [4-1:0] flag_16bit;
//    wire [16*14-1:0] array_16bit [0:3];
//    wire [5-1:0] size_16bit [0:3];
//    module_16bit O0(.l_l(l_o_8[1]), .l_r(r_o_8[1]), .r_l(l_o_8[0]), .r_r(r_o_8[0]), .l_flag(flag_8bit[1]), .r_flag(flag_8bit[0]), .l_array(array_8bit[1]), .r_array(array_8bit[0]), .l_size(size_8bit[1]), .r_size(size_8bit[0]), .left(l_o_16[0]), .right(r_o_16[0]), .flag(flag_16bit[0]), .array(array_16bit[0]), .size(size_16bit[0]));
//    module_16bit O1(.l_l(l_o_8[3]), .l_r(r_o_8[3]), .r_l(l_o_8[2]), .r_r(r_o_8[2]), .l_flag(flag_8bit[3]), .r_flag(flag_8bit[2]), .l_array(array_8bit[3]), .r_array(array_8bit[2]), .l_size(size_8bit[3]), .r_size(size_8bit[2]), .left(l_o_16[1]), .right(r_o_16[1]), .flag(flag_16bit[1]), .array(array_16bit[1]), .size(size_16bit[1]));
//    module_16bit O2(.l_l(l_o_8[5]), .l_r(r_o_8[5]), .r_l(l_o_8[4]), .r_r(r_o_8[4]), .l_flag(flag_8bit[5]), .r_flag(flag_8bit[4]), .l_array(array_8bit[5]), .r_array(array_8bit[4]), .l_size(size_8bit[5]), .r_size(size_8bit[4]), .left(l_o_16[2]), .right(r_o_16[2]), .flag(flag_16bit[2]), .array(array_16bit[2]), .size(size_16bit[2]));
//    module_16bit O3(.l_l(l_o_8[7]), .l_r(r_o_8[7]), .r_l(l_o_8[6]), .r_r(r_o_8[6]), .l_flag(flag_8bit[7]), .r_flag(flag_8bit[6]), .l_array(array_8bit[7]), .r_array(array_8bit[6]), .l_size(size_8bit[7]), .r_size(size_8bit[6]), .left(l_o_16[3]), .right(r_o_16[3]), .flag(flag_16bit[3]), .array(array_16bit[3]), .size(size_16bit[3]));
//    // 32bit module
//    wire [5-1:0] l_o_32 [0:1];
//    wire [5-1:0] r_o_32 [0:1];
//    wire [2-1:0] flag_32bit;
//    wire [32*14-1:0] array_32bit [0:1];
//    wire [6-1:0] size_32bit [0:1];
//    module_32bit P0(.l_l(l_o_16[1]), .l_r(r_o_16[1]), .r_l(l_o_16[0]), .r_r(r_o_16[0]), .l_flag(flag_16bit[1]), .r_flag(flag_16bit[0]), .l_array(array_16bit[1]), .r_array(array_16bit[0]), .l_size(size_16bit[1]), .r_size(size_16bit[0]), .left(l_o_32[0]), .right(r_o_32[0]), .flag(flag_32bit[0]), .array(array_32bit[0]), .size(size_32bit[0]));
//    module_32bit P1(.l_l(l_o_16[3]), .l_r(r_o_16[3]), .r_l(l_o_16[2]), .r_r(r_o_16[2]), .l_flag(flag_16bit[3]), .r_flag(flag_16bit[2]), .l_array(array_16bit[3]), .r_array(array_16bit[2]), .l_size(size_16bit[3]), .r_size(size_16bit[2]), .left(l_o_32[1]), .right(r_o_32[1]), .flag(flag_32bit[1]), .array(array_32bit[1]), .size(size_32bit[1]));
//    //64 bit module output
//    wire [6-1:0] l_o_64;
//    wire [6-1:0] r_o_64;
//    wire flag_64bit;
//    wire [64*14-1:0] array_64bit;
//    wire [6-1:0] size_64bit;
//    module_64bit Q0(.l_l(l_o_32[1]), .l_r(r_o_32[1]), .r_l(l_o_32[0]), .r_r(r_o_32[0]), .l_flag(flag_32bit[1]), .r_flag(flag_32bit[0]), .l_array(array_32bit[1]), .r_array(array_32bit[0]), .l_size(size_32bit[1]), .r_size(size_32bit[0]), .left(l_o_64), .right(r_o_64), .flag(flag_64bit), .array(array_64bit), .size(size_64bit));
//    // output concatenation
//    wire [10-1:0] shifter;
//    assign shifter = (64 - size_64bit) * 14;
//    assign encoded_data = flag_64bit ? ((array_64bit << shifter) + (14'b1111_1111_1111_11 << (shifter - 14))) : (14'b1111_1111_1111_11 << 882);
//endmodule 
//
//
//
//
//
//    
//
module RLE(
    input [512-1:0] data_in, // 512-bit input data
    output reg [14*64-1:0] encoded_data
); 
    // 8bit module outputs
    wire [3-1:0] l_o_8 [0:7];
    wire [3-1:0] r_o_8 [0:7];
    wire [8-1:0] flag_8bit;
    wire [8*14-1:0] array_8bit [0:7];
    wire [4-1:0] size_8bit [0:7];
    module_8bit_enhanced N0(.data_in(data_in[8*8-1:8*0]), .left(l_o_8[0]), .right(r_o_8[0]), .flag(flag_8bit[0]), .array(array_8bit[0]), .size(size_8bit[0]));
    module_8bit_enhanced N1(.data_in(data_in[8*16-1:8*8]), .left(l_o_8[1]), .right(r_o_8[1]), .flag(flag_8bit[1]), .array(array_8bit[1]), .size(size_8bit[1]));
    module_8bit_enhanced N2(.data_in(data_in[8*24-1:8*16]), .left(l_o_8[2]), .right(r_o_8[2]), .flag(flag_8bit[2]), .array(array_8bit[2]), .size(size_8bit[2]));
    module_8bit_enhanced N3(.data_in(data_in[8*32-1:8*24]), .left(l_o_8[3]), .right(r_o_8[3]), .flag(flag_8bit[3]), .array(array_8bit[3]), .size(size_8bit[3]));
    module_8bit_enhanced N4(.data_in(data_in[8*40-1:8*32]), .left(l_o_8[4]), .right(r_o_8[4]), .flag(flag_8bit[4]), .array(array_8bit[4]), .size(size_8bit[4]));
    module_8bit_enhanced N5(.data_in(data_in[8*48-1:8*40]), .left(l_o_8[5]), .right(r_o_8[5]), .flag(flag_8bit[5]), .array(array_8bit[5]), .size(size_8bit[5]));
    module_8bit_enhanced N6(.data_in(data_in[8*56-1:8*48]), .left(l_o_8[6]), .right(r_o_8[6]), .flag(flag_8bit[6]), .array(array_8bit[6]), .size(size_8bit[6]));
    module_8bit_enhanced N7(.data_in(data_in[8*64-1:8*56]), .left(l_o_8[7]), .right(r_o_8[7]), .flag(flag_8bit[7]), .array(array_8bit[7]), .size(size_8bit[7]));
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
    //wire [10-1:0] shifter;
    //assign shifter = (64 - size_64bit) * 14;
    //assign encoded_data = flag_64bit ? ((array_64bit << shifter) + (14'b1111_1111_1111_11 << (shifter - 14))) : (14'b1111_1111_1111_11 << 882);
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
endmodule 





    
