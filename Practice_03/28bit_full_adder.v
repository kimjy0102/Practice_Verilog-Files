module full_adder_1bit(
			sum, c_out,
			a, b, c_in
			);
		output sum, c_out;
		input a, b, c_in;

		wire s1, s2, c1;
		xor (s1, a, b);
		and (c1, a, b);
		and (s2, s1, c_in);
		xor (sum, s1, c_in);
		xor (c_out, s2, c1);

endmodule


module full_adder_28bit(
			sum, 
			a, b, c_in);
		output [28:0] sum;
		input [27:0] a, b;
		input c_in;
				
		wire w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16, w17;
		wire w18, w19, w20, w21, w22, w23, w24, w25, w26, w27;
		full_adder_1bit a0(.sum(sum[0]), .c_out(w1), .a(a[0]), .b(b[0]), .c_in(c_in));
		full_adder_1bit a1(.sum(sum[1]), .c_out(w2), .a(a[1]), .b(b[1]), .c_in(w1));
		full_adder_1bit a2(.sum(sum[2]), .c_out(w3), .a(a[2]), .b(b[2]), .c_in(w2));
		full_adder_1bit a3(.sum(sum[3]), .c_out(w4), .a(a[3]), .b(b[3]), .c_in(w3));
		full_adder_1bit a4(.sum(sum[4]), .c_out(w5), .a(a[4]), .b(b[4]), .c_in(w4));
		full_adder_1bit a5(.sum(sum[5]), .c_out(w6), .a(a[5]), .b(b[5]), .c_in(w5));
		full_adder_1bit a6(.sum(sum[6]), .c_out(w7), .a(a[6]), .b(b[6]), .c_in(w6));
		full_adder_1bit a7(.sum(sum[7]), .c_out(w8), .a(a[7]), .b(b[7]), .c_in(w7));
		full_adder_1bit a8(.sum(sum[8]), .c_out(w9), .a(a[8]), .b(b[8]), .c_in(w8)); 
		full_adder_1bit a9(.sum(sum[9]), .c_out(w10), .a(a[9]), .b(b[9]), .c_in(w9));
		full_adder_1bit a10(.sum(sum[10]), .c_out(w11), .a(a[10]), .b(b[10]), .c_in(w10));
		full_adder_1bit a11(.sum(sum[11]), .c_out(w12), .a(a[11]), .b(b[11]), .c_in(w11));
		full_adder_1bit a12(.sum(sum[12]), .c_out(w13), .a(a[12]), .b(b[12]), .c_in(w12));
		full_adder_1bit a13(.sum(sum[13]), .c_out(w14), .a(a[13]), .b(b[13]), .c_in(w13));
		full_adder_1bit a14(.sum(sum[14]), .c_out(w15), .a(a[14]), .b(b[14]), .c_in(w14));
		full_adder_1bit a15(.sum(sum[15]), .c_out(w16), .a(a[15]), .b(b[15]), .c_in(w15));
		full_adder_1bit a16(.sum(sum[16]), .c_out(w17), .a(a[16]), .b(b[16]), .c_in(w16));
		full_adder_1bit a17(.sum(sum[17]), .c_out(w18), .a(a[17]), .b(b[17]), .c_in(w17));
		full_adder_1bit a18(.sum(sum[18]), .c_out(w19), .a(a[18]), .b(b[18]), .c_in(w18));
		full_adder_1bit a19(.sum(sum[19]), .c_out(w20), .a(a[19]), .b(b[19]), .c_in(w19));
		full_adder_1bit a20(.sum(sum[20]), .c_out(w21), .a(a[20]), .b(b[20]), .c_in(w20));
		full_adder_1bit a21(.sum(sum[21]), .c_out(w22), .a(a[21]), .b(b[21]), .c_in(w21));
		full_adder_1bit a22(.sum(sum[22]), .c_out(w23), .a(a[22]), .b(b[22]), .c_in(w22));
		full_adder_1bit a23(.sum(sum[23]), .c_out(w24), .a(a[23]), .b(b[23]), .c_in(w23));
		full_adder_1bit a24(.sum(sum[24]), .c_out(w25), .a(a[24]), .b(b[24]), .c_in(w24));
		full_adder_1bit a25(.sum(sum[25]), .c_out(w26), .a(a[25]), .b(b[25]), .c_in(w25));
		full_adder_1bit a26(.sum(sum[26]), .c_out(w27), .a(a[26]), .b(b[26]), .c_in(w26));
		full_adder_1bit a27(.sum(sum[27]), .c_out(sum[28]), .a(a[27]), .b(b[27]), .c_in(w27));
endmodule

module ripple_carry_adder_28b (
				sum,
				a, b,
				c_in, clk, rstn
				);
		output reg [28:0] sum;
		input 	   [27:0] a, b;
		input 		  c_in, clk, rstn;
		reg c_in_q;
		reg [27:0] a_q, b_q;
		wire [28:0] sum_d;
		full_adder_28bit a0 (.sum(sum_d), .a(a_q), .b(b_q), .c_in(c_in_q));
		
		always @ ( posedge clk) begin
			if(!rstn) begin
				c_in_q <= 1'b0;
				a_q <= 28'b0;
				b_q <= 28'b0;
				sum <= 29'b0;
			end	
			else begin
				c_in_q <= c_in;
				a_q <= a;
				b_q <= b;
				sum <= sum_d;
			end
		end
endmodule
 