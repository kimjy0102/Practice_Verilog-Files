module butterfly_9bit(
    output signed [10-1:0] C1, C2,
    input signed [9-1:0] a, b
);
    assign C1 = a + b;
    assign C2 = a - b;
endmodule

module butterfly_10bit(
    output signed [11-1:0] C1, C2,
    input signed [10-1:0] a, b
);
    assign C1 = a + b;
    assign C2 = a - b;
endmodule

module butterfly_11bit(
    output signed [12-1:0] C1, C2,
    input signed [11-1:0] a, b
);
    assign C1 = a + b;
    assign C2 = a - b;
endmodule

module butterfly_8bit(
    output signed [9-1:0] C1, C2,
    input signed [8-1:0] a, b
);
    assign C1 = a + b;
    assign C2 = a - b;
endmodule