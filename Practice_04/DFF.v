module DFF_28bit
    (
        output reg  [27:0]  q,
        input       [27:0]  d,
        input               clk, rstn
    );

    always@(posedge clk)
    begin
        if(!rstn)   q <= 28'b0;
        else        q <= d;
    end
endmodule

module DFF_29bit
    (
        output reg  [28:0]  q,
        input       [28:0]  d,
        input               clk, rstn
    );

    always@(posedge clk)
    begin
        if(!rstn)   q <= 29'b0;
        else        q <= d;
    end
endmodule

module DFF_1bit
    (
        output reg q,
        input 	   d,
	input	   clk, rstn
    );

    always@(posedge clk)
    begin
	if(!rstn)   q <= 1'b0;
	else        q <= d;
    end
endmodule

module DFF_14bit
   (
	output reg [13:0] q,
	input      [13:0] d,
	input             clk, rstn
    );
    always@(posedge clk)
    begin
	if(!rstn)    q <= 14'b0;
	else         q <= d;
    end
endmodule

module DFF_4bit
    (
        output reg [3:0] q,
        input 	   [3:0] d,
	input	   clk, rstn
    );

    always@(posedge clk)
    begin
	if(!rstn)   q <= 4'b0;
	else        q <= d;
    end
endmodule

module DFF_2bit
    (
        output reg [1:0] q,
        input 	   [1:0] d,
	input	   clk, rstn
    );

    always@(posedge clk)
    begin
	if(!rstn)   q <= 2'b0;
	else        q <= d;
    end
endmodule

module DFF_3bit
    (
        output reg [2:0] q,
        input 	   [2:0] d,
	input	   clk, rstn
    );

    always@(posedge clk)
    begin
	if(!rstn)   q <= 3'b0;
	else        q <= d;
    end
endmodule

module DFF_5bit
    (
        output reg [4:0] q,
        input 	   [4:0] d,
	input	   clk, rstn
    );

    always@(posedge clk)
    begin
	if(!rstn)   q <= 5'b0;
	else        q <= d;
    end
endmodule