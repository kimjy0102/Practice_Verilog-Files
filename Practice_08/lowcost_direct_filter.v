module lowcost_direct_fir_filter(
    input signed [16-1:0] a,
    input clk, reset,
    output signed [26-1:0] b
);
    wire signed [16-1:0] an_1, an_2, an_3, an_4, an_5, an_6;
    DFF_16bit DFF0(.clk(clk), .rstn(reset), .d(a), .q(an_1));
    DFF_16bit DFF1(.clk(clk), .rstn(reset), .d(an_1), .q(an_2));
    DFF_16bit DFF2(.clk(clk), .rstn(reset), .d(an_2), .q(an_3));
    DFF_16bit DFF3(.clk(clk), .rstn(reset), .d(an_3), .q(an_4));
    DFF_16bit DFF4(.clk(clk), .rstn(reset), .d(an_4), .q(an_5));
    DFF_16bit DFF5(.clk(clk), .rstn(reset), .d(an_5), .q(an_6));
    // shifter and shifted from origins
    wire signed shifter = 1'b0;
    // n-1
    wire signed [18-1:0] an_1_shift_2 = {an_1, {2{shifter}}};
    wire signed [25-1:0] an_1_shift_9 = {an_1, {9{shifter}}};
    // n-2
    wire signed [20-1:0] an_2_shift_4 = {an_2, {4{shifter}}};
    // n-3
    wire signed [22-1:0] an_3_shift_6 = {an_3, {6{shifter}}};
    // n-4
    wire signed [21-1:0] an_4_shift_5 = {an_4, {5{shifter}}};
    wire signed [23-1:0] an_4_shift_7 = {an_4, {7{shifter}}};
    // n-5
    wire signed [21-1:0] an_5_shift_5 = {an_5, {5{shifter}}};
    // sub expression
    wire signed [19-1:0] x_1 = {an_1_shift_2[17], an_1_shift_2} - {{3{an_3[15]}}, an_3} - {{3{an_4[15]}}, an_4} - {{3{an_5[15]}}, an_5};
    wire signed [26-1:0] x_2 = {an_1_shift_9[24], an_1_shift_9} - {{6{an_2_shift_4[19]}}, an_2_shift_4};
    wire signed [17-1:0] x_3 = {an_6[15], an_6} - {an_2[15], an_2};
    wire signed [24-1:0] x_4 = {{2{an_3_shift_6[21]}}, an_3_shift_6} - {{3{an_4_shift_5[20]}}, an_4_shift_5} + {an_4_shift_7[22], an_4_shift_7} + {{3{an_5_shift_5[20]}}, an_5_shift_5};
    // total sum
    wire signed [31-1:0] sum = {{15{x_3[16]}}, x_3} - {{13{x_3[16]}}, x_3, {2{shifter}}} - {{5{x_3[16]}}, x_3, {10{shifter}}} + {{13{x_1[18]}}, x_1}
                                + {{10{x_1[18]}}, x_1, {3{shifter}}} - {{3{x_3[16]}}, x_3, {12{shifter}}} + {{6{x_2[25]}}, x_2} - {{4{x_2[25]}}, x_2, {2{shifter}}}
                                + {{8{x_4[23]}}, x_4} + {{2{x_4[23]}}, x_4, {6{shifter}}} + {{9{an_1[15]}}, an_1, {7{shifter}}} - {{7{an_3[15]}}, an_3, {9{shifter}}}
                                + {{7{an_4[15]}}, an_4, {9{shifter}}} + {{8{an_5[15]}}, an_5, {8{shifter}}} + {{11{an_6[15]}}, an_6, {5{shifter}}};
    wire signed [26-1:0] rounded = sum[30:5] + sum[4];
    DFF_26bit DFF6(.clk(clk), .rstn(reset), .d(rounded), .q(b));
endmodule
