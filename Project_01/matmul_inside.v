module matmul_controller(
    input [8-1:0] A,
    input [5-1:0] count,
    input clk, rstn,
    input [32-1:0] B,
    output reg [21-1:0] out
);
    wire [8-1:0] B0, B1, B2, B3;
    wire [21-1:0] out_0, out_1, out_2, out_3;
    wire [21-1:0] q_1, q_2, q_3, q_4, q_5, q_6;
    assign B3 = B[8-1:0];
    assign B2 = B[16-1:8];
    assign B1 = B[24-1:16];
    assign B0 = B[32-1:24];
    MAC_ONE M0(.clk(clk), .rstn(rstn), .a(A), .b(B0), .count(count[4:0]), .out(out_0));
    MAC_ONE M1(.clk(clk), .rstn(rstn), .a(A), .b(B1), .count(count[4:0]), .out(out_1));
    MAC_ONE M2(.clk(clk), .rstn(rstn), .a(A), .b(B2), .count(count[4:0]), .out(out_2));
    MAC_ONE M3(.clk(clk), .rstn(rstn), .a(A), .b(B3), .count(count[4:0]), .out(out_3));
    DFF_21bit D0(.q(q_1), .d(out_1), .clk(clk), .rstn(rstn));
    DFF_21bit D1(.q(q_2), .d(out_2), .clk(clk), .rstn(rstn));
    DFF_21bit D2(.q(q_3), .d(q_2), .clk(clk), .rstn(rstn));
    DFF_21bit D3(.q(q_4), .d(out_3), .clk(clk), .rstn(rstn));
    DFF_21bit D4(.q(q_5), .d(q_4), .clk(clk), .rstn(rstn));
    DFF_21bit D5(.q(q_6), .d(q_5), .clk(clk), .rstn(rstn));
    always @(*) begin
        case (count[1:0])
            2'b01 : out = out_0;
            2'b10 : out = q_1;
            2'b11 : out = q_3;
            2'b00 : out = q_6;
        endcase
    end
endmodule
