module mul_28bit(
    input [28-1:0]a, b,
    output reg [56-1:0]out
);
    assign out = a * b;
endmodule
