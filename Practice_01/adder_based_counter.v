module adder_based_counter_6bit(q, clk, rstn);
	output [5:0] q;
	input 		clk, rstn;

	reg    [5:0] q;
	always @ (negedge clk)
	begin 
	  if (!rstn) q <= 6'b000000;
	  else       q <= q + 1'b1;
	end
endmodule
	
