module TPmem_updated
#( parameter BW = 12 )

(  input [6*BW-1:0]  i_data,
   input	   i_enable,
   input 	   i_clk,
   input	   i_Reset,
   output reg [8*BW-1:0] o_data,
   output reg	   o_en
);

reg [4-1:0]  counter ;
reg [6*BW-1:0] array_0;
reg [6*BW-1:0] array_1;
reg [6*BW-1:0] array_2;
reg [6*BW-1:0] array_3;
reg [5*BW-1:0] array_4;
reg [4*BW-1:0] array_5;
reg [8*BW-1:0] data_out;

wire [6*BW-1:0] col [6-1:0];
wire [6*BW-1:0] row [6-1:0];
wire [3-1:0] index = counter[3-1:0] ;

wire [8*BW-1:0] w_data;
wire	      w_en;

always@(posedge i_clk) begin
    if(~i_Reset) begin
    counter <= 4'b0;
    o_data <= {BW{6'b0}};
    o_en <= 1'b0; 
    end
    else    begin
	o_data <= w_data ;
	o_en <= w_en ;
        if(i_enable) 
        counter <= counter + 4'b1;
        else begin    
            if(counter[3]==1'b1)
	            counter <= counter + 4'b1;
    	    else    
    	        counter <= counter ;
    	    end
    end
end

always@(posedge i_clk) begin
    if(~i_Reset) begin
	array_5 <= {BW{4'b0}};
	array_4 <= {BW{5'b0}};
	array_3 <= {BW{6'b0}};
	array_2 <= {BW{6'b0}};
	array_1 <= {BW{6'b0}};
	array_0 <= {BW{6'b0}};
    end
    else    begin
	    if(i_enable) begin
            if (counter[3] == 1'b0) begin
                if (index == 3'b000)
                array_0 <= i_data;
                else if (index == 3'b001)
                array_1 <= i_data;
                else if (index == 3'b010)
                array_2 <= i_data;
                else if (index == 3'b011)
                array_3 <= i_data;
                else if (index == 3'b100)
                array_4 <= i_data[6*BW-1:1*BW];
                else if (index == 3'b101)
                array_5 <= i_data[6*BW-1:2*BW];
            end
            if (counter[3] == 1'b1) begin // if started counter reaches at 1000 
                if (index == 3'b000) 
                {{array_0[6*BW-1:5*BW]},{array_1[6*BW-1:5*BW]},{array_2[6*BW-1:5*BW]},{array_3[6*BW-1:5*BW]},{array_4[5*BW-1:4*BW]},{array_5[4*BW-1:3*BW]}} <= i_data;
                else if (index == 3'b001)
                {{array_0[5*BW-1:4*BW]},{array_1[5*BW-1:4*BW]},{array_2[5*BW-1:4*BW]},{array_3[5*BW-1:4*BW]},{array_4[4*BW-1:3*BW]},{array_5[3*BW-1:2*BW]}} <= i_data;
                else if (index == 3'b010)
                {{array_0[4*BW-1:3*BW]},{array_1[4*BW-1:3*BW]},{array_2[4*BW-1:3*BW]},{array_3[4*BW-1:3*BW]},{array_4[3*BW-1:2*BW]},{array_5[2*BW-1:1*BW]}} <= i_data;
                else if (index == 3'b011)
                {{array_0[3*BW-1:2*BW]},{array_1[3*BW-1:2*BW]},{array_2[3*BW-1:2*BW]},{array_3[3*BW-1:2*BW]},{array_4[2*BW-1:1*BW]},{array_5[1*BW-1:0*BW]}} <= i_data;
                else if (index == 3'b100)
                {{array_0[2*BW-1:1*BW]},{array_1[2*BW-1:1*BW]},{array_2[2*BW-1:1*BW]},{array_3[2*BW-1:1*BW]},{array_4[1*BW-1:0*BW]}} <= i_data[6*BW-1:1*BW];
                else if (index == 3'b101)
                {{array_0[1*BW-1:0*BW]},{array_1[1*BW-1:0*BW]},{array_2[1*BW-1:0*BW]},{array_3[1*BW-1:0*BW]}} <= i_data[6*BW-1:2*BW];
            end
	    end
    end
end

assign col[0] = {{array_0[6*BW-1:5*BW]},{array_1[6*BW-1:5*BW]},{array_2[6*BW-1:5*BW]},{array_3[6*BW-1:5*BW]},{array_4[5*BW-1:4*BW]},{array_5[4*BW-1:3*BW]}} ;
assign col[1] = {{array_0[5*BW-1:4*BW]},{array_1[5*BW-1:4*BW]},{array_2[5*BW-1:4*BW]},{array_3[5*BW-1:4*BW]},{array_4[4*BW-1:3*BW]},{array_5[3*BW-1:2*BW]}} ;
assign col[2] = {{array_0[4*BW-1:3*BW]},{array_1[4*BW-1:3*BW]},{array_2[4*BW-1:3*BW]},{array_3[4*BW-1:3*BW]},{array_4[3*BW-1:2*BW]},{array_5[2*BW-1:1*BW]}} ;
assign col[3] = {{array_0[3*BW-1:2*BW]},{array_1[3*BW-1:2*BW]},{array_2[3*BW-1:2*BW]},{array_3[3*BW-1:2*BW]},{array_4[2*BW-1:1*BW]},{array_5[1*BW-1:0*BW]}} ;
assign col[4] = {{array_0[2*BW-1:1*BW]},{array_1[2*BW-1:1*BW]},{array_2[2*BW-1:1*BW]},{array_3[2*BW-1:1*BW]},{array_4[1*BW-1:0*BW]}, 12'b0} ;
assign col[5] = {{array_0[1*BW-1:0*BW]},{array_1[1*BW-1:0*BW]},{array_2[1*BW-1:0*BW]},{array_3[1*BW-1:0*BW]}, 24'b0} ;
 
assign row[0] = {{array_0[6*BW-1:5*BW]},{array_0[5*BW-1:4*BW]},{array_0[4*BW-1:3*BW]},{array_0[3*BW-1:2*BW]},{array_0[2*BW-1:1*BW]},{array_0[1*BW-1:0*BW]}} ;
assign row[1] = {{array_1[6*BW-1:5*BW]},{array_1[5*BW-1:4*BW]},{array_1[4*BW-1:3*BW]},{array_1[3*BW-1:2*BW]},{array_1[2*BW-1:1*BW]},{array_1[1*BW-1:0*BW]}} ;
assign row[2] = {{array_2[6*BW-1:5*BW]},{array_2[5*BW-1:4*BW]},{array_2[4*BW-1:3*BW]},{array_2[3*BW-1:2*BW]},{array_2[2*BW-1:1*BW]},{array_2[1*BW-1:0*BW]}} ;
assign row[3] = {{array_3[6*BW-1:5*BW]},{array_3[5*BW-1:4*BW]},{array_3[4*BW-1:3*BW]},{array_3[3*BW-1:2*BW]},{array_3[2*BW-1:1*BW]},{array_3[1*BW-1:0*BW]}} ;
assign row[4] = {{array_4[5*BW-1:4*BW]},{array_4[4*BW-1:3*BW]},{array_4[3*BW-1:2*BW]},{array_4[2*BW-1:1*BW]},{array_4[1*BW-1:0*BW]}, 12'b0} ;
assign row[5] = {{array_5[4*BW-1:3*BW]},{array_5[3*BW-1:2*BW]},{array_5[2*BW-1:1*BW]},{array_5[1*BW-1:0*BW]}, 24'b0} ;
 

always@(*) begin
    if(counter[3]==1'b1) begin
        if (counter[2:0] == 3'b110 || counter[2:0] == 3'b111)
            data_out = {BW{8'b0}};
        else
            data_out = {col[index], {BW{2'b0}}};
    end
    else if (counter[3] ==1'b0) begin
        if (counter[2:0] == 3'b110 || counter[2:0] == 3'b111)
            data_out = {BW{8'b0}};
        else    
            data_out = {row[index], {BW{2'b0}}};
    end
    else begin
        data_out = {BW{8'b0}}; 
    end
end

assign w_en = counter[3] ;
assign w_data = data_out ; 

endmodule
