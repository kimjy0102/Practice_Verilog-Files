module mux8to1_gate( 
			out,
			i0, i1, i2, i3,
			i4, i5, i6, i7,
			s0, s1, s2,
			);
		output out;
		input i0, i1, i2, i3;
		input i4, i5, i6, i7;
		input s0, s1, s2;
		
		wire s0n, s1n, s2n;
		wire y0, y1, y2, y4, y5, y6, y7;
		not (s0n, s0);
		not (s1n, s1);
		not (s2n, s2);
		and (y0, i0, s0n, s1n, s2n);
		and (y1, i1, s0, s1n, s2n);
		and (y2, i2, s0n, s1, s2n);
		and (y3, i3, s0, s1, s2n);
		and (y4, i4, s0n, s1n, s2);
		and (y5, i5, s0, s1n, s2);
		and (y6, i6, s0n, s1, s2);
		and (y7, i7, s0, s1, s2);
		or (out, y0, y1, y2, y3, y4, y5, y6, y7);

endmodule

module mux8to1_behav(
			out,
			i0, i1, i2, i3,
			i4, i5, i6, i7,
			s0, s1, s2,
			);
		output reg out;
		input wire i0, i1, i2, i3;
		input wire i4, i5, i6, i7;
		input wire s0, s1, s2;

		always @(*) begin
			if ( {s2, s1, s0} == {1'b0, 1'b0, 1'b0} ) 
				out = i0; 
			else if ( {s2, s1, s0} == {1'b0, 1'b0, 1'b1} ) 
				out = i1; 
			else if ( {s2, s1, s0} == {1'b0, 1'b1, 1'b0} ) 
				out = i2;
			else if	( {s2, s1, s0} == {1'b0, 1'b1, 1'b1} ) 
				out = i3; 
			else if ( {s2, s1, s0} == {1'b1, 1'b0, 1'b0} ) 
				out = i4; 			
			else if ( {s2, s1, s0} == {1'b1, 1'b0, 1'b1} ) 
				out = i5; 
			else if ( {s2, s1, s0} == {1'b1, 1'b1, 1'b0} )
				out = i6; 
			else if ( {s2, s1, s0} == {1'b1, 1'b1, 1'b1} )
				out = i7;
			else 
				out = 1'b0;
		end 
endmodule