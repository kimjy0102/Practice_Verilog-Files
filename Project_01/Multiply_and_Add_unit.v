module MAC_ONE(
    input clk, rstn,
    input [8-1:0] a, b,
    input [4:0] count,
    output [21-1:0] out
);
    wire [21-1:0] mul_out, add_out;
    wire [21-1:0] mux_out;
    reg [21-1:0] accumulate;
    reg sel;
    assign mux_out = sel ? out : 21'b0;
    assign mul_out = a * b;
    assign add_out = mul_out + mux_out;
    always @(count) begin
        if ( count == 5'b00001) begin
            sel = 1'b0;
        end
        else begin
            sel = 1'b1;
        end
    end
    always @(posedge clk) begin
        if (!rstn) begin
            accumulate <= 21'b0;
        end
        else begin
            accumulate <= add_out;
        end
    end
    assign out = accumulate;
endmodule

