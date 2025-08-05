module IDCT_1D#(
    parameter signed [9-1:0] c1 = 9'b011111011,
    parameter signed [9-1:0] c2 = 9'b011101100,
    parameter signed [9-1:0] c3 = 9'b011010101,
    parameter signed [9-1:0] c4 = 9'b010110101,
    parameter signed [9-1:0] c5 = 9'b010001110,
    parameter signed [9-1:0] c6 = 9'b001100010,
    parameter signed [9-1:0] c7 = 9'b000110010
)(
    input [8*12-1:0] data_in,
    output [8*11-1:0] data_out
);
    // Internal signals
    wire signed [24-1:0] z0, z1, z2, z3, z4, z5, z6, z7; // 23bit maximum
    wire signed [12-1:0] x_0, x_1, x_2, x_3, x_4, x_5, x_6, x_7;
    // sign extension
    assign x_0 = {data_in[12*8-1:12*7]};
    assign x_1 = {data_in[12*7-1:12*6]};
    assign x_2 = {data_in[12*6-1:12*5]};
    assign x_3 = {data_in[12*5-1:12*4]};
    assign x_4 = {data_in[12*4-1:12*3]};
    assign x_5 = {data_in[12*3-1:12*2]};
    assign x_6 = {data_in[12*2-1:12*1]};
    assign x_7 = {data_in[12*1-1:12*0]};
    wire [21-1:0] temp_01;
    assign temp_01 = c4 * x_0;
    wire [21-1:0] temp_02;
    assign temp_02 = c1 * x_1;
    wire [21-1:0] temp_03;
    assign temp_03 = c3 * x_1;
    wire [21-1:0] temp_04;
    assign temp_04 = c5 * x_1;
    wire [21-1:0] temp_05;
    assign temp_05 = c7 * x_1;
    wire [21-1:0] temp_06;
    assign temp_06 = c2 * x_2;
    wire [21-1:0] temp_07;
    assign temp_07 = c6 * x_2;
    wire [21-1:0] temp_08;
    assign temp_08 = c1 * x_3;
    wire [21-1:0] temp_09;
    assign temp_09 = c3 * x_3;
    wire [21-1:0] temp_10;
    assign temp_10 = c5 * x_3;
    wire [21-1:0] temp_11;
    assign temp_11 = c7 * x_3;
    wire [21-1:0] temp_12;
    assign temp_12 = c4 * x_4;
    wire [21-1:0] temp_13;
    assign temp_13 = c1 * x_5;
    wire [21-1:0] temp_14;
    assign temp_14 = c3 * x_5;
    wire [21-1:0] temp_15;
    assign temp_15 = c5 * x_5;
    wire [21-1:0] temp_16;
    assign temp_16 = c7 * x_5;
    wire [21-1:0] temp_17;
    assign temp_17 = c2 * x_6;
    wire [21-1:0] temp_18;
    assign temp_18 = c6 * x_6;
    wire [21-1:0] temp_19;
    assign temp_19 = c1 * x_7;
    wire [21-1:0] temp_20;
    assign temp_20 = c3 * x_7;
    wire [21-1:0] temp_21;
    assign temp_21 = c5 * x_7;
    wire [21-1:0] temp_22;
    assign temp_22 = c7 * x_7;
    assign z0 = ({{3{temp_01[20]}},temp_01}) + ({{3{temp_02[20]}},temp_02}) + ({{3{temp_06[20]}},temp_06}) + ({{3{temp_09[20]}},temp_09}) + ({{3{temp_12[20]}},temp_12}) + ({{3{temp_15[20]}},temp_15}) + ({{3{temp_18[20]}},temp_18}) + ({{3{temp_22[20]}},temp_22});
    assign z1 = ({{3{temp_01[20]}},temp_01}) + ({{3{temp_03[20]}},temp_03}) + ({{3{temp_07[20]}},temp_07}) - ({{3{temp_11[20]}},temp_11}) - ({{3{temp_12[20]}},temp_12}) - ({{3{temp_13[20]}},temp_13}) - ({{3{temp_17[20]}},temp_17}) - ({{3{temp_21[20]}},temp_21});
    assign z2 = ({{3{temp_01[20]}},temp_01}) + ({{3{temp_04[20]}},temp_04}) - ({{3{temp_07[20]}},temp_07}) - ({{3{temp_08[20]}},temp_08}) - ({{3{temp_12[20]}},temp_12}) + ({{3{temp_16[20]}},temp_16}) + ({{3{temp_17[20]}},temp_17}) + ({{3{temp_20[20]}},temp_20});
    assign z3 = ({{3{temp_01[20]}},temp_01}) + ({{3{temp_05[20]}},temp_05}) - ({{3{temp_06[20]}},temp_06}) - ({{3{temp_10[20]}},temp_10}) + ({{3{temp_12[20]}},temp_12}) + ({{3{temp_14[20]}},temp_14}) - ({{3{temp_18[20]}},temp_18}) - ({{3{temp_19[20]}},temp_19});
    assign z4 = ({{3{temp_01[20]}},temp_01}) - ({{3{temp_05[20]}},temp_05}) - ({{3{temp_06[20]}},temp_06}) + ({{3{temp_10[20]}},temp_10}) + ({{3{temp_12[20]}},temp_12}) - ({{3{temp_14[20]}},temp_14}) - ({{3{temp_18[20]}},temp_18}) + ({{3{temp_19[20]}},temp_19});
    assign z5 = ({{3{temp_01[20]}},temp_01}) - ({{3{temp_04[20]}},temp_04}) - ({{3{temp_07[20]}},temp_07}) + ({{3{temp_08[20]}},temp_08}) - ({{3{temp_12[20]}},temp_12}) - ({{3{temp_16[20]}},temp_16}) + ({{3{temp_17[20]}},temp_17}) - ({{3{temp_20[20]}},temp_20});
    assign z6 = ({{3{temp_01[20]}},temp_01}) - ({{3{temp_03[20]}},temp_03}) + ({{3{temp_07[20]}},temp_07}) + ({{3{temp_11[20]}},temp_11}) - ({{3{temp_12[20]}},temp_12}) + ({{3{temp_13[20]}},temp_13}) - ({{3{temp_17[20]}},temp_17}) + ({{3{temp_21[20]}},temp_21});
    assign z7 = ({{3{temp_01[20]}},temp_01}) - ({{3{temp_02[20]}},temp_02}) + ({{3{temp_06[20]}},temp_06}) - ({{3{temp_09[20]}},temp_09}) + ({{3{temp_12[20]}},temp_12}) - ({{3{temp_15[20]}},temp_15}) + ({{3{temp_18[20]}},temp_18}) - ({{3{temp_22[20]}},temp_22});
    assign data_out = { z0[19:9], z1[19:9], z2[19:9], z3[19:9], z4[19:9], z5[19:9], z6[19:9], z7[19:9]}; // 11.0
endmodule
