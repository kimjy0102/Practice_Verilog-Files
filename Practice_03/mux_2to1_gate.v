module mux_2to1_1bit(
		out,
		carry_zero, carry_one, sel);
	output out;
	input carry_zero, carry_one;
	input sel;
	wire seln;
	wire a1, b1;
	not (seln, sel);
	and (a1, carry_zero, seln);
	and (b1, carry_one, sel);
	or (out, a1, b1);
endmodule

module mux_2to1_2bit(
		out,
		carry_zero, carry_one, sel);
	output [1:0] out;
	input [1:0] carry_zero, carry_one;
	input sel;
	wire seln;
	wire [1:0] zero, one;

	not (seln, sel);
	and (zero[0], carry_zero[0], seln);
	and (zero[1], carry_zero[1], seln);
	and (one[0], carry_one[0], sel);
	and (one[1], carry_one[1], sel);
	or (out[0], zero[0], one[0]);
	or (out[1], zero[1], one[1]);
endmodule

module mux_2to1_3bit(
		out,
		carry_zero, carry_one, sel);
	output [2:0] out;
	input [2:0] carry_zero, carry_one;
	input sel;
	wire seln;
	wire [2:0] zero, one;
	
	not (seln, sel);
	and (zero[0], carry_zero[0], seln);
	and (zero[1], carry_zero[1], seln);
	and (zero[2], carry_zero[2], seln);
	and (one[0], carry_one[0], sel);
	and (one[1], carry_one[1], sel);
	and (one[2], carry_one[2], sel);
	or (out[0], zero[0], one[0]);
	or (out[1], zero[1], one[1]);
	or (out[2], zero[2], one[2]);
endmodule

module mux_2to1_4bit(
		out,
		carry_zero, carry_one, sel);
	output [3:0] out;
	input [3:0] carry_zero, carry_one;
	input sel;
	wire seln;
	wire [3:0] zero, one;
	
	not (seln, sel);
	and (zero[0], carry_zero[0], seln);
	and (zero[1], carry_zero[1], seln);
	and (zero[2], carry_zero[2], seln);
	and (zero[3], carry_zero[3], seln);
	and (one[0], carry_one[0], sel);
	and (one[1], carry_one[1], sel);
	and (one[2], carry_one[2], sel);
	and (one[3], carry_one[3], sel);	
	or (out[0], zero[0], one[0]);
	or (out[1], zero[1], one[1]);
	or (out[2], zero[2], one[2]);
	or (out[3], zero[3], one[3]);
endmodule

module mux_2to1_5bit(
		out,
		carry_zero, carry_one, sel);
	output [4:0] out;
	input [4:0] carry_zero, carry_one;
	input sel;
	wire seln;
	wire [4:0] zero, one;
	
	not (seln, sel);
	and (zero[0], carry_zero[0], seln);
	and (zero[1], carry_zero[1], seln);
	and (zero[2], carry_zero[2], seln);
	and (zero[3], carry_zero[3], seln);
	and (zero[4], carry_zero[4], seln);
	and (one[0], carry_one[0], sel);
	and (one[1], carry_one[1], sel);
	and (one[2], carry_one[2], sel);
	and (one[3], carry_one[3], sel);
	and (one[4], carry_one[4], sel);
	or (out[0], zero[0], one[0]);
	or (out[1], zero[1], one[1]);
	or (out[2], zero[2], one[2]);
	or (out[3], zero[3], one[3]);
	or (out[4], zero[4], one[4]);
endmodule

module mux_2to1_6bit(
		out,
		carry_zero, carry_one, sel);
	output [5:0] out;
	input [5:0] carry_zero, carry_one;
	input sel;
	wire seln;
	wire [5:0] zero, one;
	
	not (seln, sel);
	and (zero[0], carry_zero[0], seln);
	and (zero[1], carry_zero[1], seln);
	and (zero[2], carry_zero[2], seln);
	and (zero[3], carry_zero[3], seln);
	and (zero[4], carry_zero[4], seln);
	and (zero[5], carry_zero[5], seln);
	and (one[0], carry_one[0], sel);
	and (one[1], carry_one[1], sel);
	and (one[2], carry_one[2], sel);
	and (one[3], carry_one[3], sel);
	and (one[4], carry_one[4], sel);
	and (one[5], carry_one[5], sel);
	or (out[0], zero[0], one[0]);
	or (out[1], zero[1], one[1]);
	or (out[2], zero[2], one[2]);
	or (out[3], zero[3], one[3]);
	or (out[4], zero[4], one[4]);
	or (out[5], zero[5], one[5]);
endmodule

module mux_2to1_7bit(
		out,
		carry_zero, carry_one, sel);
	output [6:0] out;
	input [6:0] carry_zero, carry_one;
	input sel;
	wire seln;
	wire [6:0] zero, one;
	
	not (seln, sel);
	and (zero[0], carry_zero[0], seln);
	and (zero[1], carry_zero[1], seln);
	and (zero[2], carry_zero[2], seln);
	and (zero[3], carry_zero[3], seln);
	and (zero[4], carry_zero[4], seln);
	and (zero[5], carry_zero[5], seln);
	and (zero[6], carry_zero[6], seln);
	and (one[0], carry_one[0], sel);
	and (one[1], carry_one[1], sel);
	and (one[2], carry_one[2], sel);
	and (one[3], carry_one[3], sel);
	and (one[4], carry_one[4], sel);
	and (one[5], carry_one[5], sel);
	and (one[6], carry_one[6], sel);
	or (out[0], zero[0], one[0]);
	or (out[1], zero[1], one[1]);
	or (out[2], zero[2], one[2]);
	or (out[3], zero[3], one[3]);
	or (out[4], zero[4], one[4]);
	or (out[5], zero[5], one[5]);
	or (out[6], zero[6], one[6]);
endmodule

module mux_2to1_8bit(
		out,
		carry_zero, carry_one, sel);
	output [7:0] out;
	input [7:0] carry_zero, carry_one;
	input sel;
	wire seln;
	wire [7:0] zero, one;
	
	not (seln, sel);
	and (zero[0], carry_zero[0], seln);
	and (zero[1], carry_zero[1], seln);
	and (zero[2], carry_zero[2], seln);
	and (zero[3], carry_zero[3], seln);
	and (zero[4], carry_zero[4], seln);
	and (zero[5], carry_zero[5], seln);
	and (zero[6], carry_zero[6], seln);
	and (zero[7], carry_zero[7], seln);
	and (one[0], carry_one[0], sel);
	and (one[1], carry_one[1], sel);
	and (one[2], carry_one[2], sel);
	and (one[3], carry_one[3], sel);
	and (one[4], carry_one[4], sel);
	and (one[5], carry_one[5], sel);
	and (one[6], carry_one[6], sel);
	and (one[7], carry_one[7], sel);
	or (out[0], zero[0], one[0]);
	or (out[1], zero[1], one[1]);
	or (out[2], zero[2], one[2]);
	or (out[3], zero[3], one[3]);
	or (out[4], zero[4], one[4]);
	or (out[5], zero[5], one[5]);
	or (out[6], zero[6], one[6]);
	or (out[7], zero[7], one[7]);
endmodule