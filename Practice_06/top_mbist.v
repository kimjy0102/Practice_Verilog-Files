module top_mbist(
    input MBIST_start, clk, rstn,
    output [56-1:0]Data_out,
    output reg MBIST_done
);
    reg state, nextstate, rstn2;
    reg NCE;
    wire [12-1:0] counter;
    wire [56-1:0] temp_DIN;
    
    always @(*) begin
        case (state)
        1'b0: begin
            if (MBIST_start) begin
                nextstate <= 1'b1;
            end
        end
        1'b1: begin
            if (!rstn) begin
                nextstate <= 1'b0;
            end
        end
	default: begin
		nextstate <= 1'b0;
	end
        endcase
    end
    
    always @ (posedge clk) begin
        state <= nextstate;
    end

    always @ (posedge clk) begin
        if (state == 1'b0) begin
            NCE <= 1'b1;
	        MBIST_done <= 1'b0;
	        rstn2 <= 1'b0;	
        end
        else begin
            if ( counter == 12'b1111_1111_1111)begin
            	MBIST_done <= 1'b1;
		        NCE <= 1'b0;
		        rstn2 <= 1'b1;
            end
	        else begin
		        NCE <= 1'b0;
		        rstn2 <=1'b1;
		        MBIST_done <= 1'b0;	
	    end
	end
    end 
    counter_12bit count(.clk(clk), .rstn(rstn2), .out(counter));
    mux_4to1 MUX(.a(56'h00_0000_0000_0000), .b(56'hFF_FFFF_FFFF_FFFF), .c(56'h55_5555_5555_5555), .d(56'hAA_AAAA_AAAA_AAAA), .sel(counter[11:10]), .out(temp_DIN));
    rflp512x56mx3 memory(.DO(Data_out), .DIN(temp_DIN), .RA(counter[8:3]), .CA(counter[2:0]), .NWRT(counter[9]), .NCE(NCE), .CLK(clk));
endmodule