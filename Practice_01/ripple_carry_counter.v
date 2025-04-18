module ripple_carry_counter_6bit(q, clk, rstn);
	
	output [5:0] q;
	input	     clk, rstn;

	TFF tff0(q[0], clk, rstn);
	TFF tff1(q[1], q[0], rstn);
	TFF tff2(q[2], q[1], rstn);
	TFF tff3(q[3], q[2], rstn);
	TFF tff4(q[4], q[3], rstn);
	TFF tff5(q[5], q[4], rstn);
endmodule
	
