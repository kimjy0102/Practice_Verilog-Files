`timescale 1 ns / 1 ps
module carry_select_adder_28b_adder_28b_2stage(
    output [29-1:0] sum,
    input [28-1:0] a,
    input [28-1:0] b,
    input cin,
    input clk,
    input rstn);

    wire [28-1:0] a_q, b_q;
    wire [6-1:0] c0, c1;
    wire [6-1:0] c;
    wire [24-1:0] sum_d0, sum_d1;
    wire [29-1:0] sum_d;
    wire c_in_0, c_in_1;
    wire       c_q1, c_q4, c_q5, c_q6, c_q7, c_q8, c_q9, c_q10, c_q11, c_q12, c_q13;
    wire [3:0] temp_sum_d0, temp_sum_d1;
    wire [3:0] temp2_q0, temp2_q1, temp3_q0, temp3_q1, temp4_q0, temp4_q1, temp5_q0, temp5_q1, temp6_q0, temp6_q1;

    DFF_28bit DFF0(.q(a_q), .d(a), .clk(clk), .rstn(rstn));
    DFF_28bit DFF1(.q(b_q), .d(b), .clk(clk), .rstn(rstn));
    // DFF for 0 and 1
    DFF_1bit DFF29(.q(c_in_0), .d(1'b0), .clk(clk), .rstn(rstn));
    DFF_1bit DFF30(.q(c_in_1), .d(1'b1), .clk(clk), .rstn(rstn));
    //Stage_0_4bit
    full_adder_4b STAGE_0_FA0(.sum(temp_sum_d0), .c_out(c[0]), .a(a_q[3:0]), .b(b_q[3:0]), .c_in(cin));
    // Add DFF at sum of stage 0
    DFF_4bit DFF3(.q(sum_d[3:0]), .d(temp_sum_d0), .clk(clk), .rstn(rstn));

    //Stage_1_4bit
    full_adder_4b STAGE_1_FA0(.sum(sum_d0[3:0]), .c_out(c0[0]), .a(a_q[7:4]), .b(b_q[7:4]), .c_in(c_in_0));
    full_adder_4b STAGE_1_FA1(.sum(sum_d1[3:0]), .c_out(c1[0]), .a(a_q[7:4]), .b(b_q[7:4]), .c_in(c_in_1));
 
    mux_2to1_4b STAGE_1_M0(.out(temp_sum_d1), .i0(sum_d0[3:0]), .i1(sum_d1[3:0]), .sel(c[0]));
    mux_2to1_1b STAGE_1_M1(.out(c[1]), .i0(c0[0]), .i1(c1[0]), .sel(c[0]));
    // Add DFF at sum of stage 1 and c_out
    DFF_4bit DFF4(.q(sum_d[7:4]), .d(temp_sum_d1), .clk(clk), .rstn(rstn));
    DFF_1bit DFF5(.q(c_q1), .d(c[1]), .clk(clk), .rstn(rstn));

    //Stage_2_4bit
    full_adder_4b STAGE_2_FA0(.sum(sum_d0[7:4]), .c_out(c0[1]), .a(a_q[11:8]), .b(b_q[11:8]), .c_in(c_in_0));
    full_adder_4b STAGE_2_FA1(.sum(sum_d1[7:4]), .c_out(c1[1]), .a(a_q[11:8]), .b(b_q[11:8]), .c_in(c_in_1));
    // ADD 2 4bit DFF of sum and add 2 1bit DFF of c_out 
    DFF_4bit DFF9(.q(temp2_q0), .d(sum_d0[7:4]), .clk(clk), .rstn(rstn));
    DFF_4bit DFF10(.q(temp2_q1), .d(sum_d1[7:4]), .clk(clk), .rstn(rstn));
    DFF_1bit DFF11(.q(c_q4), .d(c0[1]), .clk(clk), .rstn(rstn));
    DFF_1bit DFF12(.q(c_q5), .d(c1[1]), .clk(clk), .rstn(rstn));

    mux_2to1_4b STAGE_2_M0(.out(sum_d[11:8]), .i0(temp2_q0), .i1(temp2_q1), .sel(c_q1));
    mux_2to1_1b STAGE_2_M1(.out(c[2]), .i0(c_q4), .i1(c_q5), .sel(c_q1));

    //Stage_3_4bit
    full_adder_4b STAGE_3_FA0(.sum(sum_d0[11:8]), .c_out(c0[2]), .a(a_q[15:12]), .b(b_q[15:12]), .c_in(c_in_0));
    full_adder_4b STAGE_3_FA1(.sum(sum_d1[11:8]), .c_out(c1[2]), .a(a_q[15:12]), .b(b_q[15:12]), .c_in(c_in_1));
    // ADD 2 4bit DFF of sum and add 2 1bit DFF of c_out 
    DFF_4bit DFF13(.q(temp3_q0), .d(sum_d0[11:8]), .clk(clk), .rstn(rstn));
    DFF_4bit DFF14(.q(temp3_q1), .d(sum_d1[11:8]), .clk(clk), .rstn(rstn));
    DFF_1bit DFF15(.q(c_q6), .d(c0[2]), .clk(clk), .rstn(rstn));
    DFF_1bit DFF16(.q(c_q7), .d(c1[2]), .clk(clk), .rstn(rstn));

    mux_2to1_4b STAGE_3_M0(.out(sum_d[15:12]), .i0(temp3_q0), .i1(temp3_q1), .sel(c[2]));
    mux_2to1_1b STAGE_3_M1(.out(c[3]), .i0(c_q6), .i1(c_q7), .sel(c[2]));

    //Stage_4_4bit
    full_adder_4b STAGE_4_FA0(.sum(sum_d0[15:12]), .c_out(c0[3]), .a(a_q[19:16]), .b(b_q[19:16]), .c_in(c_in_0));
    full_adder_4b STAGE_4_FA1(.sum(sum_d1[15:12]), .c_out(c1[3]), .a(a_q[19:16]), .b(b_q[19:16]), .c_in(c_in_1));
    // ADD 2 4bit DFF of sum and add 2 1bit DFF of c_out 
    DFF_4bit DFF17(.q(temp4_q0), .d(sum_d0[15:12]), .clk(clk), .rstn(rstn));
    DFF_4bit DFF18(.q(temp4_q1), .d(sum_d1[15:12]), .clk(clk), .rstn(rstn));
    DFF_1bit DFF19(.q(c_q8), .d(c0[3]), .clk(clk), .rstn(rstn));
    DFF_1bit DFF20(.q(c_q9), .d(c1[3]), .clk(clk), .rstn(rstn));

    mux_2to1_4b STAGE_4_M0(.out(sum_d[19:16]), .i0(temp4_q0), .i1(temp4_q1), .sel(c[3]));
    mux_2to1_1b STAGE_4_M1(.out(c[4]), .i0(c_q8), .i1(c_q9), .sel(c[3]));

    //Stage_5_4bit
    full_adder_4b STAGE_5_FA0(.sum(sum_d0[19:16]), .c_out(c0[4]), .a(a_q[23:20]), .b(b_q[23:20]), .c_in(c_in_0));
    full_adder_4b STAGE_5_FA1(.sum(sum_d1[19:16]), .c_out(c1[4]), .a(a_q[23:20]), .b(b_q[23:20]), .c_in(c_in_1));
    // ADD 2 4bit DFF of sum and add 2 1bit DFF of c_out 
    DFF_4bit DFF21(.q(temp5_q0), .d(sum_d0[19:16]), .clk(clk), .rstn(rstn));
    DFF_4bit DFF22(.q(temp5_q1), .d(sum_d1[19:16]), .clk(clk), .rstn(rstn));
    DFF_1bit DFF23(.q(c_q10), .d(c0[4]), .clk(clk), .rstn(rstn));
    DFF_1bit DFF24(.q(c_q11), .d(c1[4]), .clk(clk), .rstn(rstn));

    mux_2to1_4b STAGE_5_M0(.out(sum_d[23:20]), .i0(temp5_q0), .i1(temp5_q1), .sel(c[4]));
    mux_2to1_1b STAGE_5_M1(.out(c[5]), .i0(c_q10), .i1(c_q11), .sel(c[4]));

    //Stage_6_4bit
    full_adder_4b STAGE_6_FA0(.sum(sum_d0[23:20]), .c_out(c0[5]), .a(a_q[27:24]), .b(b_q[27:24]), .c_in(c_in_0));
    full_adder_4b STAGE_6_FA1(.sum(sum_d1[23:20]), .c_out(c1[5]), .a(a_q[27:24]), .b(b_q[27:24]), .c_in(c_in_1));
    // ADD 2 4bit DFF of sum and add 2 1bit DFF of c_out 
    DFF_4bit DFF25(.q(temp6_q0), .d(sum_d0[23:20]), .clk(clk), .rstn(rstn));
    DFF_4bit DFF26(.q(temp6_q1), .d(sum_d1[23:20]), .clk(clk), .rstn(rstn));
    DFF_1bit DFF27(.q(c_q12), .d(c0[5]), .clk(clk), .rstn(rstn));
    DFF_1bit DFF28(.q(c_q13), .d(c1[5]), .clk(clk), .rstn(rstn));

    mux_2to1_4b STAGE_6_M0(.out(sum_d[27:24]), .i0(temp6_q0), .i1(temp6_q1), .sel(c[5]));
    mux_2to1_1b STAGE_6_M1(.out(sum_d[28]), .i0(c_q12), .i1(c_q13), .sel(c[5]));

    DFF_29bit DFF2(.q(sum), .d(sum_d), .clk(clk), .rstn(rstn));
 
    endmodule
