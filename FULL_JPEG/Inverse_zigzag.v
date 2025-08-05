module inverse_zigzag(
    input [8*64-1:0] data_in,
    output [8*8-1:0] data_out,
    input [15-1:0] address_in
);
    // storage for data input
    reg [8*8-1:0] data_out_d; 
    //
    wire [8-1:0] array[0:63];
    assign array[00] = data_in[8*64-1:8*63];
    assign array[01] = data_in[8*63-1:8*62];
    assign array[02] = data_in[8*62-1:8*61];
    assign array[03] = data_in[8*61-1:8*60];
    assign array[04] = data_in[8*60-1:8*59];
    assign array[05] = data_in[8*59-1:8*58];
    assign array[06] = data_in[8*58-1:8*57];
    assign array[07] = data_in[8*57-1:8*56];
    assign array[08] = data_in[8*56-1:8*55];
    assign array[09] = data_in[8*55-1:8*54];
    assign array[10] = data_in[8*54-1:8*53];
    assign array[11] = data_in[8*53-1:8*52];
    assign array[12] = data_in[8*52-1:8*51];
    assign array[13] = data_in[8*51-1:8*50];
    assign array[14] = data_in[8*50-1:8*49];
    assign array[15] = data_in[8*49-1:8*48];
    assign array[16] = data_in[8*48-1:8*47];
    assign array[17] = data_in[8*47-1:8*46];
    assign array[18] = data_in[8*46-1:8*45];
    assign array[19] = data_in[8*45-1:8*44];
    assign array[20] = data_in[8*44-1:8*43];
    assign array[21] = data_in[8*43-1:8*42];
    assign array[22] = data_in[8*42-1:8*41];
    assign array[23] = data_in[8*41-1:8*40];
    assign array[24] = data_in[8*40-1:8*39];
    assign array[25] = data_in[8*39-1:8*38];
    assign array[26] = data_in[8*38-1:8*37];
    assign array[27] = data_in[8*37-1:8*36];
    assign array[28] = data_in[8*36-1:8*35];
    assign array[29] = data_in[8*35-1:8*34];
    assign array[30] = data_in[8*34-1:8*33];
    assign array[31] = data_in[8*33-1:8*32];
    assign array[32] = data_in[8*32-1:8*31];
    assign array[33] = data_in[8*31-1:8*30];
    assign array[34] = data_in[8*30-1:8*29];
    assign array[35] = data_in[8*29-1:8*28];
    assign array[36] = data_in[8*28-1:8*27];
    assign array[37] = data_in[8*27-1:8*26];
    assign array[38] = data_in[8*26-1:8*25];
    assign array[39] = data_in[8*25-1:8*24];
    assign array[40] = data_in[8*24-1:8*23];
    assign array[41] = data_in[8*23-1:8*22];
    assign array[42] = data_in[8*22-1:8*21];
    assign array[43] = data_in[8*21-1:8*20];
    assign array[44] = data_in[8*20-1:8*19];
    assign array[45] = data_in[8*19-1:8*18];
    assign array[46] = data_in[8*18-1:8*17];
    assign array[47] = data_in[8*17-1:8*16];
    assign array[48] = data_in[8*16-1:8*15];
    assign array[49] = data_in[8*15-1:8*14];
    assign array[50] = data_in[8*14-1:8*13];
    assign array[51] = data_in[8*13-1:8*12];
    assign array[52] = data_in[8*12-1:8*11];
    assign array[53] = data_in[8*11-1:8*10];
    assign array[54] = data_in[8*10-1:8*9];
    assign array[55] = data_in[8*9-1:8*8];
    assign array[56] = data_in[8*8-1:8*7];
    assign array[57] = data_in[8*7-1:8*6];
    assign array[58] = data_in[8*6-1:8*5];
    assign array[59] = data_in[8*5-1:8*4];
    assign array[60] = data_in[8*4-1:8*3];
    assign array[61] = data_in[8*3-1:8*2];
    assign array[62] = data_in[8*2-1:8*1];
    assign array[63] = data_in[8*1-1:8*0];
    always @(*) begin
        if (address_in[2:0] == 3'b010) begin
            data_out_d = {array[0], array[1], array[5], array[6], array[14], array[15], array[27], array[28]};
        end
        else if (address_in[2:0] == 3'b011) begin
            data_out_d = {array[2], array[4], array[7], array[13], array[16], array[26], array[29], array[42]};
        end
        else if (address_in[2:0] == 3'b100) begin
            data_out_d = {array[3], array[8], array[12], array[17], array[25], array[30], array[41], array[43]};
        end
        else if (address_in[2:0] == 3'b101) begin
            data_out_d = {array[9], array[11], array[18], array[24], array[31], array[40], array[44], array[53]};
        end
        else if (address_in[2:0] == 3'b110) begin
            data_out_d = {array[10], array[19], array[23], array[32], array[39], array[45], array[52], array[54]};
        end
        else if (address_in[2:0] == 3'b111) begin
            data_out_d = {array[20], array[22], array[33], array[38], array[46], array[51], array[55], array[60]};
        end
        else if (address_in[2:0] == 3'b000) begin
            data_out_d = {array[21], array[34], array[37], array[47], array[50], array[56], array[59], array[61]};
        end
        else if (address_in[2:0] == 3'b001) begin
            data_out_d = {array[35], array[36], array[48], array[49], array[57], array[58], array[62], array[63]};
        end
    end
    assign data_out = data_out_d;
endmodule