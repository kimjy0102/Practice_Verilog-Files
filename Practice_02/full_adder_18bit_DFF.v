module full_adder_18bit_DFF (
				sum,
				a, b,
				c_in, clk, rstn
				);
		output reg [18:0] sum;
		input 	   [17:0] a, b;
		input 		  c_in, clk, rstn;
		reg c_in_q;
		reg [17:0] a_q, b_q;
		wire [18:0] sum_d;
		full_adder_18bit a0 (.sum(sum_d), .a(a_q), .b(b_q), .c_in(c_in_q));
		
		always @ ( posedge clk) begin
			if(!rstn) begin
				c_in_q <= 1'b0;
				a_q <= 18'b0;
				b_q <= 18'b0;
				sum <= 19'b0;
			end	
			else begin
				c_in_q <= c_in;
				a_q <= a;
				b_q <= b;
				sum <= sum_d;
			end
		end
endmodule
 