module DCT_1D (
    input [64-1:0] data_in,
    output [8*8-1:0] data_out
);
    // Internal signals
    wire [19-1:0] z0, z1, z2, z3, z4, z5, z6, z7; // 18bit maximum
    wire [8-1:0] c1, c2, c3, c4, c5, c6, c7; // 9.8
    wire [8-1:0] x_0, x_1, x_2, x_3, x_4, x_5, x_6, x_7;
    // Constants for DCT
    assign c1 = {8'h7e};
    assign c2 = {8'h76};
    assign c3 = {8'h6a};
    assign c4 = {8'h5b};
    assign c5 = {8'h47};
    assign c6 = {8'h31};
    assign c7 = {8'h19};
    // sign extension
    assign x_0 = {data_in[63:56]};
    assign x_1 = {data_in[55:48]};
    assign x_2 = {data_in[47:40]};
    assign x_3 = {data_in[39:32]};
    assign x_4 = {data_in[31:24]};
    assign x_5 = {data_in[23:16]};
    assign x_6 = {data_in[15:8]};
    assign x_7 = {data_in[7:0]};
    // 10.9
    assign z0 = c4 * (x_0 + x_7 + x_3 + x_4 + x_1 + x_6 + x_2 + x_5);
    assign z1 = c1 * (x_0 - x_7) + c3 * (x_1-x_6) + c5 * (x_2 - x_5) + c7 * (x_3 - x_4);
    assign z2 = c2 * (x_0 + x_7 - x_3 - x_4) + c6 * (x_1 + x_6 - x_2 - x_5);
    assign z3 = c3 * (x_0 - x_7) - c7 * (x_1 - x_6) - c1 * (x_2 - x_5) -c5 * (x_3 - x_4);
    assign z4 = c4 * (x_0 + x_7 + x_3 + x_4 - x_1 - x_6 - x_2 - x_5);
    assign z5 = c5 * (x_0 - x_7) - c1 * (x_1 - x_6) + c7 * (x_2 - x_5) + c3 * (x_3 - x_4);
    assign z6 = c6 * (x_0 + x_7 - x_3 - x_4) - c2 * (x_1 + x_6 - x_2 - x_5);
    assign z7 = c7 * (x_0 - x_7) - c5 * (x_1 - x_6) + c3 * (x_2 - x_5) - c1 * (x_3 - x_4);
    assign data_out = { z0[18:11], z1[18:11], z2[18:11], z3[18:11], z4[18:11], z5[18:11], z6[18:11], z7[18:11] };
endmodule
