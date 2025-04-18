module multiplier_rca
(
	output [55:0]sum,
	input  [27:0]x, y
);
	wire [27:0]g0, g1, g2, g3, g4, g5, g6, g7, g8, g9, g10, g11, g12, g13, g14;
	wire [27:0]g15, g16, g17, g18, g19, g20, g21, g22, g23, g24, g25, g26, g27;
	wire [27:0]s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14;
	wire [27:0]s15, s16, s17, s18, s19, s20, s21, s22, s23, s24, s25, s26, s27;
	wire [27:0]c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14;
	wire [27:0]c15, c16, c17, c18, c19, c20, c21, c22, c23, c24, c25, c26, c27;
	//Ready stage
	partial_product_28bit PD0(.out(g0), .x(x), .y(y[0]));
	partial_product_28bit PD1(.out(g1), .x(x), .y(y[1]));
	assign sum[0] = g0[0];
	// First stage
	first_stage F0(.sum(s1), .c_out(c1), .a(g1), .b(g0[27:1]));
	// Middle stage
	assign sum[1] = s1[0];
	partial_product_28bit PD2(.out(g2), .x(x), .y(y[2]));
	middle_stage M0(.sum(s2), .c_out(c2), .a(g2), .c_in(c1), .b(s1[27:1]));
	assign sum[2] = s2[0];
	partial_product_28bit PD3(.out(g3), .x(x), .y(y[3]));
	middle_stage M1(.sum(s3), .c_out(c3), .a(g3), .c_in(c2), .b(s2[27:1]));
	assign sum[3] = s3[0];
	partial_product_28bit PD4(.out(g4), .x(x), .y(y[4]));
	middle_stage M2(.sum(s4), .c_out(c4), .a(g4), .c_in(c3), .b(s3[27:1]));
	assign sum[4] = s4[0];
	partial_product_28bit PD5(.out(g5), .x(x), .y(y[5]));
	middle_stage M3(.sum(s5), .c_out(c5), .a(g5), .c_in(c4), .b(s4[27:1]));
	assign sum[5] = s5[0];
	partial_product_28bit PD6(.out(g6), .x(x), .y(y[6]));
	middle_stage M4(.sum(s6), .c_out(c6), .a(g6), .c_in(c5), .b(s5[27:1]));
	assign sum[6] = s6[0];
	partial_product_28bit PD7(.out(g7), .x(x), .y(y[7]));
	middle_stage M5(.sum(s7), .c_out(c7), .a(g7), .c_in(c6), .b(s6[27:1]));
	assign sum[7] = s7[0];
	partial_product_28bit PD8(.out(g8), .x(x), .y(y[8]));
	middle_stage M6(.sum(s8), .c_out(c8), .a(g8), .c_in(c7), .b(s7[27:1]));
	assign sum[8] = s8[0];
	partial_product_28bit PD9(.out(g9), .x(x), .y(y[9]));
	middle_stage M7(.sum(s9), .c_out(c9), .a(g9), .c_in(c8), .b(s8[27:1]));
	assign sum[9] = s9[0];
	partial_product_28bit PD10(.out(g10), .x(x), .y(y[10]));
	middle_stage M8(.sum(s10), .c_out(c10), .a(g10), .c_in(c9), .b(s9[27:1]));
	assign sum[10] = s10[0];
	partial_product_28bit PD11(.out(g11), .x(x), .y(y[11]));
	middle_stage M9(.sum(s11), .c_out(c11), .a(g11), .c_in(c10), .b(s10[27:1]));
	assign sum[11] = s11[0];
	partial_product_28bit PD12(.out(g12), .x(x), .y(y[12]));
	middle_stage M10(.sum(s12), .c_out(c12), .a(g12), .c_in(c11), .b(s11[27:1]));
	assign sum[12] = s12[0];
	partial_product_28bit PD13(.out(g13), .x(x), .y(y[13]));
	middle_stage M11(.sum(s13), .c_out(c13), .a(g13), .c_in(c12), .b(s12[27:1]));
	assign sum[13] = s13[0];
	partial_product_28bit PD14(.out(g14), .x(x), .y(y[14]));
	middle_stage M12(.sum(s14), .c_out(c14), .a(g14), .c_in(c13), .b(s13[27:1]));
	assign sum[14] = s14[0];
	partial_product_28bit PD15(.out(g15), .x(x), .y(y[15]));
	middle_stage M13(.sum(s15), .c_out(c15), .a(g15), .c_in(c14), .b(s14[27:1]));
	assign sum[15] = s15[0];
	partial_product_28bit PD16(.out(g16), .x(x), .y(y[16]));
	middle_stage M14(.sum(s16), .c_out(c16), .a(g16), .c_in(c15), .b(s15[27:1]));
	assign sum[16] = s16[0];
	partial_product_28bit PD17(.out(g17), .x(x), .y(y[17]));
	middle_stage M15(.sum(s17), .c_out(c17), .a(g17), .c_in(c16), .b(s16[27:1]));
	assign sum[17] = s17[0];
	partial_product_28bit PD18(.out(g18), .x(x), .y(y[18]));
	middle_stage M16(.sum(s18), .c_out(c18), .a(g18), .c_in(c17), .b(s17[27:1]));
	assign sum[18] = s18[0];
	partial_product_28bit PD19(.out(g19), .x(x), .y(y[19]));
	middle_stage M17(.sum(s19), .c_out(c19), .a(g19), .c_in(c18), .b(s18[27:1]));
	assign sum[19] = s19[0];
	partial_product_28bit PD20(.out(g20), .x(x), .y(y[20]));
	middle_stage M18(.sum(s20), .c_out(c20), .a(g20), .c_in(c19), .b(s19[27:1]));
	assign sum[20] = s20[0];
	partial_product_28bit PD21(.out(g21), .x(x), .y(y[21]));
	middle_stage M19(.sum(s21), .c_out(c21), .a(g21), .c_in(c20), .b(s20[27:1]));
	assign sum[21] = s21[0];
	partial_product_28bit PD22(.out(g22), .x(x), .y(y[22]));
	middle_stage M20(.sum(s22), .c_out(c22), .a(g22), .c_in(c21), .b(s21[27:1]));
	assign sum[22] = s22[0];
	partial_product_28bit PD23(.out(g23), .x(x), .y(y[23]));
	middle_stage M21(.sum(s23), .c_out(c23), .a(g23), .c_in(c22), .b(s22[27:1]));
	assign sum[23] = s23[0];
	partial_product_28bit PD24(.out(g24), .x(x), .y(y[24]));
	middle_stage M22(.sum(s24), .c_out(c24), .a(g24), .c_in(c23), .b(s23[27:1]));
	assign sum[24] = s24[0];
	partial_product_28bit PD25(.out(g25), .x(x), .y(y[25]));
	middle_stage M23(.sum(s25), .c_out(c25), .a(g25), .c_in(c24), .b(s24[27:1]));
	assign sum[25] = s25[0];
	partial_product_28bit PD26(.out(g26), .x(x), .y(y[26]));
	middle_stage M24(.sum(s26), .c_out(c26), .a(g26), .c_in(c25), .b(s25[27:1]));
	assign sum[26] = s26[0];
	partial_product_28bit PD27(.out(g27), .x(x), .y(y[27]));
	middle_stage M25(.sum(s27), .c_out(c27), .a(g27), .c_in(c26), .b(s26[27:1]));
	assign sum[27] = s27[0];
	//Final stage
	rca_last_stage L0(.sum(sum[55:28]), .a(c27), .b(s27[27:1]));
endmodule	

module multiplier_rca_DFF
(
	output [55:0]mul,
	input [27:0]a, b,
	input clk, rstn
);
	wire [27:0]a_q, b_q;
	wire [55:0]sum_d;
	DFF_28bit DFF0(.q(a_q), .d(a), .clk(clk), .rstn(rstn));
    	DFF_28bit DFF1(.q(b_q), .d(b), .clk(clk), .rstn(rstn));
	multiplier_rca M0(.sum(sum_d), .x(a_q), .y(b_q));
	DFF_56bit DFF2(.q(mul), .d(sum_d), .clk(clk), .rstn(rstn));
endmodule




