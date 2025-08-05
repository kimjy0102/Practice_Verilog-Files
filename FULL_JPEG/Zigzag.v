module zigzag(
    input [8*8-1:0] data_in,
    output [64*8-1:0] data_out,
    input  [15-1:0] cnt_in
);
    // array for temporary storage
    reg [8-1:0] array[0:64-1];
    always @(*) begin
        if (cnt_in[2:0] == 3'b011) begin
            array[0] = data_in[8*8-1:8*7];
            array[1] = data_in[8*7-1:8*6];
            array[5] = data_in[8*6-1:8*5];
            array[6] = data_in[8*5-1:8*4];
            array[14] = data_in[8*4-1:8*3];
            array[15] = data_in[8*3-1:8*2];
            array[27] = data_in[8*2-1:8*1];
            array[28] = data_in[8*1-1:8*0];
        end
        else if (cnt_in[2:0] == 3'b100) begin
            array[2] = data_in[8*8-1:8*7];
            array[4] = data_in[8*7-1:8*6];
            array[7] = data_in[8*6-1:8*5];
            array[13] = data_in[8*5-1:8*4];
            array[16] = data_in[8*4-1:8*3];
            array[26] = data_in[8*3-1:8*2];
            array[29] = data_in[8*2-1:8*1];
            array[42] = data_in[8*1-1:8*0];
        end
        else if (cnt_in[2:0] == 3'b101) begin
            array[3] = data_in[8*8-1:8*7];
            array[8] = data_in[8*7-1:8*6];
            array[12] = data_in[8*6-1:8*5];
            array[17] = data_in[8*5-1:8*4];
            array[25] = data_in[8*4-1:8*3];
            array[30] = data_in[8*3-1:8*2];
            array[41] = data_in[8*2-1:8*1];
            array[43] = data_in[8*1-1:8*0];
        end
        else if (cnt_in[2:0] == 3'b110) begin
            array[9] = data_in[8*8-1:8*7];
            array[11] = data_in[8*7-1:8*6];
            array[18] = data_in[8*6-1:8*5];
            array[24] = data_in[8*5-1:8*4];
            array[31] = data_in[8*4-1:8*3];
            array[40] = data_in[8*3-1:8*2];
            array[44] = data_in[8*2-1:8*1];
            array[53] = data_in[8*1-1:8*0];
        end
        else if (cnt_in[2:0] == 3'b111) begin
            array[10] = data_in[8*8-1:8*7];
            array[19] = data_in[8*7-1:8*6];
            array[23] = data_in[8*6-1:8*5];
            array[32] = data_in[8*5-1:8*4];
            array[39] = data_in[8*4-1:8*3];
            array[45] = data_in[8*3-1:8*2];
            array[52] = data_in[8*2-1:8*1];
            array[54] = data_in[8*1-1:8*0];
        end
        else if (cnt_in[2:0] == 3'b000) begin
            array[20] = data_in[8*8-1:8*7];
            array[22] = data_in[8*7-1:8*6];
            array[33] = data_in[8*6-1:8*5];
            array[38] = data_in[8*5-1:8*4];
            array[46] = data_in[8*4-1:8*3];
            array[51] = data_in[8*3-1:8*2];
            array[55] = data_in[8*2-1:8*1];
            array[60] = data_in[8*1-1:8*0];
        end
        else if (cnt_in[2:0] == 3'b001) begin
            array[21] = data_in[8*8-1:8*7];
            array[34] = data_in[8*7-1:8*6];
            array[37] = data_in[8*6-1:8*5];
            array[47] = data_in[8*5-1:8*4];
            array[50] = data_in[8*4-1:8*3];
            array[56] = data_in[8*3-1:8*2];
            array[59] = data_in[8*2-1:8*1];
            array[61] = data_in[8*1-1:8*0];
        end
        else if (cnt_in[2:0] == 3'b010) begin
            array[35] = data_in[8*8-1:8*7];
            array[36] = data_in[8*7-1:8*6];
            array[48] = data_in[8*6-1:8*5];
            array[49] = data_in[8*5-1:8*4];
            array[57] = data_in[8*4-1:8*3];
            array[58] = data_in[8*3-1:8*2];
            array[62] = data_in[8*2-1:8*1];
            array[63] = data_in[8*1-1:8*0];
        end
    end
    // concatenate the data into the output
    assign data_out = {array[0], array[1], array[2], array[3], array[4], array[5], array[6], array[7],
                       array[8], array[9], array[10], array[11], array[12], array[13], array[14], array[15],
                       array[16], array[17], array[18], array[19], array[20], array[21], array[22], array[23],
                       array[24], array[25], array[26], array[27], array[28], array[29], array[30], array[31],
                       array[32], array[33], array[34], array[35], array[36], array[37], array[38], array[39],
                       array[40], array[41], array[42], array[43], array[44], array[45], array[46], array[47],
                       array[48], array[49], array[50], array[51], array[52], array[53], array[54], array[55],
                       array[56], array[57], array[58] ,array [59] ,array [60] ,array [61] ,array [62] ,array [63]};
endmodule