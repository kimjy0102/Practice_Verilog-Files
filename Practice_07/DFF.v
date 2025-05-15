module DFF_16bit(
    input clk, rstn,
    input [16-1:0] d,
    output reg [16-1:0] q
);
    always @ (posedge clk) begin
        if (!rstn) q <= 16'b0;
        else       q <= d;
    end
endmodule

module DFF_26bit(
    input clk, rstn,
    input [26-1:0] d,
    output reg [26-1:0] q
);
    always @ (posedge clk) begin
        if (!rstn) q <= 26'b0;
        else       q <= d;
    end
endmodule

module DFF_24bit(
    input clk, rstn,
    input [24-1:0] d,
    output reg [24-1:0] q
);
    always @ (posedge clk) begin
        if (!rstn) q <= 24'b0;
        else q <= d;
    end
endmodule

module DFF_25bit(
    input clk, rstn,
    input [25-1:0] d,
    output reg [25-1:0] q
);
    always @ (posedge clk) begin
        if (!rstn) q <= 25'b0;
        else q <= d;
    end
endmodule

module DFF_27bit(
    input clk, rstn,
    input [27-1:0] d,
    output reg [27-1:0] q
);
    always @ (posedge clk) begin
        if (!rstn) q <= 27'b0;
        else q <= d;
    end
endmodule

module DFF_28bit(
    input clk, rstn,
    input [28-1:0] d,
    output reg [28-1:0] q
);
    always @ (posedge clk) begin
        if (!rstn) q <= 28'b0;
        else q <= d;
    end
endmodule
