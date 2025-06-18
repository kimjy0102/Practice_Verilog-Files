module DCT_2D(
    input [8*8-1:0] data_in,
    input control,
    output [6*12-1:0] data_out
);
    // Internal signals
    wire signed [8-1:0] x0, x1, x2, x3, x4, x5, x6, x7;    
    wire signed [18-1:0] z0, z1, z2, z3, z4, z5, z6, z7;     
    wire [10-1:0] c1, c2, c3, c4, c5, c6, c7;    
    assign x0 = data_in[8*8-1:8*7];
    assign x1 = data_in[8*7-1:8*6];
    assign x2 = data_in[8*6-1:8*5];
    assign x3 = data_in[8*5-1:8*4];
    assign x4 = data_in[8*4-1:8*3];
    assign x5 = data_in[8*3-1:8*2];
    assign x6 = data_in[8*2-1:8*1];
    assign x7 = data_in[8*1-1:8*0];
    // butterfly unit
    wire signed [9-1:0] P0; // x_0 + x_7
    wire signed [9-1:0] M0; // x_0 - x_7
    wire signed [9-1:0] P1; // x_1 + x_6
    wire signed [9-1:0] M1; // x_1 - x_6
    wire signed [9-1:0] P2; // x_2 + x_5
    wire signed [9-1:0] M2; // x_2 - x_5
    wire signed [9-1:0] P3; // x_3 + x_4
    wire signed [9-1:0] M3; // x_3 - x_4

    wire signed [10-1:0] PP0_3; // x_0 + x_7 + x_3 + x_4
    wire signed [10-1:0] PM0_3; // x_0 + x_7 - x_3 - x_4
    wire signed [10-1:0] PP1_2; // X_1 + x_6 + x_2 + x_5
    wire signed [10-1:0] PM1_2; // x_1 + x_6 - x_2 - x_5

    wire signed [11-1:0] PPP0_3_1_2; // x_0 + x_7 + x_3 + x_4 + x_1 + x_6 + x_2 + x_5
    wire signed [11-1:0] PPM0_3_1_2; // x_0 + x_7 + x_3 + x_4 - x_1 - x_6 - x_2 - x_5 
    // multiply unit
    wire signed [16-1:0] C0; 
    wire signed [17-1:0] C1;
    wire signed [17-1:0] C2;
    wire signed [16-1:0] C3;
    //bfu
    butterfly_8bit buf0(.C1(P0), .C2(M0), .a(x0), .b(x7));
    butterfly_8bit buf1(.C1(P1), .C2(M1), .a(x1), .b(x6));
    butterfly_8bit buf2(.C1(P2), .C2(M2), .a(x2), .b(x5));
    butterfly_8bit buf3(.C1(P3), .C2(M3), .a(x3), .b(x4));
    
    butterfly_9bit buf4(.C1(PP0_3), .C2(PM0_3), .a(P0), .b(P3));
    butterfly_9bit buf5(.C1(PP1_2), .C2(PM1_2), .a(P1), .b(P2));
    
    butterfly_10bit buf6(.C1(PPP0_3_1_2), .C2(PPM0_3_1_2), .a(PP0_3), .b(PP1_2));
    // multiply unit
    assign C0 = (M1 << 3) + (M1 << 4) + (M2 << 4) + (M3 << 2); 
    assign C1 = (PM0_3 << 5) + (PM1_2 << 4);
    assign C2 = (M0 << 3) + (M0 << 4) - (M3 << 4) - (M1 << 2);
    assign C3 = (M3 << 3) + (M3 << 4) + (M0 << 4) + (M2 << 2);
    // Z Results
    assign z0 = (PPP0_3_1_2) + (PPP0_3_1_2 << 2) + (PPP0_3_1_2 << 4) + (PPP0_3_1_2 << 5) + (PPP0_3_1_2 << 7);
    assign z1 = (M0 << 8) + C0 + (C0 << 3);
    assign z2 = C1 + (C1 << 1) + (C1 << 2);
    assign z3 = C2 + (C2 << 3) - (M2 << 8);
    assign z4 = (PPM0_3_1_2) + (PPM0_3_1_2 << 2) + (PPM0_3_1_2 << 4) + (PPM0_3_1_2 << 5) + (PPM0_3_1_2 << 7);
    assign z5 = C3 + (C3 << 3) - (M1 << 8);
    // overflow detection
    reg [12-1:0] z0_ov;
    reg [12-1:0] z1_ov;
    // z1 check
    always @(*) begin
        if ( z1[17] == 1'b0) begin
            if (z1[15] == 1'b1) begin // overflow
                z1_ov = 12'b0111_1111_1111;
            end
            else begin
                z1_ov = z1[15:4];
            end
        end else begin
            if (z1[15] == 1'b1) begin
                z1_ov = z1[15:4];
            end
            else begin      // overflow
                z1_ov = 12'b1000_0000_0000;
            end
        end
    end
    // if dc value calculation
    always @(*) begin
        if (control) begin
            z0_ov = z0[17:6];
        end
        else begin
            if ( z0[17] == 1'b0) begin
                if (z0[15] == 1'b1) begin
                    z0_ov = 12'b0111_1111_1111;
                end else begin
                    z0_ov = z0[15:4];
                end
            end
            else begin
                if (z0[15] == 1'b1) begin
                    z0_ov = z0[15:4];
                end else begin
                    z0_ov = 12'b1000_0000_0000;
                end
            end
        end
    end
    assign data_out = {z0_ov, z1_ov, z2[15:4], z3[15:4], z4[15:4], z5[15:4]};
endmodule