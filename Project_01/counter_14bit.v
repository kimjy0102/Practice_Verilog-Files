module counter_14bit(
    input clk, rstn,
    output reg [14-1:0] out
);
    always @(posedge clk) begin
        if (!rstn) begin
            out <= 14'b0;
        end
        else begin
            out <= out + 1;
        end
    end
endmodule
