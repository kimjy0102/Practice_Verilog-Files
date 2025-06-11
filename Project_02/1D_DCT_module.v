module DCT_1D (
    input [64-1:0] data_in,
    output [8*8-1:0] data_out
);
    // Internal signals
    wire signed [20-1:0] z0, z1, z2, z3, z4, z5, z6, z7; // 18bit maximum
    //wire signed [9-1:0] c1, c2, c3, c4, c5, c6, c7; // 9.8
    wire signed [9-1:0] x_0, x_1, x_2, x_3, x_4, x_5, x_6, x_7;
    // sign extension
    assign x_0 = {1'b0, data_in[63:56]};
    assign x_1 = {1'b0, data_in[55:48]};
    assign x_2 = {1'b0, data_in[47:40]};
    assign x_3 = {1'b0, data_in[39:32]};
    assign x_4 = {1'b0, data_in[31:24]};
    assign x_5 = {1'b0, data_in[23:16]};
    assign x_6 = {1'b0, data_in[15:8]};
    assign x_7 = {1'b0, data_in[7:0]};
    // butterfly unit
    wire signed [10-1:0] P0; // x_0 + x_7
    wire signed [10-1:0] M0; // x_0 - x_7
    wire signed [10-1:0] P1; // x_1 + x_6
    wire signed [10-1:0] M1; // x_1 - x_6
    wire signed [10-1:0] P2; // x_2 + x_5
    wire signed [10-1:0] M2; // x_2 - x_5
    wire signed [10-1:0] P3; // x_3 + x_4
    wire signed [10-1:0] M3; // x_3 - x_4

    wire signed [11-1:0] PP0_3; // x_0 + x_7 + x_3 + x_4
    wire signed [11-1:0] PM0_3; // x_0 + x_7 - x_3 - x_4
    wire signed [11-1:0] PP1_2; // X_1 + x_6 + x_2 + x_5
    wire signed [11-1:0] PM1_2; // x_1 + x_6 - x_2 - x_5

    wire signed [12-1:0] PPP0_3_1_2; // x_0 + x_7 + x_3 + x_4 + x_1 + x_6 + x_2 + x_5
    wire signed [12-1:0] PPM0_3_1_2; // x_0 + x_7 + x_3 + x_4 - x_1 - x_6 - x_2 - x_5 
    // multiply unit
    wire signed [16-1:0] C0; 
    wire signed [17-1:0] C1;
    wire signed [17-1:0] C2;
    wire signed [16-1:0] C3;
    wire signed [17-1:0] C4;
    wire signed [17-1:0] C5;
    //bfu
    butterfly_9bit buf0(.C1(P0), .C2(M0), .a(x_0), .b(x_7));
    butterfly_9bit buf1(.C1(P1), .C2(M1), .a(x_1), .b(x_6));
    butterfly_9bit buf2(.C1(P2), .C2(M2), .a(x_2), .b(x_5));
    butterfly_9bit buf3(.C1(P3), .C2(M3), .a(x_3), .b(x_4));
    
    butterfly_10bit buf4(.C1(PP0_3), .C2(PM0_3), .a(P0), .b(P3));
    butterfly_10bit buf5(.C1(PP1_2), .C2(PM1_2), .a(P1), .b(P2));
    
    butterfly_11bit buf6(.C1(PPP0_3_1_2), .C2(PPM0_3_1_2), .a(PP0_3), .b(PP1_2));
    // multiply unit
    assign C0 = (M1 << 3) + (M1 << 4) + (M2 << 4) + (M3 << 2); 
    assign C1 = (PM0_3 << 5) + (PM1_2 << 4);
    assign C2 = (M0 << 3) + (M0 << 4) - (M3 << 4) - (M1 << 2);
    assign C3 = (M3 << 3) + (M3 << 4) + (M0 << 4) + (M2 << 2);
    assign C4 = (PM0_3 << 4) - (PM1_2 << 5);
    assign C5 = (M2 << 3) + (M2 << 4) - (M1 << 4) + (M0 << 2);
    // Z Results
    assign z0 = (PPP0_3_1_2) + (PPP0_3_1_2 << 2) + (PPP0_3_1_2 << 4) + (PPP0_3_1_2 << 5) + (PPP0_3_1_2 << 7);
    assign z1 = (M0 << 8) + C0 + (C0 << 3);
    assign z2 = C1 + (C1 << 1) + (C1 << 2);
    assign z3 = C2 + (C2 << 3) - (M2 << 8);
    assign z4 = (PPM0_3_1_2) + (PPM0_3_1_2 << 2) + (PPM0_3_1_2 << 4) + (PPM0_3_1_2 << 5) + (PPM0_3_1_2 << 7);
    assign z5 = C3 + (C3 << 3) - (M1 << 8);
    assign z6 = C4 + (C4 << 1) + (C4 << 2);
    assign z7 = C5 + (C5 << 3) - (M3 << 8);

    assign data_out = { z0[19:12], z1[19:12], z2[19:12], z3[19:12], z4[19:12], z5[19:12], z6[19:12], z7[19:12] };
endmodule
