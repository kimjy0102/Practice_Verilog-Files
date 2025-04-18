module full_adder_14bit(
			sum, c_out,
			a, b, c_in);
		output [13:0] sum;
		output c_out;
		input [13:0] a, b;
		input c_in;
				
		wire w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13;

		full_adder a0(.sum(sum[0]), .c_out(w1), .a(a[0]), .b(b[0]), .c_in(c_in));
		full_adder a1(.sum(sum[1]), .c_out(w2), .a(a[1]), .b(b[1]), .c_in(w1));
		full_adder a2(.sum(sum[2]), .c_out(w3), .a(a[2]), .b(b[2]), .c_in(w2));
		full_adder a3(.sum(sum[3]), .c_out(w4), .a(a[3]), .b(b[3]), .c_in(w3));
		full_adder a4(.sum(sum[4]), .c_out(w5), .a(a[4]), .b(b[4]), .c_in(w4));
		full_adder a5(.sum(sum[5]), .c_out(w6), .a(a[5]), .b(b[5]), .c_in(w5));
		full_adder a6(.sum(sum[6]), .c_out(w7), .a(a[6]), .b(b[6]), .c_in(w6));
		full_adder a7(.sum(sum[7]), .c_out(w8), .a(a[7]), .b(b[7]), .c_in(w7));
		full_adder a8(.sum(sum[8]), .c_out(w9), .a(a[8]), .b(b[8]), .c_in(w8)); 
		full_adder a9(.sum(sum[9]), .c_out(w10), .a(a[9]), .b(b[9]), .c_in(w9));
		full_adder a10(.sum(sum[10]), .c_out(w11), .a(a[10]), .b(b[10]), .c_in(w10));
		full_adder a11(.sum(sum[11]), .c_out(w12), .a(a[11]), .b(b[11]), .c_in(w11));
		full_adder a12(.sum(sum[12]), .c_out(w13), .a(a[12]), .b(b[12]), .c_in(w12));
		full_adder a13(.sum(sum[13]), .c_out(c_out), .a(a[13]), .b(b[13]), .c_in(w13));

endmodule

module ripple_carry_adder_28b_2stage(
			sum,
			a, b, cin, clk, rstn);
		output [28:0] sum;
		input  [27:0] a,b;
		input cin, clk, rstn;
		
		wire [27:0] a_q1, b_q1;
		wire [13:0] sum_d1;
		wire [28:0] sum_d2;
		wire [13:0] a_d2, b_d2;
		wire [13:0] a_q2, b_q2;
		wire c, c_in_q, c_q;
		assign a_d2 = a_q1[27:14];
		assign b_d2 = b_q1[27:14];
		DFF_1bit DFF7(.q(c_in_q), .d(cin), .clk(clk), .rstn(rstn));
		DFF_28bit DFF0(.q(a_q1), .d(a), .clk(clk), .rstn(rstn));
		DFF_28bit DFF1(.q(b_q1), .d(b), .clk(clk), .rstn(rstn));

		DFF_14bit DFF2(.q(a_q2), .d(a_d2), .clk(clk), .rstn(rstn));
		DFF_14bit DFF3(.q(b_q2), .d(b_d2), .clk(clk), .rstn(rstn));

		full_adder_14bit a0(.sum(sum_d1), .c_out(c), .a(a_q1[13:0]), .b(b_q1[13:0]), .c_in(c_in_q));
		DFF_1bit DFF4(.q(c_q), .d(c), .clk(clk), .rstn(rstn));
		DFF_14bit DFF5(.q(sum_d2[13:0]), .d(sum_d1), .clk(clk), .rstn(rstn));
		full_adder_14bit a1(.sum(sum_d2[27:14]), .c_out(sum_d2[28]), .a(a_q2), .b(b_q2), .c_in(c_q));
		DFF_29bit DFF6(.q(sum), .d(sum_d2), .clk(clk), .rstn(rstn));
endmodule
		
