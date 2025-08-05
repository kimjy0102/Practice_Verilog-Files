module IDCT_2D#(
    parameter signed [9-1:0] c1 = 9'b011111011,
    parameter signed [9-1:0] c2 = 9'b011101100,
    parameter signed [9-1:0] c3 = 9'b011010101,
    parameter signed [9-1:0] c4 = 9'b010110101,
    parameter signed [9-1:0] c5 = 9'b010001110,
    parameter signed [9-1:0] c6 = 9'b001100010,
    parameter signed [9-1:0] c7 = 9'b000110010
)(
    input [8*11-1:0] data_in,
    output [8*8-1:0] data_out
);
    // Internal signals
    wire signed [11-1:0] x_0, x_1, x_2, x_3, x_4, x_5, x_6, x_7;    
    wire signed [23-1:0] z0, z1, z2, z3, z4, z5, z6, z7;         
    assign x_0 = data_in[11*8-1:11*7];
    assign x_1 = data_in[11*7-1:11*6];
    assign x_2 = data_in[11*6-1:11*5];
    assign x_3 = data_in[11*5-1:11*4];
    assign x_4 = data_in[11*4-1:11*3];
    assign x_5 = data_in[11*3-1:11*2];
    assign x_6 = data_in[11*2-1:11*1];
    assign x_7 = data_in[11*1-1:11*0];
    wire signed [20-1:0] temp_01;
    assign temp_01 = c4 * x_0;
    wire signed [20-1:0] temp_02;
    assign temp_02 = c1 * x_1;
    wire signed [20-1:0] temp_03;
    assign temp_03 = c3 * x_1;
    wire signed [20-1:0] temp_04;
    assign temp_04 = c5 * x_1;
    wire signed [20-1:0] temp_05;
    assign temp_05 = c7 * x_1;
    wire signed [20-1:0] temp_06;
    assign temp_06 = c2 * x_2;
    wire signed [20-1:0] temp_07;
    assign temp_07 = c6 * x_2;
    wire signed [20-1:0] temp_08;
    assign temp_08 = c1 * x_3;
    wire signed [20-1:0] temp_09;
    assign temp_09 = c3 * x_3;
    wire signed [20-1:0] temp_10;
    assign temp_10 = c5 * x_3;
    wire signed [20-1:0] temp_11;
    assign temp_11 = c7 * x_3;
    wire signed [20-1:0] temp_12;
    assign temp_12 = c4 * x_4;
    wire signed [20-1:0] temp_13;
    assign temp_13 = c1 * x_5;
    wire signed [20-1:0] temp_14;
    assign temp_14 = c3 * x_5;
    wire signed [20-1:0] temp_15;
    assign temp_15 = c5 * x_5;
    wire signed [20-1:0] temp_16;
    assign temp_16 = c7 * x_5;
    wire signed [20-1:0] temp_17;
    assign temp_17 = c2 * x_6;
    wire signed [20-1:0] temp_18;
    assign temp_18 = c6 * x_6;
    wire signed [20-1:0] temp_19;
    assign temp_19 = c1 * x_7;
    wire signed [20-1:0] temp_20;
    assign temp_20 = c3 * x_7;
    wire signed [20-1:0] temp_21;
    assign temp_21 = c5 * x_7;
    wire signed [20-1:0] temp_22;
    assign temp_22 = c7 * x_7;
    //wire signed [20-1:0] temp_01;
    //assign temp_01 = x_0 + (x_0 << 2) + (x_0 <<4) + (x_0 << 5) + (x_0 << 7); // c4*x_0
    //wire signed [20-1:0] temp_02;
    //assign temp_02 = x_1 + (x_1 << 1) + (x_1 << 8) - (x_1 << 3); // c1 * x_1
    //wire signed [20-1:0] temp_03;
    //assign temp_03 = x_1 + (x_1 << 2) + (x_1 << 4) + (x_1 << 6) + (x_1 << 7); // c3 * x_1
    //wire signed [20-1:0] temp_04;
    //assign temp_04 = (x_1 << 4) + (x_1 << 7) - (x_1 << 1); // c5 * x_1
    //wire signed [20-1:0] temp_05;
    //assign temp_05 = (x_1 << 1) + (x_1 << 4) + (x_1 << 5); // c7 * x_1
    //wire signed [20-1:0] temp_06;
    //assign temp_06 = (x_2 << 2) + (x_2 << 3) + (x_2 << 8) - (x_2 << 5); // c2 * x_2
    //wire signed [20-1:0] temp_07;
    //assign temp_07 = (x_2 << 1) + (x_2 << 5) + (x_2 << 6); // c6 * x_2
    //wire signed [20-1:0] temp_08;
    //assign temp_08 = x_3 + (x_3 << 1) + (x_3 << 8) - (x_3 << 3); // c1 * x3
    //wire signed [20-1:0] temp_09;
    //assign temp_09 = x_3 + (x_3 << 2) + (x_3 << 4) + (x_3 << 6) + (x_3 << 7); // c3 * x_3
    //wire signed [20-1:0] temp_10;
    //assign temp_10 = (x_3 << 4) + (x_3 << 7) - (x_3 << 1); //c5 * x_3;
    //wire signed [20-1:0] temp_11;
    //assign temp_11 = (x_3 << 1) + (x_3 << 4) + (x_3 << 5);//c7 * x_3;
    //wire signed [20-1:0] temp_12;
    //assign temp_12 = x_4 + (x_4 << 2) + (x_4 << 4) + (x_4 << 5) + (x_4 << 7);//c4 * x_4;
    //wire signed [20-1:0] temp_13;
    //assign temp_13 = x_5 + (x_5 << 1) + (x_5 << 8) - (x_5 << 3);//c1 * x_5;
    //wire signed [20-1:0] temp_14;
    //assign temp_14 = x_5 + (x_5 << 2) + (x_5 << 4) + (x_5 << 6) + (x_5 << 7);//c3 * x_5;
    //wire signed [20-1:0] temp_15;
    //assign temp_15 = (x_5 << 4) + (x_5 << 7) - (x_5 << 1);//c5 * x_5;
    //wire signed [20-1:0] temp_16;
    //assign temp_16 = (x_5 << 1) + (x_5 << 4) + (x_5 << 5);//c7 * x_5;
    //wire signed [20-1:0] temp_17;
    //assign temp_17 = (x_6 << 2) + (x_6 << 3) + (x_6 << 8) - (x_6 << 5);//c2 * x_6;
    //wire signed [20-1:0] temp_18;
    //assign temp_18 = (x_6 << 1) + (x_6 << 5) + (x_6 << 6);//c6 * x_6;
    //wire signed [20-1:0] temp_19;
    //assign temp_19 = x_7 + (x_7 << 1) + (x_7 << 8) - (x_7 << 3);//c1 * x_7;
    //wire signed [20-1:0] temp_20;
    //assign temp_20 = x_7 + (x_7 << 2) + (x_7 << 4) + (x_7 << 6) + (x_7 << 7);//c3 * x_7;
    //wire signed [20-1:0] temp_21;
    //assign temp_21 = (x_7 << 4) + (x_7 << 7) - (x_7 << 1);//c5 * x_7;
    //wire signed [20-1:0] temp_22;
    //assign temp_22 = (x_7 << 1) + (x_7 << 4) + (x_7 << 5);//c7 * x_7;
    //assign z0 = ({{3{temp_01[19]}},temp_01}) + ({{3{temp_02[19]}},temp_02}) + ({{3{temp_06[19]}},temp_06}) + ({{3{temp_09[19]}},temp_09}) + ({{3{temp_12[19]}},temp_12}) + ({{3{temp_15[19]}},temp_15}) + ({{3{temp_18[19]}},temp_18}) + ({{3{temp_22[19]}},temp_22});
    //assign z1 = ({{3{temp_01[19]}},temp_01}) + ({{3{temp_03[19]}},temp_03}) + ({{3{temp_07[19]}},temp_07}) - ({{3{temp_11[19]}},temp_11}) - ({{3{temp_12[19]}},temp_12}) - ({{3{temp_13[19]}},temp_13}) - ({{3{temp_17[19]}},temp_17}) - ({{3{temp_21[19]}},temp_21});
    //assign z2 = ({{3{temp_01[19]}},temp_01}) + ({{3{temp_04[19]}},temp_04}) - ({{3{temp_07[19]}},temp_07}) - ({{3{temp_08[19]}},temp_08}) - ({{3{temp_12[19]}},temp_12}) + ({{3{temp_16[19]}},temp_16}) + ({{3{temp_17[19]}},temp_17}) + ({{3{temp_20[19]}},temp_20});
    //assign z3 = ({{3{temp_01[19]}},temp_01}) + ({{3{temp_05[19]}},temp_05}) - ({{3{temp_06[19]}},temp_06}) - ({{3{temp_10[19]}},temp_10}) + ({{3{temp_12[19]}},temp_12}) + ({{3{temp_14[19]}},temp_14}) - ({{3{temp_18[19]}},temp_18}) - ({{3{temp_19[19]}},temp_19});
    //assign z4 = ({{3{temp_01[19]}},temp_01}) - ({{3{temp_05[19]}},temp_05}) - ({{3{temp_06[19]}},temp_06}) + ({{3{temp_10[19]}},temp_10}) + ({{3{temp_12[19]}},temp_12}) - ({{3{temp_14[19]}},temp_14}) - ({{3{temp_18[19]}},temp_18}) + ({{3{temp_19[19]}},temp_19});
    //assign z5 = ({{3{temp_01[19]}},temp_01}) - ({{3{temp_04[19]}},temp_04}) - ({{3{temp_07[19]}},temp_07}) + ({{3{temp_08[19]}},temp_08}) - ({{3{temp_12[19]}},temp_12}) - ({{3{temp_16[19]}},temp_16}) + ({{3{temp_17[19]}},temp_17}) - ({{3{temp_20[19]}},temp_20});
    //assign z6 = ({{3{temp_01[19]}},temp_01}) - ({{3{temp_03[19]}},temp_03}) + ({{3{temp_07[19]}},temp_07}) + ({{3{temp_11[19]}},temp_11}) - ({{3{temp_12[19]}},temp_12}) + ({{3{temp_13[19]}},temp_13}) - ({{3{temp_17[19]}},temp_17}) + ({{3{temp_21[19]}},temp_21});
    //assign z7 = ({{3{temp_01[19]}},temp_01}) - ({{3{temp_02[19]}},temp_02}) + ({{3{temp_06[19]}},temp_06}) - ({{3{temp_09[19]}},temp_09}) + ({{3{temp_12[19]}},temp_12}) - ({{3{temp_15[19]}},temp_15}) + ({{3{temp_18[19]}},temp_18}) - ({{3{temp_22[19]}},temp_22});
    assign z0 = temp_01 + temp_02 + temp_06 + temp_09 + temp_12 + temp_15 + temp_18 + temp_22;
    assign z1 = temp_01 + temp_03 + temp_07 - temp_11 - temp_12 - temp_13 - temp_17 - temp_21;
    assign z2 = temp_01 + temp_04 - temp_07 - temp_08 - temp_12 + temp_16 + temp_17 + temp_20;
    assign z3 = temp_01 + temp_05 - temp_06 - temp_10 + temp_12 + temp_14 - temp_18 - temp_19;
    assign z4 = temp_01 - temp_05 - temp_06 + temp_10 + temp_12 - temp_14 - temp_18 + temp_19;
    assign z5 = temp_01 - temp_04 - temp_07 + temp_08 - temp_12 - temp_16 + temp_17 - temp_20;
    assign z6 = temp_01 - temp_03 + temp_07 + temp_11 - temp_12 + temp_13 - temp_17 + temp_21;
    assign z7 = temp_01 - temp_02 + temp_06 - temp_09 + temp_12 - temp_15 + temp_18 - temp_22;
    wire signed [14-1:0] z0_clip;
    wire signed [14-1:0] z1_clip;
    wire signed [14-1:0] z2_clip;
    wire signed [14-1:0] z3_clip;
    wire signed [14-1:0] z4_clip;
    wire signed [14-1:0] z5_clip;
    wire signed [14-1:0] z6_clip;
    wire signed [14-1:0] z7_clip;
    assign z0_clip = z0[22:9];
    assign z1_clip = z1[22:9];
    assign z2_clip = z2[22:9];
    assign z3_clip = z3[22:9];
    assign z4_clip = z4[22:9];
    assign z5_clip = z5[22:9];
    assign z6_clip = z6[22:9];
    assign z7_clip = z7[22:9];
    // round off
    wire [8-1:0] result_0;
    wire [8-1:0] result_1;
    wire [8-1:0] result_2;
    wire [8-1:0] result_3;
    wire [8-1:0] result_4;
    wire [8-1:0] result_5;
    wire [8-1:0] result_6;
    wire [8-1:0] result_7;
    assign result_0 = ((z0[22:9] == 8'b1111_1111) && (z0[8])) ? 8'b1111_1111 : z0[16:9] + z0[8];
    assign result_1 = ((z1[22:9] == 8'b1111_1111) && (z1[8])) ? 8'b1111_1111 : z1[16:9] + z1[8];
    assign result_2 = ((z2[22:9] == 8'b1111_1111) && (z2[8])) ? 8'b1111_1111 : z2[16:9] + z2[8];
    assign result_3 = ((z3[22:9] == 8'b1111_1111) && (z3[8])) ? 8'b1111_1111 : z3[16:9] + z3[8];
    assign result_4 = ((z4[22:9] == 8'b1111_1111) && (z4[8])) ? 8'b1111_1111 : z4[16:9] + z4[8];
    assign result_5 = ((z5[22:9] == 8'b1111_1111) && (z5[8])) ? 8'b1111_1111 : z5[16:9] + z5[8];
    assign result_6 = ((z6[22:9] == 8'b1111_1111) && (z6[8])) ? 8'b1111_1111 : z6[16:9] + z6[8];
    assign result_7 = ((z7[22:9] == 8'b1111_1111) && (z7[8])) ? 8'b1111_1111 : z7[16:9] + z7[8];
    reg [8-1:0] z0_ov, z1_ov, z2_ov, z3_ov, z4_ov, z5_ov, z6_ov, z7_ov;
    always @(*) begin
        if (z0_clip > 255) begin // z0 overflow detection
            z0_ov = 8'b1111_1111;
        end 
        else if ( z0_clip < 0) begin
            z0_ov = 8'b0000_0000;
        end
        else begin
            z0_ov = result_0;
        end    
    end
    always @(*) begin
        if (z1_clip > 255) begin // z1 overflow detection
            z1_ov = 8'b1111_1111;
        end
        else if (z1_clip < 0) begin
            z1_ov = 8'b0000_0000;
        end    
        else begin
            z1_ov = result_1;
        end
    end
    always @(*) begin
        if ( z2_clip > 255 ) begin // z2 overflow detection
            z2_ov = 8'b1111_1111;            
        end
        else if ( z2_clip < 0 ) begin
            z2_ov = 8'b0000_0000;
        end    
        else begin
            z2_ov = result_2;
        end
    end
    always @(*) begin
        if ( z3_clip > 255) begin // z3 overflow detection
            z3_ov = 8'b1111_1111;
        end            
        else if ( z3_clip < 0 )begin
            z3_ov = 8'b0000_0000;
        end    
        else begin
            z3_ov = result_3;
        end
    end
    always @(*) begin
        if (z4_clip > 255 ) begin // z4 overflow detection
            z4_ov = 8'b1111_1111;
        end            
        else if ( z4_clip < 0 ) begin
            z4_ov = 8'b0000_0000;    
        end
        else begin
            z4_ov = result_4;
        end
    end
    always @(*) begin
        if ( z5_clip > 255) begin // z5 overflow detection
            z5_ov = 8'b1111_1111;
        end            
        else if (z5_clip < 0) begin
            z5_ov = 8'b0000_0000;
        end    
        else begin
            z5_ov = result_5;
        end
    end
    always @(*) begin
        if (z6_clip > 255) begin // z6 overflow detection
            z6_ov = 8'b1111_1111;
        end            
        else if (z6_clip < 0) begin
            z6_ov = 8'b0000_0000;
        end    
        else begin
            z6_ov = result_6;
        end
    end
    always @(*) begin
        if (z7_clip > 255) begin // z7 overflow detection
            z7_ov = 8'b1111_1111;
        end             
        else if (z7_clip < 0) begin
            z7_ov = 8'b0000_0000;    
        end
        else begin
            z7_ov = result_7;
        end
    end

    assign data_out = {z0_ov, z1_ov, z2_ov, z3_ov, z4_ov, z5_ov, z6_ov, z7_ov};
endmodule