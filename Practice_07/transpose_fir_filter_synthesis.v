module trans_fir_filter_synthesis(
    input clk, reset,
    input signed [16-1:0] a,
    input signed [14-1:0] c0, c1, c2, c3, c4, c5,
    output signed [26-1:0] b
);
    reg signed [14-1:0] c0_d, c1_d, c2_d, c3_d, c4_d, c5_d;
    wire signed [16-1:0] a_q;
    wire signed [24-1:0] q_0, q_1, q_2, q_3, q_4, q_5;
    wire signed [24-1:0] p_0;
    wire signed [25-1:0] p_1, p_q_1;
    wire signed [26-1:0] p_2, p_q_2;
    wire signed [27-1:0] p_3, p_q_3;
    wire signed [28-1:0] p_4, p_q_4;
    wire signed [29-1:0] p_5;
    DFF_16bit DFF0(.clk(clk), .rstn(reset), .d(a), .q(a_q));
    multiplier MUL0(.a(a_q), .c(c0_d), .b(q_0));
    multiplier MUL1(.a(a_q), .c(c1_d), .b(q_1));
    multiplier MUL2(.a(a_q), .c(c2_d), .b(q_2));
    multiplier MUL3(.a(a_q), .c(c3_d), .b(q_3));
    multiplier MUL4(.a(a_q),. c(c4_d), .b(q_4));
    multiplier MUL5(.a(a_q), .c(c5_d), .b(q_5));
    DFF_24bit DFF1(.clk(clk), .rstn(reset), .d(q_5), .q(p_0));
    assign p_1 = {p_0[23], p_0} + {q_4[23], q_4};
    DFF_25bit DFF2(.clk(clk), .rstn(reset), .d(p_1), .q(p_q_1));
    assign p_2 = {p_q_1[24], p_q_1} + {{2{q_3[23]}}, q_3};
    DFF_26bit DFF3(.clk(clk), .rstn(reset), .d(p_2), .q(p_q_2));
    assign p_3 = {p_q_2[25], p_q_2} + {{3{q_2[23]}}, q_2};
    DFF_27bit DFF4(.clk(clk), .rstn(reset), .d(p_3), .q(p_q_3));
    assign p_4 = {p_q_3[26], p_q_3} + {{4{q_1[23]}}, q_1};
    DFF_28bit DFF5(.clk(clk), .rstn(reset), .d(p_4), .q(p_q_4));
    assign p_5 = {p_q_4[27], p_q_4} + {{5{q_0[23]}}, q_0};
    DFF_26bit DFF6(.clk(clk), .rstn(reset), .d(p_5[25:0]), .q(b));
    always @ (posedge clk) begin
        if (!reset) begin
            c0_d <= 14'b0;
            c1_d <= 14'b0;
            c2_d <= 14'b0;
            c3_d <= 14'b0;
            c4_d <= 14'b0;
            c5_d <= 14'b0;
        end
        else begin
            c0_d <= c0;
            c1_d <= c1;
            c2_d <= c2;
            c3_d <= c3;
            c4_d <= c4;
            c5_d <= c5;
        end
    end
endmodule
