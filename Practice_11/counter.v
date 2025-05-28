module counter_4bit(
    input clk, rstn,
    output reg [4-1:0] out
);
    always @ (posedge clk) begin
        if( !rstn) out <= 4'b0;
        else       out <= out + 1;
    end
endmodule

module counter_3bit(
    input clk, rstn,
    output reg [3-1:0] out
);
    always @ (posedge clk) begin
        if( !rstn) out <= 3'b0;
        else       out <= out + 1;
    end
endmodule

module counter_2bit(
    input clk, rstn,
    output reg [2-1:0] out
);
    always @ (posedge clk) begin
        if( !rstn) out <= 2'b0;
        else       out <= out + 1;
    end
endmodule
