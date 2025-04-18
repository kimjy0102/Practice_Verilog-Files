module first_stage
(
	output [27:0]sum, c_out,
	input  [27:0]a, 
	input  [26:0]b
);
	half_adder m0(.sum(sum[0]), .c_out(c_out[0]), .a(a[0]), .b(b[0]));
	half_adder m1(.sum(sum[1]), .c_out(c_out[1]), .a(a[1]), .b(b[1]));
	half_adder m2(.sum(sum[2]), .c_out(c_out[2]), .a(a[2]), .b(b[2]));
	half_adder m3(.sum(sum[3]), .c_out(c_out[3]), .a(a[3]), .b(b[3]));
	half_adder m4(.sum(sum[4]), .c_out(c_out[4]), .a(a[4]), .b(b[4]));
	half_adder m5(.sum(sum[5]), .c_out(c_out[5]), .a(a[5]), .b(b[5]));
	half_adder m6(.sum(sum[6]), .c_out(c_out[6]), .a(a[6]), .b(b[6]));
	half_adder m7(.sum(sum[7]), .c_out(c_out[7]), .a(a[7]), .b(b[7]));
	half_adder m8(.sum(sum[8]), .c_out(c_out[8]), .a(a[8]), .b(b[8]));
	half_adder m9(.sum(sum[9]), .c_out(c_out[9]), .a(a[9]), .b(b[9]));
	half_adder m10(.sum(sum[10]), .c_out(c_out[10]), .a(a[10]), .b(b[10]));
	half_adder m11(.sum(sum[11]), .c_out(c_out[11]), .a(a[11]), .b(b[11]));
	half_adder m12(.sum(sum[12]), .c_out(c_out[12]), .a(a[12]), .b(b[12]));
	half_adder m13(.sum(sum[13]), .c_out(c_out[13]), .a(a[13]), .b(b[13]));
	half_adder m14(.sum(sum[14]), .c_out(c_out[14]), .a(a[14]), .b(b[14]));
	half_adder m15(.sum(sum[15]), .c_out(c_out[15]), .a(a[15]), .b(b[15]));
	half_adder m16(.sum(sum[16]), .c_out(c_out[16]), .a(a[16]), .b(b[16]));
	half_adder m17(.sum(sum[17]), .c_out(c_out[17]), .a(a[17]), .b(b[17]));
	half_adder m18(.sum(sum[18]), .c_out(c_out[18]), .a(a[18]), .b(b[18]));
	half_adder m19(.sum(sum[19]), .c_out(c_out[19]), .a(a[19]), .b(b[19]));
	half_adder m20(.sum(sum[20]), .c_out(c_out[20]), .a(a[20]), .b(b[20]));
	half_adder m21(.sum(sum[21]), .c_out(c_out[21]), .a(a[21]), .b(b[21]));
	half_adder m22(.sum(sum[22]), .c_out(c_out[22]), .a(a[22]), .b(b[22]));
	half_adder m23(.sum(sum[23]), .c_out(c_out[23]), .a(a[23]), .b(b[23]));
	half_adder m24(.sum(sum[24]), .c_out(c_out[24]), .a(a[24]), .b(b[24]));
	half_adder m25(.sum(sum[25]), .c_out(c_out[25]), .a(a[25]), .b(b[25]));
	half_adder m26(.sum(sum[26]), .c_out(c_out[26]), .a(a[26]), .b(b[26]));
	half_adder m27(.sum(sum[27]), .c_out(c_out[27]), .a(a[27]), .b(1'b0));
endmodule 

module middle_stage
(
	output [27:0]sum, c_out,
	input  [27:0]a, c_in,
	input  [26:0]b
);
	full_adder m0(.sum(sum[0]), .c_out(c_out[0]), .a(a[0]), .b(b[0]), .c_in(c_in[0]));
	full_adder m1(.sum(sum[1]), .c_out(c_out[1]), .a(a[1]), .b(b[1]), .c_in(c_in[1]));
	full_adder m2(.sum(sum[2]), .c_out(c_out[2]), .a(a[2]), .b(b[2]), .c_in(c_in[2]));
	full_adder m3(.sum(sum[3]), .c_out(c_out[3]), .a(a[3]), .b(b[3]), .c_in(c_in[3]));
	full_adder m4(.sum(sum[4]), .c_out(c_out[4]), .a(a[4]), .b(b[4]), .c_in(c_in[4]));
	full_adder m5(.sum(sum[5]), .c_out(c_out[5]), .a(a[5]), .b(b[5]), .c_in(c_in[5]));
	full_adder m6(.sum(sum[6]), .c_out(c_out[6]), .a(a[6]), .b(b[6]), .c_in(c_in[6]));
	full_adder m7(.sum(sum[7]), .c_out(c_out[7]), .a(a[7]), .b(b[7]), .c_in(c_in[7]));
	full_adder m8(.sum(sum[8]), .c_out(c_out[8]), .a(a[8]), .b(b[8]), .c_in(c_in[8]));
	full_adder m9(.sum(sum[9]), .c_out(c_out[9]), .a(a[9]), .b(b[9]), .c_in(c_in[9]));
	full_adder m10(.sum(sum[10]), .c_out(c_out[10]), .a(a[10]), .b(b[10]), .c_in(c_in[10]));
	full_adder m11(.sum(sum[11]), .c_out(c_out[11]), .a(a[11]), .b(b[11]), .c_in(c_in[11]));
	full_adder m12(.sum(sum[12]), .c_out(c_out[12]), .a(a[12]), .b(b[12]), .c_in(c_in[12]));
	full_adder m13(.sum(sum[13]), .c_out(c_out[13]), .a(a[13]), .b(b[13]), .c_in(c_in[13]));
	full_adder m14(.sum(sum[14]), .c_out(c_out[14]), .a(a[14]), .b(b[14]), .c_in(c_in[14]));
	full_adder m15(.sum(sum[15]), .c_out(c_out[15]), .a(a[15]), .b(b[15]), .c_in(c_in[15]));
	full_adder m16(.sum(sum[16]), .c_out(c_out[16]), .a(a[16]), .b(b[16]), .c_in(c_in[16]));
	full_adder m17(.sum(sum[17]), .c_out(c_out[17]), .a(a[17]), .b(b[17]), .c_in(c_in[17]));
	full_adder m18(.sum(sum[18]), .c_out(c_out[18]), .a(a[18]), .b(b[18]), .c_in(c_in[18]));
	full_adder m19(.sum(sum[19]), .c_out(c_out[19]), .a(a[19]), .b(b[19]), .c_in(c_in[19]));
	full_adder m20(.sum(sum[20]), .c_out(c_out[20]), .a(a[20]), .b(b[20]), .c_in(c_in[20]));
	full_adder m21(.sum(sum[21]), .c_out(c_out[21]), .a(a[21]), .b(b[21]), .c_in(c_in[21]));
	full_adder m22(.sum(sum[22]), .c_out(c_out[22]), .a(a[22]), .b(b[22]), .c_in(c_in[22]));
	full_adder m23(.sum(sum[23]), .c_out(c_out[23]), .a(a[23]), .b(b[23]), .c_in(c_in[23]));
	full_adder m24(.sum(sum[24]), .c_out(c_out[24]), .a(a[24]), .b(b[24]), .c_in(c_in[24]));
	full_adder m25(.sum(sum[25]), .c_out(c_out[25]), .a(a[25]), .b(b[25]), .c_in(c_in[25]));
	full_adder m26(.sum(sum[26]), .c_out(c_out[26]), .a(a[26]), .b(b[26]), .c_in(c_in[26]));
	half_adder m27(.sum(sum[27]), .c_out(c_out[27]), .a(a[27]), .b(c_in[27])); 
endmodule
