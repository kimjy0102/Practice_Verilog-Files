module counter_8bit(
    input clk, rstn,
    output reg [8-1:0] out
);
    always @ (posedge clk) begin
        if ( !rstn ) out <= 8'b0;
        else         out <= out + 1;
    end
endmodule
