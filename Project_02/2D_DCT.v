module DCT_2D(
    input [8*10-1:0] data_in,
    input control,
    output [8*12-1:0] data_out
);
    // Internal signals
    wire signed [10-1:0] x0, x1, x2, x3, x4, x5, x6, x7;    // 
    wire signed [21-1:0] z0, z1, z2, z3, z4, z5, z6, z7;    // 
    wire signed [10-1:0] c1, c2, c3, c4, c5, c6, c7;    // 10.9
    assign x0 = data_in[79:70];
    assign x1 = data_in[69:60];
    assign x2 = data_in[59:50];
    assign x3 = data_in[49:40];
    assign x4 = data_in[39:30];
    assign x5 = data_in[29:20];
    assign x6 = data_in[19:10];
    assign x7 = data_in[9:0];
    // Constants for DCT
    
    assign c1 = {1'b0, 8'hfb, 1'b0};
    assign c3 = {1'b0, 8'hd5, 1'b0};
    assign c4 = {1'b0, 8'hb5, 1'b0};
    assign c5 = {1'b0, 8'h8e, 1'b0};
    assign c6 = {1'b0, 8'h62, 1'b0};
    assign c2 = {1'b0, 8'hed, 1'b0};
    assign c7 = {1'b0, 8'h32, 1'b0};

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
        if ( z1[20] == 1'b0) begin
            if (z1[18] == 1'b1) begin // overflow
                z1_ov = 12'b0111_1111_1111;
            end
            else begin
                z1_ov = z1[18:7];
            end
        end else begin
            if (z1[18] == 1'b1) begin
                z1_ov = z1[18:7];
            end
            else begin      // overflow
                z1_ov = 12'b1000_0000_0000;
            end
        end
    end
    // if dc value calculation
    always @(*) begin
        if (control) begin
            z0_ov = z0[20:9];
        end
        else begin
            if ( z0[20] == 1'b0) begin
                if (z0[18] == 1'b1) begin
                    z0_ov = 12'b0111_1111_1111;
                end else begin
                    z0_ov = z0[18:7];
                end
            end
            else begin
                if (z0[18] == 1'b1) begin
                    z0_ov = z0[18:7];
                end else begin
                    z0_ov = 12'b1000_0000_0000;
                end
            end
        end
    end
    
    assign data_out = {z0_ov, z1_ov, z2[18:7], z3[18:7], z4[18:7], z5[18:7], z6[18:7], z7[18:7]};
endmodule