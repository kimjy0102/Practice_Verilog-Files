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

module full_adder_4b
(
    output  [4-1:0] sum, 
    output  c_out,
    input   [4-1:0] a, b, 
    input   c_in
);

wire [3-1:0] c;

full_adder f00 (.sum(sum[0] ), .c_out(c[0] ), .a(a[0]), .b(b[0]), .c_in(c_in));
full_adder f01 (.sum(sum[1] ), .c_out(c[1] ), .a(a[1]), .b(b[1]), .c_in(c[0]));
full_adder f02 (.sum(sum[2] ), .c_out(c[2] ), .a(a[2]), .b(b[2]), .c_in(c[1]));
full_adder f03 (.sum(sum[3] ), .c_out(c_out), .a(a[3]), .b(b[3]), .c_in(c[2]));

endmodule