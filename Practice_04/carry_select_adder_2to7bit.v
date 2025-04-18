module carry_select_adder_2bit(
			sum, c_out,
			a, b, clk, rstn, c_in, c_in_0, c_in_1);
		output [1:0] sum;
		output c_out;
		input [1:0] a, b;
		input clk, rstn, c_in, c_in_0, c_in_1;
		wire [2:0] out;
		wire [1:0] sum_d;
		wire w1, w2;
		wire [2:0] sum_zero, sum_one;
		full_adder a0(.sum(sum_zero[0]), .c_out(w1), .a(a[0]), .b(b[0]), .c_in(c_in_0));
		full_adder a1(.sum(sum_zero[1]), .c_out(sum_zero[2]), .a(a[1]), .b(b[1]), .c_in(w1));

		full_adder a2(.sum(sum_one[0]), .c_out(w2), .a(a[0]), .b(b[0]), .c_in(c_in_1));
		full_adder a3(.sum(sum_one[1]), .c_out(sum_one[2]), .a(a[1]), .b(b[1]), .c_in(w2));
		mux_2to1_3bit m0(.out(out), .carry_zero(sum_zero), .carry_one(sum_one), .sel(c_in));
		// DFF after mux
		DFF_2bit DFF0(.q(sum), .d(sum_d), .clk(clk), .rstn(rstn));
		assign sum_d = out[1:0];
		assign c_out = out[2];
endmodule

module carry_select_adder_3bit(
			sum, c_out,
			a, b, clk, rstn, c_in, c_in_0, c_in_1);
		output [2:0] sum;
		output c_out;
		input [2:0] a, b;
		input clk, rstn, c_in, c_in_0, c_in_1;
		wire [3:0] out;
		wire [2:0] sum_d;
		wire w1, w2, w3, w4;
		wire [3:0] sum_zero, sum_one;
		full_adder a0(.sum(sum_zero[0]), .c_out(w1), .a(a[0]), .b(b[0]), .c_in(c_in_0));
		full_adder a1(.sum(sum_zero[1]), .c_out(w2), .a(a[1]), .b(b[1]), .c_in(w1));
		full_adder a2(.sum(sum_zero[2]), .c_out(sum_zero[3]), .a(a[2]), .b(b[2]), .c_in(w2));

		full_adder a3(.sum(sum_one[0]), .c_out(w3), .a(a[0]), .b(b[0]), .c_in(c_in_1));
		full_adder a4(.sum(sum_one[1]), .c_out(w4), .a(a[1]), .b(b[1]), .c_in(w3));
		full_adder a5(.sum(sum_one[2]), .c_out(sum_one[3]), .a(a[2]), .b(b[2]), .c_in(w4));
		mux_2to1_4bit m0(.out(out), .carry_zero(sum_zero), .carry_one(sum_one), .sel(c_in));
		// DFF after mux
		DFF_3bit DFF0(.q(sum), .d(sum_d), .clk(clk), .rstn(rstn));
		assign sum_d = out[2:0];
		assign c_out = out[3];
endmodule

module carry_select_adder_4bit(
			sum, c_out,
			a, b, clk, rstn, c_in, c_in_0, c_in_1);
		output [3:0] sum;
		output c_out;
		input [3:0] a, b;
		input clk, rstn, c_in, c_in_0, c_in_1;
		wire [4:0] out;
		wire w1, w2, w3, w4, w5, w6, c_q;
		wire [4:0] sum_zero, sum_one, sum_zero_q, sum_one_q;
		// 1bit DFF for c_in
		DFF_1bit DFF0(.q(c_q), .d(c_in), .clk(clk), .rstn(rstn));
		full_adder a0(.sum(sum_zero[0]), .c_out(w1), .a(a[0]), .b(b[0]), .c_in(c_in_0));
		full_adder a1(.sum(sum_zero[1]), .c_out(w2), .a(a[1]), .b(b[1]), .c_in(w1));
		full_adder a2(.sum(sum_zero[2]), .c_out(w3), .a(a[2]), .b(b[2]), .c_in(w2));
		full_adder a3(.sum(sum_zero[3]), .c_out(sum_zero[4]), .a(a[3]), .b(b[3]), .c_in(w3));
		//DFF for first result
		DFF_5bit DFF1(.q(sum_zero_q), .d(sum_zero), .clk(clk), .rstn(rstn));
		full_adder a4(.sum(sum_one[0]), .c_out(w4), .a(a[0]), .b(b[0]), .c_in(c_in_1));
		full_adder a5(.sum(sum_one[1]), .c_out(w5), .a(a[1]), .b(b[1]), .c_in(w4));
		full_adder a6(.sum(sum_one[2]), .c_out(w6), .a(a[2]), .b(b[2]), .c_in(w5));
		full_adder a7(.sum(sum_one[3]), .c_out(sum_one[4]), .a(a[3]), .b(b[3]), .c_in(w6));
		//DFF for second result
		DFF_5bit DFF2(.q(sum_one_q), .d(sum_one), .clk(clk), .rstn(rstn));
		mux_2to1_5bit m0(.out(out), .carry_zero(sum_zero_q), .carry_one(sum_one_q), .sel(c_q));
		assign sum = out[3:0];
		assign c_out = out[4];
endmodule

module carry_select_adder_5bit(
			sum, c_out,
			a, b, clk, rstn, c_in, c_in_0, c_in_1);
		output [4:0] sum;
		output c_out;
		input [4:0] a, b;
		input clk, rstn, c_in, c_in_0, c_in_1;
		wire [5:0] out;
		wire w1, w2, w3, w4, w5 ,w6, w7, w8, a_q, b_q, c_q0, c_q1;
		wire [5:0] sum_zero, sum_one;
		wire [3:0] sum_zero_d, sum_one_d;
		// input 1bit DFFs
		DFF_1bit DFF0(.q(a_q), .d(a[4]), .clk(clk), .rstn(rstn));
		DFF_1bit DFF1(.q(b_q), .d(b[4]), .clk(clk), .rstn(rstn));

		full_adder a0(.sum(sum_zero_d[0]), .c_out(w1), .a(a[0]), .b(b[0]), .c_in(c_in_0));
		full_adder a1(.sum(sum_zero_d[1]), .c_out(w2), .a(a[1]), .b(b[1]), .c_in(w1));
		full_adder a2(.sum(sum_zero_d[2]), .c_out(w3), .a(a[2]), .b(b[2]), .c_in(w2));
		full_adder a3(.sum(sum_zero_d[3]), .c_out(w4), .a(a[3]), .b(b[3]), .c_in(w3));
		// 4bit DFF for zero_out
		DFF_4bit DFF3(.q(sum_zero[3:0]), .d(sum_zero_d), .clk(clk), .rstn(rstn));
		// 1bit DFF for c_in
		DFF_1bit DFF2(.q(c_q0), .d(w4), .clk(clk), .rstn(rstn));
		full_adder a4(.sum(sum_zero[4]), .c_out(sum_zero[5]), .a(a_q), .b(b_q), .c_in(c_q0));
	
		full_adder a5(.sum(sum_one_d[0]), .c_out(w5), .a(a[0]), .b(b[0]), .c_in(c_in_1));
		full_adder a6(.sum(sum_one_d[1]), .c_out(w6), .a(a[1]), .b(b[1]), .c_in(w5));
		full_adder a7(.sum(sum_one_d[2]), .c_out(w7), .a(a[2]), .b(b[2]), .c_in(w6));
		full_adder a8(.sum(sum_one_d[3]), .c_out(w8), .a(a[3]), .b(b[3]), .c_in(w7));
		// 4bit DFF for one_out
		DFF_4bit DFF4(.q(sum_one[3:0]), .d(sum_one_d), .clk(clk), .rstn(rstn));
		// 1bit DFF for c_in
		DFF_1bit DFF(.q(c_q1), .d(w8), .clk(clk), .rstn(rstn));
		full_adder a9(.sum(sum_one[4]), .c_out(sum_one[5]), .a(a_q), .b(b_q), .c_in(c_q1));

		mux_2to1_6bit m0(.out(out), .carry_zero(sum_zero), .carry_one(sum_one), .sel(c_in));
		assign sum = out[4:0];
		assign c_out = out[5];
endmodule

module carry_select_adder_6bit(
			sum, c_out,
			a, b, clk, rstn, c_in, c_in_0, c_in_1);
		output [5:0] sum;
		output c_out;
		input [5:0] a, b;
		input clk, rstn, c_in, c_in_0, c_in_1;
		wire [6:0] out;
		wire w1, w2, w3, w4, w5, w6, w7, w8, w9, w10;
		wire [1:0] a_q, b_q, c_q;
		wire [6:0] sum_zero, sum_one;
		wire [3:0] sum_zero_d, sum_one_d;
		// input 2bit DFFs
		DFF_2bit DFF0(.q(a_q), .d(a[5:4]), .clk(clk), .rstn(rstn));
		DFF_2bit DFF1(.q(b_q),. d(b[5:4]), .clk(clk), .rstn(rstn));
		full_adder a0(.sum(sum_zero_d[0]), .c_out(w1), .a(a[0]), .b(b[0]), .c_in(c_in_0));
		full_adder a1(.sum(sum_zero_d[1]), .c_out(w2), .a(a[1]), .b(b[1]), .c_in(w1));
		full_adder a2(.sum(sum_zero_d[2]), .c_out(w3), .a(a[2]), .b(b[2]), .c_in(w2));
		full_adder a3(.sum(sum_zero_d[3]), .c_out(w4), .a(a[3]), .b(b[3]), .c_in(w3));
		// 4bit DFF for zero_out
		DFF_4bit DFF2(.q(sum_zero[3:0]), .d(sum_zero_d), .clk(clk), .rstn(rstn));
		// 1bit DFF for c_in
		DFF_1bit DFF4(.q(c_q[0]), .d(w4), .clk(clk), .rstn(rstn));
		full_adder a4(.sum(sum_zero[4]), .c_out(w5), .a(a_q[0]), .b(b_q[0]), .c_in(c_q[0]));
		full_adder a5(.sum(sum_zero[5]), .c_out(sum_zero[6]), .a(a_q[1]), .b(b_q[1]), .c_in(w5));

		full_adder a6(.sum(sum_one_d[0]), .c_out(w6), .a(a[0]), .b(b[0]), .c_in(c_in_1));
		full_adder a7(.sum(sum_one_d[1]), .c_out(w7), .a(a[1]), .b(b[1]), .c_in(w6));
		full_adder a8(.sum(sum_one_d[2]), .c_out(w8), .a(a[2]), .b(b[2]), .c_in(w7));
		full_adder a9(.sum(sum_one_d[3]), .c_out(w9), .a(a[3]), .b(b[3]), .c_in(w8));
		// 4bit DFF for one_out
		DFF_4bit DFF3(.q(sum_one[3:0]), .d(sum_one_d),. clk(clk), .rstn(rstn));
		// 1bit DFF for c_in
		DFF_1bit DFF5(.q(c_q[1]), .d(w9), .clk(clk), .rstn(rstn));
		full_adder a10(.sum(sum_one[4]), .c_out(w10), .a(a_q[0]), .b(b_q[0]), .c_in(c_q[1]));
		full_adder a11(.sum(sum_one[5]), .c_out(sum_one[6]), .a(a_q[1]), .b(b_q[1]), .c_in(w10));

		mux_2to1_7bit m0(.out(out), .carry_zero(sum_zero), .carry_one(sum_one), .sel(c_in));
		assign sum = out[5:0];
		assign c_out = out[6];
endmodule
