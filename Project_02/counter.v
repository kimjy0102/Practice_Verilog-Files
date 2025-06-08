module counter_4bit(
    input clk,
    input reset,
    output reg [3:0] count
);
    always @(posedge clk) begin
        if (!reset) begin
            count <= 4'b0000;
        end else begin
            count = count + 1;
        end 
    end
endmodule

module counter_15bit(
    input clk,
    input reset,
    output reg [15-1:0] count
);
    always @(posedge clk) begin
        if (!reset) begin
            count <= 15'b000000000000000;
        end else begin
            count = count + 1;
        end 
    end
endmodule