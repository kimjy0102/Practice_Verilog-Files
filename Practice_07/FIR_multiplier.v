module multiplier(
    input signed [16-1:0] a,
    input signed [14-1:0] c,
    output reg signed [24-1:0] b
);
    wire signed [30-1:0] mul_out;
    assign mul_out = a * c;
    always @(*) begin
        if ( mul_out[4]) begin
            b <= mul_out[28:5] + 1;
        end
        else begin 
            b <= mul_out[28:5];
        end
    end
endmodule
