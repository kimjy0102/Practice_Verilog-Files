module carry_select_adder_2bit(
			sum, c_out,
			a, b, c_in, c_in_0, c_in_1);
		output [1:0] sum;
		output c_out;
		input [1:0] a, b;
		input c_in, c_in_0, c_in_1;
		wire [2:0] out;
		wire w1, w2;
		wire [2:0] sum_zero, sum_one;
		full_adder_1bit a0(.sum(sum_zero[0]), .c_out(w1), .a(a[0]), .b(b[0]), .c_in(c_in_0));
		full_adder_1bit a1(.sum(sum_zero[1]), .c_out(sum_zero[2]), .a(a[1]), .b(b[1]), .c_in(w1));

		full_adder_1bit a2(.sum(sum_one[0]), .c_out(w2), .a(a[0]), .b(b[0]), .c_in(c_in_1));
		full_adder_1bit a3(.sum(sum_one[1]), .c_out(sum_one[2]), .a(a[1]), .b(b[1]), .c_in(w2));
		mux_2to1_3bit m0(.out(out), .carry_zero(sum_zero), .carry_one(sum_one), .sel(c_in));
		assign sum = out[1:0];
		assign c_out = out[2];
endmodule

module carry_select_adder_3bit(
			sum, c_out,
			a, b, c_in, c_in_0, c_in_1);
		output [2:0] sum;
		output c_out;
		input [2:0] a, b;
		input c_in, c_in_0, c_in_1;
		wire [3:0] out;
		wire w1, w2, w3, w4;
		wire [3:0] sum_zero, sum_one;
		full_adder_1bit a0(.sum(sum_zero[0]), .c_out(w1), .a(a[0]), .b(b[0]), .c_in(c_in_0));
		full_adder_1bit a1(.sum(sum_zero[1]), .c_out(w2), .a(a[1]), .b(b[1]), .c_in(w1));
		full_adder_1bit a2(.sum(sum_zero[2]), .c_out(sum_zero[3]), .a(a[2]), .b(b[2]), .c_in(w2));

		full_adder_1bit a3(.sum(sum_one[0]), .c_out(w3), .a(a[0]), .b(b[0]), .c_in(c_in_1));
		full_adder_1bit a4(.sum(sum_one[1]), .c_out(w4), .a(a[1]), .b(b[1]), .c_in(w3));
		full_adder_1bit a5(.sum(sum_one[2]), .c_out(sum_one[3]), .a(a[2]), .b(b[2]), .c_in(w4));
		mux_2to1_4bit m0(.out(out), .carry_zero(sum_zero), .carry_one(sum_one), .sel(c_in));
		assign sum = out[2:0];
		assign c_out = out[3];
endmodule

module carry_select_adder_4bit(
			sum, c_out,
			a, b, c_in, c_in_0, c_in_1);
		output [3:0] sum;
		output c_out;
		input [3:0] a, b;
		input c_in, c_in_0, c_in_1;
		wire [4:0] out;
		wire w1, w2, w3, w4, w5, w6;
		wire [4:0] sum_zero, sum_one;
		full_adder_1bit a0(.sum(sum_zero[0]), .c_out(w1), .a(a[0]), .b(b[0]), .c_in(c_in_0));
		full_adder_1bit a1(.sum(sum_zero[1]), .c_out(w2), .a(a[1]), .b(b[1]), .c_in(w1));
		full_adder_1bit a2(.sum(sum_zero[2]), .c_out(w3), .a(a[2]), .b(b[2]), .c_in(w2));
		full_adder_1bit a3(.sum(sum_zero[3]), .c_out(sum_zero[4]), .a(a[3]), .b(b[3]), .c_in(w3));

		full_adder_1bit a4(.sum(sum_one[0]), .c_out(w4), .a(a[0]), .b(b[0]), .c_in(c_in_1));
		full_adder_1bit a5(.sum(sum_one[1]), .c_out(w5), .a(a[1]), .b(b[1]), .c_in(w4));
		full_adder_1bit a6(.sum(sum_one[2]), .c_out(w6), .a(a[2]), .b(b[2]), .c_in(w5));
		full_adder_1bit a7(.sum(sum_one[3]), .c_out(sum_one[4]), .a(a[3]), .b(b[3]), .c_in(w6));
		mux_2to1_5bit m0(.out(out), .carry_zero(sum_zero), .carry_one(sum_one), .sel(c_in));
		assign sum = out[3:0];
		assign c_out = out[4];
endmodule

module carry_select_adder_5bit(
			sum, c_out,
			a, b, c_in, c_in_0, c_in_1);
		output [4:0] sum;
		output c_out;
		input [4:0] a, b;
		input c_in, c_in_0, c_in_1;
		wire [5:0] out;
		wire w1, w2, w3, w4, w5 ,w6, w7, w8;
		wire [5:0] sum_zero, sum_one;
		full_adder_1bit a0(.sum(sum_zero[0]), .c_out(w1), .a(a[0]), .b(b[0]), .c_in(c_in_0));
		full_adder_1bit a1(.sum(sum_zero[1]), .c_out(w2), .a(a[1]), .b(b[1]), .c_in(w1));
		full_adder_1bit a2(.sum(sum_zero[2]), .c_out(w3), .a(a[2]), .b(b[2]), .c_in(w2));
		full_adder_1bit a3(.sum(sum_zero[3]), .c_out(w4), .a(a[3]), .b(b[3]), .c_in(w3));
		full_adder_1bit a4(.sum(sum_zero[4]), .c_out(sum_zero[5]), .a(a[4]), .b(b[4]), .c_in(w4));

		full_adder_1bit a5(.sum(sum_one[0]), .c_out(w5), .a(a[0]), .b(b[0]), .c_in(c_in_1));
		full_adder_1bit a6(.sum(sum_one[1]), .c_out(w6), .a(a[1]), .b(b[1]), .c_in(w5));
		full_adder_1bit a7(.sum(sum_one[2]), .c_out(w7), .a(a[2]), .b(b[2]), .c_in(w6));
		full_adder_1bit a8(.sum(sum_one[3]), .c_out(w8), .a(a[3]), .b(b[3]), .c_in(w7));
		full_adder_1bit a9(.sum(sum_one[4]), .c_out(sum_one[5]), .a(a[4]), .b(b[4]), .c_in(w8));
		mux_2to1_6bit m0(.out(out), .carry_zero(sum_zero), .carry_one(sum_one), .sel(c_in));
		assign sum = out[4:0];
		assign c_out = out[5];
endmodule

module carry_select_adder_6bit(
			sum, c_out,
			a, b, c_in, c_in_0, c_in_1);
		output [5:0] sum;
		output c_out;
		input [5:0] a, b;
		input c_in, c_in_0, c_in_1;
		wire [6:0] out;
		wire w1, w2, w3, w4, w5, w6, w7, w8, w9, w10;
		wire [6:0] sum_zero, sum_one;
		full_adder_1bit a0(.sum(sum_zero[0]), .c_out(w1), .a(a[0]), .b(b[0]), .c_in(c_in_0));
		full_adder_1bit a1(.sum(sum_zero[1]), .c_out(w2), .a(a[1]), .b(b[1]), .c_in(w1));
		full_adder_1bit a2(.sum(sum_zero[2]), .c_out(w3), .a(a[2]), .b(b[2]), .c_in(w2));
		full_adder_1bit a3(.sum(sum_zero[3]), .c_out(w4), .a(a[3]), .b(b[3]), .c_in(w3));
		full_adder_1bit a4(.sum(sum_zero[4]), .c_out(w5), .a(a[4]), .b(b[4]), .c_in(w4));
		full_adder_1bit a5(.sum(sum_zero[5]), .c_out(sum_zero[6]), .a(a[5]), .b(b[5]), .c_in(w5));

		full_adder_1bit a6(.sum(sum_one[0]), .c_out(w6), .a(a[0]), .b(b[0]), .c_in(c_in_1));
		full_adder_1bit a7(.sum(sum_one[1]), .c_out(w7), .a(a[1]), .b(b[1]), .c_in(w6));
		full_adder_1bit a8(.sum(sum_one[2]), .c_out(w8), .a(a[2]), .b(b[2]), .c_in(w7));
		full_adder_1bit a9(.sum(sum_one[3]), .c_out(w9), .a(a[3]), .b(b[3]), .c_in(w8));
		full_adder_1bit a10(.sum(sum_one[4]), .c_out(w10), .a(a[4]), .b(b[4]), .c_in(w9));
		full_adder_1bit a11(.sum(sum_one[5]), .c_out(sum_one[6]), .a(a[5]), .b(b[5]), .c_in(w10));
		mux_2to1_7bit m0(.out(out), .carry_zero(sum_zero), .carry_one(sum_one), .sel(c_in));
		assign sum = out[5:0];
		assign c_out = out[6];
endmodule

module carry_select_adder_7bit(
			sum, c_out,
			a, b, c_in, c_in_0, c_in_1);
		output [6:0] sum;
		output c_out;
		input [6:0] a, b;
		input c_in, c_in_0, c_in_1;
		wire [7:0] out;
		wire w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12;
		wire [7:0] sum_zero, sum_one;
		full_adder_1bit a0(.sum(sum_zero[0]), .c_out(w1), .a(a[0]), .b(b[0]), .c_in(c_in_0));
		full_adder_1bit a1(.sum(sum_zero[1]), .c_out(w2), .a(a[1]), .b(b[1]), .c_in(w1));
		full_adder_1bit a2(.sum(sum_zero[2]), .c_out(w3), .a(a[2]), .b(b[2]), .c_in(w2));
		full_adder_1bit a3(.sum(sum_zero[3]), .c_out(w4), .a(a[3]), .b(b[3]), .c_in(w3));
		full_adder_1bit a4(.sum(sum_zero[4]), .c_out(w5), .a(a[4]), .b(b[4]), .c_in(w4));
		full_adder_1bit a5(.sum(sum_zero[5]), .c_out(w6), .a(a[5]), .b(b[5]), .c_in(w5));
		full_adder_1bit a6(.sum(sum_zero[6]), .c_out(sum_zero[7]), .a(a[6]), .b(b[6]), .c_in(w6));

		full_adder_1bit a7(.sum(sum_one[0]), .c_out(w7), .a(a[0]), .b(b[0]), .c_in(c_in_1));
		full_adder_1bit a8(.sum(sum_one[1]), .c_out(w8), .a(a[1]), .b(b[1]), .c_in(w7));
		full_adder_1bit a9(.sum(sum_one[2]), .c_out(w9), .a(a[2]), .b(b[2]), .c_in(w8));
		full_adder_1bit a10(.sum(sum_one[3]), .c_out(w10), .a(a[3]), .b(b[3]), .c_in(w9));
		full_adder_1bit a11(.sum(sum_one[4]), .c_out(w11), .a(a[4]), .b(b[4]), .c_in(w10));
		full_adder_1bit a12(.sum(sum_one[5]), .c_out(w12), .a(a[5]), .b(b[5]), .c_in(w11));
		full_adder_1bit a13(.sum(sum_one[6]), .c_out(sum_one[7]), .a(a[6]), .b(b[6]), .c_in(w12));
		mux_2to1_8bit m0(.out(out), .carry_zero(sum_zero), .carry_one(sum_one), .sel(c_in));
		assign sum = out[6:0];
		assign c_out = out[7];
endmodule
