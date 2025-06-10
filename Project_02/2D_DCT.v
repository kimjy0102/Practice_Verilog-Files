module DCT_2D(
    input [8*8-1:0] data_in,
    input control,
    output [8*12-1:0] data_out
);
    // Internal signals
    wire signed [8-1:0] x0, x1, x2, x3, x4, x5, x6, x7;    // 
    wire signed [19-1:0] z0, z1, z2, z3, z4, z5, z6, z7;    // 
    wire signed [8-1:0] c1, c2, c3, c4, c5, c6, c7;    // 9.9
    assign x0 = data_in[8*8-1:8*7];
    assign x1 = data_in[8*7-1:8*6];
    assign x2 = data_in[8*6-1:8*5];
    assign x3 = data_in[8*5-1:8*4];
    assign x4 = data_in[8*4-1:8*3];
    assign x5 = data_in[8*3-1:8*2];
    assign x6 = data_in[8*2-1:8*1];
    assign x7 = data_in[8*1-1:8*0];
    // Constants for DCT
    
    assign c1 = {8'h7e};
    assign c2 = {8'h76};
    assign c3 = {8'h6a};
    assign c4 = {8'h5b};
    assign c5 = {8'h47};
    assign c6 = {8'h31};
    assign c7 = {8'h19};

    assign z0 = c4 * (x0 + x7 + x3 + x4 + x1 + x6 + x2 + x5);
    assign z1 = c1 * (x0 - x7) + c3 * (x1-x6) + c5 * (x2 - x5) + c7 * (x3 - x4);
    assign z2 = c2 * (x0 + x7 - x3 - x4) + c6 * (x1 + x6 - x2 - x5);
    assign z3 = c3 * (x0 - x7) - c7 * (x1 - x6) - c1 * (x2 - x5) -c5 * (x3 - x4);
    assign z4 = c4 * (x0 + x7 + x3 + x4 - x1 - x6 - x2 - x5);
    assign z5 = c5 * (x0 - x7) - c1 * (x1 - x6) + c7 * (x2 - x5) + c3 * (x3 - x4);
    assign z6 = c6 * (x0 + x7 - x3 - x4) - c2 * (x1 + x6 - x2 - x5);
    assign z7 = c7 * (x0 - x7) - c5 * (x1 - x6) + c3 * (x2 - x5) - c1 * (x3 - x4);
    // overflow detection
    reg [12-1:0] z0_ov;
    reg [12-1:0] z1_ov;
    // z1 check
    always @(*) begin
        if ( z1[18] == 1'b0) begin
            if (z1[14] == 1'b1) begin // overflow
                z1_ov = 12'b0111_1111_1111;
            end
            else begin
                z1_ov = z1[14:3];
            end
        end else begin
            if (z1[14] == 1'b1) begin
                z1_ov = z1[14:3];
            end
            else begin      // overflow
                z1_ov = 12'b1000_0000_0000;
            end
        end
    end
    // if dc value calculation
    always @(*) begin
        if (control) begin
            z0_ov = z0[16:5];
        end
        else begin
            if ( z0[18] == 1'b0) begin
                if (z0[14] == 1'b1) begin
                    z0_ov = 12'b0111_1111_1111;
                end else begin
                    z0_ov = z0[14:3];
                end
            end
            else begin
                if (z0[14] == 1'b1) begin
                    z0_ov = z0[14:3];
                end else begin
                    z0_ov = 12'b1000_0000_0000;
                end
            end
        end
    end
    
    assign data_out = {z0_ov, z1_ov, z2[14:3], z3[14:3], z4[14:3], z5[14:3], z6[14:3], z7[14:3]};
endmodule