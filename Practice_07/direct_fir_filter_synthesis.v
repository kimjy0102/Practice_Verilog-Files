module direct_fir_filter_synthesis(
    input signed [14-1:0] c0, c1, c2, c3, c4, c5,
    input signed [16-1:0] a,
    input clk, reset,
    output signed [26-1:0] b
);
    reg signed [14-1:0] c0_d, c1_d, c2_d, c3_d, c4_d, c5_d;
    wire signed [16-1:0] q_0, q_1, q_2, q_3, q_4, q_5;
    wire signed [24-1:0] m_0, m_1, m_2, m_3, m_4, m_5;
    wire signed [26-1:0] p;
    DFF_16bit DFF0(.clk(clk), .rstn(reset), .d(a), .q(q_0));
    DFF_16bit DFF1(.clk(clk), .rstn(reset), .d(q_0), .q(q_1));
    DFF_16bit DFF2(.clk(clk), .rstn(reset), .d(q_1), .q(q_2));
    DFF_16bit DFF3(.clk(clk), .rstn(reset), .d(q_2), .q(q_3));
    DFF_16bit DFF4(.clk(clk), .rstn(reset), .d(q_3), .q(q_4));
    DFF_16bit DFF5(.clk(clk), .rstn(reset), .d(q_4), .q(q_5));
    multiplier MUL0(.a(q_0), .c(c0_d), .b(m_0));
    multiplier MUL1(.a(q_1), .c(c1_d), .b(m_1));
    multiplier MUL2(.a(q_2), .c(c2_d), .b(m_2));
    multiplier MUL3(.a(q_3), .c(c3_d), .b(m_3));
    multiplier MUL4(.a(q_4),. c(c4_d), .b(m_4));
    multiplier MUL5(.a(q_5), .c(c5_d), .b(m_5));
    assign p = {{2{m_5[23]}}, m_5} + {{2{m_4[23]}}, m_4} + {{2{m_3[23]}}, m_3} + {{2{m_2[23]}}, m_2} + {{2{m_1[23]}}, m_1} + {{2{m_0[23]}}, m_0};
    DFF_26bit DFF6(.clk(clk), .rstn(reset), .d(p), .q(b));
    always @(posedge clk) begin
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