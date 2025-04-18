`timescale 1 ns / 1 ps
module stimulus_adder_based_counter;

	reg clk;
	reg rstn;
	wire [5:0] q;
	adder_based_counter_6bit r1(.q(q), .clk(clk), .rstn(rstn));
	initial
	    clk = 1'b0;
	always
	  #5 clk = ~clk;
	
	initial
	begin
		rstn = 1'b0;
	  #15 	rstn = 1'b1;
	  #60	rstn = 1'b0;
	  #10	rstn = 1'b1;
	  #680	$stop;
	end
endmodule 
