module pipelined_sqrt_csa_28bit(
			sum,
			a, b, clk, rstn, c_in, c_in_0, c_in_1);
		output [28:0] sum;
		input [27:0] a, b;
		input clk, rstn, c_in, c_in_0, c_in_1;
		wire [6:0] c;
		wire [1:0] sum_d;
		// bit width 2,2,3,4,5,6,6
		full_adder a0(.sum(sum_d[0]), .c_out(c[0]), .a(a[0]), .b(b[0]), .c_in(c_in));
		full_adder a1(.sum(sum_d[1]), .c_out(c[1]), .a(a[1]), .b(b[1]), .c_in(c[0]));
		// 2bit DFF for first 2bit ripple carry adder
		DFF_2bit DFF0(.q(sum[1:0]), .d(sum_d), .clk(clk), .rstn(rstn));
		carry_select_adder_2bit m0(.sum(sum[3:2]), .c_out(c[2]), .clk(clk), .rstn(rstn), .a(a[3:2]), .b(b[3:2]), .c_in(c[1]), .c_in_0(c_in_0), .c_in_1(c_in_1));
		carry_select_adder_3bit m1(.sum(sum[6:4]), .c_out(c[3]), .clk(clk), .rstn(rstn), .a(a[6:4]), .b(b[6:4]), .c_in(c[2]), .c_in_0(c_in_0), .c_in_1(c_in_1));
		carry_select_adder_4bit m2(.sum(sum[10:7]), .c_out(c[4]), .clk(clk), .rstn(rstn), .a(a[10:7]), .b(b[10:7]), .c_in(c[3]), .c_in_0(c_in_0), .c_in_1(c_in_1));
		carry_select_adder_5bit m3(.sum(sum[15:11]), .c_out(c[5]), .clk(clk), .rstn(rstn), .a(a[15:11]), .b(b[15:11]), .c_in(c[4]), .c_in_0(c_in_0), .c_in_1(c_in_1));
		carry_select_adder_6bit m4(.sum(sum[21:16]), .c_out(c[6]), .clk(clk), .rstn(rstn), .a(a[21:16]), .b(b[21:16]), .c_in(c[5]), .c_in_0(c_in_0), .c_in_1(c_in_1));
		carry_select_adder_6bit m5(.sum(sum[27:22]), .c_out(sum[28]), .clk(clk), .rstn(rstn), .a(a[27:22]), .b(b[27:22]), .c_in(c[6]), .c_in_0(c_in_0), .c_in_1(c_in_1));

endmodule

module sqrt_csa_28bit_2stage (
				sum,
				a, b,
				c_in, clk, rstn);
		output  	[28:0] sum;
		input 		[27:0] a, b;
		input 		c_in, clk, rstn;
		reg c_in_q;
		reg c_in_0, c_in_1;
		wire [28:0] sum_d;
		wire [27:0] a_q, b_q;
		DFF_28bit DFF0(.q(a_q), .d(a), .clk(clk), .rstn(rstn));
    		DFF_28bit DFF1(.q(b_q), .d(b), .clk(clk), .rstn(rstn));
		pipelined_sqrt_csa_28bit a0 (.sum(sum_d), .a(a_q), .b(b_q), .clk(clk), .rstn(rstn), .c_in(c_in_q), .c_in_0(c_in_0), .c_in_1(c_in_1));
		DFF_29bit DFF2(.q(sum), .d(sum_d), .clk(clk), .rstn(rstn));
		always @ ( posedge clk) begin
			if(!rstn) begin
				c_in_q <= 1'b0;
				c_in_0 <= 1'b0;
				c_in_1 <= 1'b0;
			end	
			else begin
				c_in_q <= c_in;
				c_in_0 <= 1'b0;
				c_in_1 <= 1'b1;
			end
		end
endmodule
