module DCT_1D (
    input [64-1:0] data_in,
    output [80-1:0] data_out
);
    // Internal signals
    wire [8-1:0] x0, x1, x2, x3, x4, x5, x6, x7;
    // input 8, 0  & coefffcients : 10 -> 8 + 10 = 18 & 8 number -> 18 + 3 -> 21
    wire [21-1:0] z0, z1, z2, z3, z4, z5, z6, z7;
    wire [10-1:0] c1, c2, c3, c4, c5, c6, c7;
    wire [9-1:0] x_0, x_1, x_2, x_3, x_4, x_5, x_6, x_7;
    // Constants for DCT
    assign c1 = {1'b0, 8'hfb, 1'b0};
    assign c3 = {1'b0, 8'hd5, 1'b0};
    assign c4 = {1'b0, 8'hb5, 1'b0};
    assign c5 = {1'b0, 8'h8e, 1'b0};
    assign c6 = {1'b0, 8'h62, 1'b0};
    assign c2 = {1'b0, 8'hed, 1'b0};
    assign c7 = {1'b0, 8'h32, 1'b0};
    // sign extension
    assign x_0 = {1'b0, data_in[63:56]};
    assign x_1 = {1'b0, data_in[55:48]};
    assign x_2 = {1'b0, data_in[47:40]};
    assign x_3 = {1'b0, data_in[39:32]};
    assign x_4 = {1'b0, data_in[31:24]};
    assign x_5 = {1'b0, data_in[23:16]};
    assign x_6 = {1'b0, data_in[15:8]};
    assign x_7 = {1'b0, data_in[7:0]};
    // 10.9
    assign z0 = c4 * (x_0 + x_7 + x_3 + x_4 + x_1 + x_6 + x_2 + x_5);
    assign z1 = c1 * (x_0 - x_7) + c3 * (x_1-x_6) + c5 * (x_2 - x_5) + c7 * (x_3 - x_4);
    assign z2 = c2 * (x_0 + x_7 - x_3 - x_4) + c6 * (x_1 + x_6 - x_2 - x_5);
    assign z3 = c3 * (x_0 - x_7) - c7 * (x_1 - x_6) - c1 * (x_2 - x_5) -c5 * (x_3 - x_4);
    assign z4 = c4 * (x_0 + x_7 + x_3 + x_4 - x_1 - x_6 - x_2 - x_5);
    assign z5 = c5 * (x_0 - x_7) - c1 * (x_1 - x_6) + c7 * (x_2 - x_5) + c3 * (x_3 - x_4);
    assign z6 = c6 * (x_0 + x_7 - x_3 - x_4) - c2 * (x_1 + x_6 - x_2 - x_5);
    assign z7 = c7 * (x_0 - x_7) - c5 * (x_1 - x_6) + c3 * (x_2 - x_5) - c1 * (x_3 - x_4);
    assign data_out = { z0[20:11], z1[20:11], z2[20:11], z3[20:11], z4[20:11], z5[20:11], z6[20:11], z7[20:11] };
endmodule
