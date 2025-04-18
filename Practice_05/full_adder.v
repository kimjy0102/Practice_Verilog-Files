module full_adder
(
    output  sum, c_out,
    input   a, b, c_in
);

wire s1, c1, s2;

xor(s1, a, b);
and(c1, a, b);

xor(  sum, s1, c_in);
and(   s2, s1, c_in);
xor(c_out, s2,   c1);

endmodule

module half_adder
(
	output sum, c_out,
	input  a, b
);

assign sum = a ^ b;
assign c_out = a & b;

endmodule
