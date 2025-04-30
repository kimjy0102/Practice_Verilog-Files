module counter_12bit(
    input clk, rstn,
    output reg [12-1:0] out
);
    always @(posedge clk) begin
        if (!rstn) begin
            out <= 12'b0;   
        end 
        else begin
            out <= out + 1;
        end
    end
endmodule