module lowcost_trans_fir_filter(
    input clk, reset,
    input signed [16-1:0] a,
    output signed [26-1:0] b
);
    wire signed [16-1:0] a_q;
    DFF_16bit DFF0(.clk(clk), .rstn(reset), .d(a), .q(a_q));
    // shifter
    wire signed shifter = 1'b0;
    // shifted from origin a_q
    wire signed [18-1:0] a_shift_2 = {a_q, {2{shifter}}};
    wire signed [17-1:0] a_shift_1 = {a_q, {1{shifter}}};
    wire signed [24-1:0] a_shift_8 = {a_q, {8{shifter}}};
    wire signed [28-1:0] a_shift_12 = {a_q, {12{shifter}}};
    wire signed [29-1:0] a_shift_13 = {a_q, {13{shifter}}};
    wire signed [27-1:0] a_shift_11 = {a_q, {11{shifter}}};
    // blocks
    wire signed [19-1:0] x_1 = {{3{a_q[15]}}, a_q} + {a_shift_2[17], a_shift_2};
    wire signed [18-1:0] x_2 = {{2{a_q[15]}}, a_q} + {a_shift_1[16], a_shift_1};
    wire signed [20-1:0] x_3 = {x_1[18], x_1} + {{3{a_shift_1[16]}}, a_shift_1};
    // represented multiplied value via blocks
    wire signed [30-1:0] a_c0 = {{6{x_1[18]}}, x_1, {5{shifter}}} + {{2{x_1[18]}}, x_1, {9{shifter}}} + {{12{a_shift_2[17]}}, a_shift_2} + {{2{a_shift_12[27]}}, a_shift_12} - {a_shift_13[28], a_shift_13};
    wire signed [30-1:0] a_c1 = {{12{x_2[17]}}, x_2} + {{8{x_2[17]}}, x_2, {4{shifter}}} + {x_1[18], x_1, {10{shifter}}}; 
    wire signed [30-1:0] a_c2 = {{10{x_3[19]}}, x_3} + {x_3[19], x_3, {9{shifter}}} + {{8{x_2[17]}}, x_2, {4{shifter}}};
    wire signed [30-1:0] a_c3 = {{10{x_3[19]}}, x_3} + {{7{x_1[18]}}, x_1, {4{shifter}}} + {{2{x_1[18]}}, x_1, {9{shifter}}} + {{2{a_shift_12[27]}}, a_shift_12};
    wire signed [30-1:0] a_c4 = {{12{x_2[17]}}, x_2} + {{9{x_1[18]}}, x_1, {2{shifter}}} + {{6{a_shift_8[23]}}, a_shift_8} + {{3{a_shift_11[26]}}, a_shift_11};
    wire signed [30-1:0] a_c5 = {{11{x_1[18]}}, x_1} + {{9{x_2[17]}}, x_2, {3{shifter}}} + {{2{x_2[17]}}, x_2, {10{shifter}}} - {a_shift_13[28], a_shift_13};
    // rounding
    wire signed [24-1:0] a_c0_round = a_c0[28:5] + a_c0[4];
    wire signed [24-1:0] a_c1_round = a_c1[28:5] + a_c1[4];
    wire signed [24-1:0] a_c2_round = a_c2[28:5] + a_c2[4];
    wire signed [24-1:0] a_c3_round = a_c3[28:5] + a_c3[4];
    wire signed [24-1:0] a_c4_round = a_c4[28:5] + a_c4[4];
    wire signed [24-1:0] a_c5_round = a_c5[28:5] + a_c5[4];
    // wire for intermediate dffs
    wire signed [24-1:0] p_0;
    wire signed [25-1:0] p_1, p_q_1;
    wire signed [26-1:0] p_2, p_q_2;
    wire signed [27-1:0] p_3, p_q_3;
    wire signed [28-1:0] p_4, p_q_4;
    wire signed [29-1:0] p_5;
    // after adder tree
    DFF_24bit DFF1(.clk(clk), .rstn(reset), .d(a_c5_round), .q(p_0));
    assign p_1 = {{1{p_0[23]}}, p_0} + {{1{a_c4_round[23]}}, a_c4_round};
    DFF_25bit DFF2(.clk(clk), .rstn(reset), .d(p_1), .q(p_q_1));
    assign p_2 = {{1{p_q_1[24]}}, p_q_1} + {{2{a_c3_round[23]}}, a_c3_round};
    DFF_26bit DFF3(.clk(clk), .rstn(reset), .d(p_2), .q(p_q_2));
    assign p_3 = {{1{p_q_2[25]}}, p_q_2} + {{3{a_c2_round[23]}}, a_c2_round};
    DFF_27bit DFF4(.clk(clk), .rstn(reset), .d(p_3), .q(p_q_3));
    assign p_4 = {{1{p_q_3[26]}}, p_q_3} + {{4{a_c1_round[23]}}, a_c1_round};
    DFF_28bit DFF5(.clk(clk), .rstn(reset), .d(p_4), .q(p_q_4));
    assign p_5 = {{1{p_q_4[27]}}, p_q_4} + {{5{a_c0_round[23]}}, a_c0_round};
    DFF_26bit DFF6(.clk(clk), .rstn(reset), .d(p_5[25:0]), .q(b));
endmodule
