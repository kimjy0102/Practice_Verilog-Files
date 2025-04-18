module csa_28bit(
			sum,
			a, b, c_in, c_in_0, c_in_1);
		output [28:0] sum;
		input [27:0] a, b;
		input c_in, c_in_0, c_in_1;
		wire [6:0] c;
		// bit width: 3,3,4,5,6,7
		full_adder_1bit a0(.sum(sum[0]), .c_out(c[0]), .a(a[0]), .b(b[0]), .c_in(c_in));
		full_adder_1bit a1(.sum(sum[1]), .c_out(c[1]), .a(a[1]), .b(b[1]), .c_in(c[0]));
		full_adder_1bit a2(.sum(sum[2]), .c_out(c[2]), .a(a[2]), .b(b[2]), .c_in(c[1]));
		
		carry_select_adder_3bit m0(.sum(sum[5:3]), .c_out(c[3]), .a(a[5:3]), .b(b[5:3]), .c_in(c[2]), .c_in_0(c_in_0), .c_in_1(c_in_1));
		carry_select_adder_4bit m1(.sum(sum[9:6]), .c_out(c[4]), .a(a[9:6]), .b(b[9:6]), .c_in(c[3]), .c_in_0(c_in_0), .c_in_1(c_in_1));
		carry_select_adder_5bit m2(.sum(sum[14:10]), .c_out(c[5]), .a(a[14:10]), .b(b[14:10]), .c_in(c[4]), .c_in_0(c_in_0), .c_in_1(c_in_1));
		carry_select_adder_6bit m3(.sum(sum[20:15]), .c_out(c[6]), .a(a[20:15]), .b(b[20:15]), .c_in(c[5]), .c_in_0(c_in_0), .c_in_1(c_in_1));
		carry_select_adder_7bit m4(.sum(sum[27:21]), .c_out(sum[28]), .a(a[27:21]), .b(b[27:21]), .c_in(c[6]), .c_in_0(c_in_0), .c_in_1(c_in_1));

endmodule

module sqrt_carry_select_adder2_28b (
				sum,
				a, b,
				c_in, clk, rstn);
		output reg 	[28:0] sum;
		input 		[27:0] a, b;
		input 		c_in, clk, rstn;
		reg c_in_q;
		reg [27:0] a_q, b_q;
		reg c_in_0, c_in_1;
		wire [28:0] sum_d;
		csa_28bit a0 (.sum(sum_d), .a(a_q), .b(b_q), .c_in(c_in_q), .c_in_0(c_in_0), .c_in_1(c_in_1));
		
		always @ ( posedge clk) begin
			if(!rstn) begin
				c_in_q <= 1'b0;
				a_q <= 28'b0;
				b_q <= 28'b0;
				sum <= 29'b0;
				c_in_0 <= 1'b0;
				c_in_1 <= 1'b0;
			end	
			else begin
				c_in_q <= c_in;
				c_in_0 <= 1'b0;
				c_in_1 <= 1'b1;
				a_q <= a;
				b_q <= b;
				sum <= sum_d;
			end
		end
endmodule
