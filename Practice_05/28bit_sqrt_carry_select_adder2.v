module csa2_28bit(
			sum,
			a, b, c_in );
		output [27:0] sum;
		input [27:0] a; 
		input [26:0] b;
		input c_in;
		wire [6:0] c;
		wire [27:0] temp_b;
		assign temp_b[26:0] = b;
		assign temp_b[27] = 1'b0;
		// bit width 2,2,3,4,5,6,6
		full_adder a0(.sum(sum[0]), .c_out(c[0]), .a(a[0]), .b(temp_b[0]), .c_in(c_in));
		full_adder a1(.sum(sum[1]), .c_out(c[1]), .a(a[1]), .b(temp_b[1]), .c_in(c[0]));
		
		carry_select_adder_2bit m0(.sum(sum[3:2]), .c_out(c[2]), .a(a[3:2]), .b(temp_b[3:2]), .c_in(c[1]), .c_in_0(1'b0), .c_in_1(1'b1));
		carry_select_adder_3bit m1(.sum(sum[6:4]), .c_out(c[3]), .a(a[6:4]), .b(temp_b[6:4]), .c_in(c[2]), .c_in_0(1'b0), .c_in_1(1'b1));
		carry_select_adder_4bit m2(.sum(sum[10:7]), .c_out(c[4]), .a(a[10:7]), .b(temp_b[10:7]), .c_in(c[3]), .c_in_0(1'b0), .c_in_1(1'b1));
		carry_select_adder_5bit m3(.sum(sum[15:11]), .c_out(c[5]), .a(a[15:11]), .b(temp_b[15:11]), .c_in(c[4]), .c_in_0(1'b0), .c_in_1(1'b1));
		carry_select_adder_6bit m4(.sum(sum[21:16]), .c_out(c[6]), .a(a[21:16]), .b(temp_b[21:16]), .c_in(c[5]), .c_in_0(1'b0), .c_in_1(1'b1));
		carry_select_adder_6bit m5(.sum(sum[27:22]), .c_out(), .a(a[27:22]), .b(temp_b[27:22]), .c_in(c[6]), .c_in_0(1'b0), .c_in_1(1'b1));

endmodule

