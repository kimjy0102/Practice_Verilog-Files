module DFF_21bit(
    output reg [21-1:0] q,
    input [21-1:0] d,
    input clk, rstn
);
    always @(posedge clk) begin
        if (!rstn) begin
            q <= 21'b0;
        end
        else begin
            q <= d;
        end
    end
endmodule

