module decoder_full(
    input [14*64-1:0] data_in,
    output [8*64-1:0] data_out
);
    wire [10-1:0] shifter [0:63];
    //wire [7-1:0] flag [0:63];
    wire [8-1:0] array [0:63];
    decoder_14bit D0(.data(data_in[14*1-1:14*0]), .pos(7'b0000000), .out(array[0]), .size(shifter[0]));
    decoder_14bit D1(.data(data_in[14*2-1:14*1]), .pos(7'b0000001), .out(array[1]), .size(shifter[1]));
    decoder_14bit D2(.data(data_in[14*3-1:14*2]), .pos(7'b0000010), .out(array[2]), .size(shifter[2]));
    decoder_14bit D3(.data(data_in[14*4-1:14*3]), .pos(7'b0000011), .out(array[3]), .size(shifter[3]));
    decoder_14bit D4(.data(data_in[14*5-1:14*4]), .pos(7'b0000100), .out(array[4]), .size(shifter[4]));
    decoder_14bit D5(.data(data_in[14*6-1:14*5]), .pos(7'b0000101), .out(array[5]), .size(shifter[5]));
    decoder_14bit D6(.data(data_in[14*7-1:14*6]), .pos(7'b0000110), .out(array[6]), .size(shifter[6]));
    decoder_14bit D7(.data(data_in[14*8-1:14*7]), .pos(7'b0000111), .out(array[7]), .size(shifter[7]));
    decoder_14bit D8(.data(data_in[14*9-1:14*8]), .pos(7'b0001000), .out(array[8]), .size(shifter[8]));
    decoder_14bit D9(.data(data_in[14*10-1:14*9]), .pos(7'b0001001), .out(array[9]), .size(shifter[9]));
    decoder_14bit D10(.data(data_in[14*11-1:14*10]), .pos(7'b0001010), .out(array[10]), .size(shifter[10]));
    decoder_14bit D11(.data(data_in[14*12-1:14*11]), .pos(7'b0001011), .out(array[11]), .size(shifter[11]));
    decoder_14bit D12(.data(data_in[14*13-1:14*12]), .pos(7'b0001100), .out(array[12]), .size(shifter[12]));
    decoder_14bit D13(.data(data_in[14*14-1:14*13]), .pos(7'b0001101), .out(array[13]), .size(shifter[13]));
    decoder_14bit D14(.data(data_in[14*15-1:14*14]), .pos(7'b0001110),. out(array[14]), .size(shifter[14]));
    decoder_14bit D15(.data(data_in[14*16-1:14*15]), .pos(7'b0001111), .out(array[15]), .size(shifter[15]));
    decoder_14bit D16(.data(data_in[14*17-1:14*16]), .pos(7'b0010000), .out(array[16]), .size(shifter[16]));
    decoder_14bit D17(.data(data_in[14*18-1:14*17]), .pos(7'b0010001), .out(array[17]), .size(shifter[17]));
    decoder_14bit D18(.data(data_in[14*19-1:14*18]), .pos(7'b0010010), .out(array[18]), .size(shifter[18]));
    decoder_14bit D19(.data(data_in[14*20-1:14*19]), .pos(7'b0010011), .out(array[19]), .size(shifter[19]));
    decoder_14bit D20(.data(data_in[14*21-1:14*20]), .pos(7'b0010100), .out(array[20]), .size(shifter[20]));
    decoder_14bit D21(.data(data_in[14*22-1:14*21]), .pos(7'b0010101), .out(array[21]), .size(shifter[21]));
    decoder_14bit D22(.data(data_in[14*23-1:14*22]), .pos(7'b0010110), .out(array[22]), .size(shifter[22]));
    decoder_14bit D23(.data(data_in[14*24-1:14*23]), .pos(7'b0010111), .out(array[23]), .size(shifter[23]));
    decoder_14bit D24(.data(data_in[14*25-1:14*24]), .pos(7'b0011000), .out(array[24]), .size(shifter[24]));
    decoder_14bit D25(.data(data_in[14*26-1:14*25]), .pos(7'b0011001), .out(array[25]), .size(shifter[25]));
    decoder_14bit D26(.data(data_in[14*27-1:14*26]), .pos(7'b0011010), .out(array[26]), .size(shifter[26]));
    decoder_14bit D27(.data(data_in[14*28-1:14*27]), .pos(7'b0011011), .out(array[27]), .size(shifter[27]));
    decoder_14bit D28(.data(data_in[14*29-1:14*28]), .pos(7'b0011100), .out(array[28]), .size(shifter[28]));
    decoder_14bit D29(.data(data_in[14*30-1:14*29]), .pos(7'b0011101), .out(array[29]), .size(shifter[29]));
    decoder_14bit D30(.data(data_in[14*31-1:14*30]), .pos(7'b0011110), .out(array[30]), .size(shifter[30]));
    decoder_14bit D31(.data(data_in[14*32-1:14*31]), .pos(7'b0011111), .out(array[31]), .size(shifter[31]));
    decoder_14bit D32(.data(data_in[14*33-1:14*32]), .pos(7'b0100000), .out(array[32]), .size(shifter[32]));
    decoder_14bit D33(.data(data_in[14*34-1:14*33]), .pos(7'b0100001), .out(array[33]), .size(shifter[33]));
    decoder_14bit D34(.data(data_in[14*35-1:14*34]), .pos(7'b0100010), .out(array[34]), .size(shifter[34]));
    decoder_14bit D35(.data(data_in[14*36-1:14*35]), .pos(7'b0100011), .out(array[35]), .size(shifter[35]));
    decoder_14bit D36(.data(data_in[14*37-1:14*36]), .pos(7'b0100100), .out(array[36]), .size(shifter[36]));
    decoder_14bit D37(.data(data_in[14*38-1:14*37]), .pos(7'b0100101), .out(array[37]), .size(shifter[37]));
    decoder_14bit D38(.data(data_in[14*39-1:14*38]), .pos(7'b0100110), .out(array[38]), .size(shifter[38]));
    decoder_14bit D39(.data(data_in[14*40-1:14*39]), .pos(7'b0100111), .out(array[39]), .size(shifter[39]));
    decoder_14bit D40(.data(data_in[14*41-1:14*40]), .pos(7'b0101000), .out(array[40]), .size(shifter[40]));
    decoder_14bit D41(.data(data_in[14*42-1:14*41]), .pos(7'b0101001), .out(array[41]), .size(shifter[41]));
    decoder_14bit D42(.data(data_in[14*43-1:14*42]), .pos(7'b0101010), .out(array[42]), .size(shifter[42]));
    decoder_14bit D43(.data(data_in[14*44-1:14*43]), .pos(7'b0101011), .out(array[43]), .size(shifter[43]));
    decoder_14bit D44(.data(data_in[14*45-1:14*44]), .pos(7'b0101100), .out(array[44]), .size(shifter[44]));
    decoder_14bit D45(.data(data_in[14*46-1:14*45]), .pos(7'b0101101), .out(array[45]), .size(shifter[45]));
    decoder_14bit D46(.data(data_in[14*47-1:14*46]), .pos(7'b0101110), .out(array[46]), .size(shifter[46]));
    decoder_14bit D47(.data(data_in[14*48-1:14*47]), .pos(7'b0101111), .out(array[47]), .size(shifter[47]));
    decoder_14bit D48(.data(data_in[14*49-1:14*48]), .pos(7'b0110000), .out(array[48]), .size(shifter[48]));
    decoder_14bit D49(.data(data_in[14*50-1:14*49]), .pos(7'b0110001), .out(array[49]), .size(shifter[49]));
    decoder_14bit D50(.data(data_in[14*51-1:14*50]), .pos(7'b0110010), .out(array[50]), .size(shifter[50]));
    decoder_14bit D51(.data(data_in[14*52-1:14*51]), .pos(7'b0110011), .out(array[51]), .size(shifter[51]));
    decoder_14bit D52(.data(data_in[14*53-1:14*52]), .pos(7'b0110100), .out(array[52]), .size(shifter[52]));
    decoder_14bit D53(.data(data_in[14*54-1:14*53]), .pos(7'b0110101), .out(array[53]), .size(shifter[53]));
    decoder_14bit D54(.data(data_in[14*55-1:14*54]), .pos(7'b0110110), .out(array[54]), .size(shifter[54]));
    decoder_14bit D55(.data(data_in[14*56-1:14*55]), .pos(7'b0110111), .out(array[55]), .size(shifter[55]));
    decoder_14bit D56(.data(data_in[14*57-1:14*56]), .pos(7'b0111000), .out(array[56]), .size(shifter[56]));
    decoder_14bit D57(.data(data_in[14*58-1:14*57]), .pos(7'b0111001), .out(array[57]), .size(shifter[57]));
    decoder_14bit D58(.data(data_in[14*59-1:14*58]), .pos(7'b0111010), .out(array[58]), .size(shifter[58]));
    decoder_14bit D59(.data(data_in[14*60-1:14*59]), .pos(7'b0111011), .out(array[59]), .size(shifter[59]));
    decoder_14bit D60(.data(data_in[14*61-1:14*60]), .pos(7'b0111100), .out(array[60]), .size(shifter[60]));
    decoder_14bit D61(.data(data_in[14*62-1:14*61]), .pos(7'b0111101), .out(array[61]), .size(shifter[61]));
    decoder_14bit D62(.data(data_in[14*63-1:14*62]), .pos(7'b0111110), .out(array[62]), .size(shifter[62]));
    decoder_14bit D63(.data(data_in[14*64-1:14*63]), .pos(7'b0111111), .out(array[63]), .size(shifter[63]));
    // output concatenation
    wire [10-1:0] temp_shifter [0:63];
    assign temp_shifter[00] = shifter[0];
    assign temp_shifter[01] = temp_shifter[00] + shifter[01];
    assign temp_shifter[02] = temp_shifter[01] + shifter[02];
    assign temp_shifter[03] = temp_shifter[02] + shifter[03];
    assign temp_shifter[04] = temp_shifter[03] + shifter[04];
    assign temp_shifter[05] = temp_shifter[04] + shifter[05];
    assign temp_shifter[06] = temp_shifter[05] + shifter[06];
    assign temp_shifter[07] = temp_shifter[06] + shifter[07];
    assign temp_shifter[08] = temp_shifter[07] + shifter[08];
    assign temp_shifter[09] = temp_shifter[08] + shifter[09];
    assign temp_shifter[10] = temp_shifter[09] + shifter[10];
    assign temp_shifter[11] = temp_shifter[10] + shifter[11];
    assign temp_shifter[12] = temp_shifter[11] + shifter[12];
    assign temp_shifter[13] = temp_shifter[12] + shifter[13];
    assign temp_shifter[14] = temp_shifter[13] + shifter[14];
    assign temp_shifter[15] = temp_shifter[14] + shifter[15];
    assign temp_shifter[16] = temp_shifter[15] + shifter[16];
    assign temp_shifter[17] = temp_shifter[16] + shifter[17];
    assign temp_shifter[18] = temp_shifter[17] + shifter[18];
    assign temp_shifter[19] = temp_shifter[18] + shifter[19];
    assign temp_shifter[20] = temp_shifter[19] + shifter[20];
    assign temp_shifter[21] = temp_shifter[20] + shifter[21];
    assign temp_shifter[22] = temp_shifter[21] + shifter[22];
    assign temp_shifter[23] = temp_shifter[22] + shifter[23];
    assign temp_shifter[24] = temp_shifter[23] + shifter[24];
    assign temp_shifter[25] = temp_shifter[24] + shifter[25];
    assign temp_shifter[26] = temp_shifter[25] + shifter[26];
    assign temp_shifter[27] = temp_shifter[26] + shifter[27];
    assign temp_shifter[28] = temp_shifter[27] + shifter[28];
    assign temp_shifter[29] = temp_shifter[28] + shifter[29];
    assign temp_shifter[30] = temp_shifter[29] + shifter[30];
    assign temp_shifter[31] = temp_shifter[30] + shifter[31];
    assign temp_shifter[32] = temp_shifter[31] + shifter[32];
    assign temp_shifter[33] = temp_shifter[32] + shifter[33];
    assign temp_shifter[34] = temp_shifter[33] + shifter[34];
    assign temp_shifter[35] = temp_shifter[34] + shifter[35];
    assign temp_shifter[36] = temp_shifter[35] + shifter[36];
    assign temp_shifter[37] = temp_shifter[36] + shifter[37];
    assign temp_shifter[38] = temp_shifter[37] + shifter[38];
    assign temp_shifter[39] = temp_shifter[38] + shifter[39];
    assign temp_shifter[40] = temp_shifter[39] + shifter[40];
    assign temp_shifter[41] = temp_shifter[40] + shifter[41];
    assign temp_shifter[42] = temp_shifter[41] + shifter[42];
    assign temp_shifter[43] = temp_shifter[42] + shifter[43];
    assign temp_shifter[44] = temp_shifter[43] + shifter[44];
    assign temp_shifter[45] = temp_shifter[44] + shifter[45];
    assign temp_shifter[46] = temp_shifter[45] + shifter[46];
    assign temp_shifter[47] = temp_shifter[46] + shifter[47];
    assign temp_shifter[48] = temp_shifter[47] + shifter[48];
    assign temp_shifter[49] = temp_shifter[48] + shifter[49];
    assign temp_shifter[50] = temp_shifter[49] + shifter[50];
    assign temp_shifter[51] = temp_shifter[50] + shifter[51];
    assign temp_shifter[52] = temp_shifter[51] + shifter[52];
    assign temp_shifter[53] = temp_shifter[52] + shifter[53];
    assign temp_shifter[54] = temp_shifter[53] + shifter[54];
    assign temp_shifter[55] = temp_shifter[54] + shifter[55];
    assign temp_shifter[56] = temp_shifter[55] + shifter[56];
    assign temp_shifter[57] = temp_shifter[56] + shifter[57];
    assign temp_shifter[58] = temp_shifter[57] + shifter[58];
    assign temp_shifter[59] = temp_shifter[58] + shifter[59];
    assign temp_shifter[60] = temp_shifter[59] + shifter[60];
    assign temp_shifter[61] = temp_shifter[60] + shifter[61];
    assign temp_shifter[62] = temp_shifter[61] + shifter[62];
    assign temp_shifter[63] = temp_shifter[62] + shifter[63];
    wire [8*64-1:0] temp_result;
    assign temp_result = array[0] + (array[1] << temp_shifter[0]) + (array[2] << temp_shifter[1]) + (array[3] << temp_shifter[2]) + 
                        (array[4] << temp_shifter[3]) + (array[5] << temp_shifter[4]) + (array[6] << temp_shifter[5]) + (array[7] << temp_shifter[6]) +
                        (array[8] << temp_shifter[7]) + (array[9] << temp_shifter[8]) + (array[10] << temp_shifter[9]) + (array[11] << temp_shifter[10]) +
                        (array[12] << temp_shifter[11]) + (array[13] << temp_shifter[12]) + (array[14] << temp_shifter[13]) + (array[15] << temp_shifter[14]) +
                        (array[16] << temp_shifter[15]) + (array[17] << temp_shifter[16]) + (array[18] << temp_shifter[17]) + (array[19] << temp_shifter[18]) +
                        (array[20] << temp_shifter[19]) + (array[21] << temp_shifter[20]) + (array[22] << temp_shifter[21]) + (array[23] << temp_shifter[22]) +
                        (array[24] << temp_shifter[23]) + (array[25] << temp_shifter[24]) + (array[26] << temp_shifter[25]) + (array[27] << temp_shifter[26]) +
                        (array[28] << temp_shifter[27]) + (array[29] << temp_shifter[28]) + (array[30] << temp_shifter[29]) + (array[31] << temp_shifter[30]) +
                        (array[32] << temp_shifter[31]) + (array[33] << temp_shifter[32]) + (array[34] << temp_shifter[33]) + (array[35] << temp_shifter[34]) +
                        (array[36] << temp_shifter[35]) + (array[37] << temp_shifter[36]) + (array[38] << temp_shifter[37]) + (array[39] << temp_shifter[38]) +
                        (array[40] << temp_shifter[39]) + (array[41] << temp_shifter[40]) + (array[42] << temp_shifter[41]) + (array[43] << temp_shifter[42]) +
                        (array[44] << temp_shifter[43]) + (array[45] << temp_shifter[44]) + (array[46] << temp_shifter[45]) + (array[47] << temp_shifter[46]) +
                        (array[48] << temp_shifter[47]) + (array[49] << temp_shifter[48]) + (array[50] << temp_shifter[49]) + (array[51] << temp_shifter[50]) +
                        (array[52] << temp_shifter[51]) + (array[53] << temp_shifter[52]) + (array[54] << temp_shifter[53]) + (array[55] << temp_shifter[54]) +
                        (array[56] << temp_shifter[55]) + (array[57] << temp_shifter[56]) + (array[58] << temp_shifter[57]) + (array[59] << temp_shifter[58]) +
                        (array[60] << temp_shifter[59]) + (array[61] << temp_shifter[60]) + (array[62] << temp_shifter[61]) + (array[63] << temp_shifter[62]);
    wire [8*64-1:0] zeros;
    assign zeros = (64 - (temp_shifter[63] >> 3)) << 3;
    assign data_out = temp_result << zeros;
endmodule