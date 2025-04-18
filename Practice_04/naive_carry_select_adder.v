`timescale 1 ns / 1 ps
module naive_carry_select_adder_28b(
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


    DFF_28bit DFF0(.q(a_q), .d(a), .clk(clk), .rstn(rstn));
    DFF_28bit DFF1(.q(b_q), .d(b), .clk(clk), .rstn(rstn));

    //Stage_0_4bit
    full_adder_4b STAGE_0_FA0(.sum(sum_d[3:0]), .c_out(c[0]), .a(a_q[3:0]), .b(b_q[3:0]), .c_in(cin));

    //Stage_1_4bit
    full_adder_4b STAGE_1_FA0(.sum(sum_d0[3:0]), .c_out(c0[0]), .a(a_q[7:4]), .b(b_q[7:4]), .c_in(1'b0));
    full_adder_4b STAGE_1_FA1(.sum(sum_d1[3:0]), .c_out(c1[0]), .a(a_q[7:4]), .b(b_q[7:4]), .c_in(1'b1));

    mux_2to1_4b STAGE_1_M0(.out(sum_d[7:4]), .i0(sum_d0[3:0]), .i1(sum_d1[3:0]), .sel(c[0]));
    mux_2to1_1b STAGE_1_M1(.out(c[1]), .i0(c0[0]), .i1(c1[0]), .sel(c[0]));

    //Stage_2_4bit
    full_adder_4b STAGE_2_FA0(.sum(sum_d0[7:4]), .c_out(c0[1]), .a(a_q[11:8]), .b(b_q[11:8]), .c_in(1'b0));
    full_adder_4b STAGE_2_FA1(.sum(sum_d1[7:4]), .c_out(c1[1]), .a(a_q[11:8]), .b(b_q[11:8]), .c_in(1'b1));

    mux_2to1_4b STAGE_2_M0(.out(sum_d[11:8]), .i0(sum_d0[7:4]), .i1(sum_d1[7:4]), .sel(c[1]));
    mux_2to1_1b STAGE_2_M1(.out(c[2]), .i0(c0[1]), .i1(c1[1]), .sel(c[1]));

    //Stage_3_4bit
    full_adder_4b STAGE_3_FA0(.sum(sum_d0[11:8]), .c_out(c0[2]), .a(a_q[15:12]), .b(b_q[15:12]), .c_in(1'b0));
    full_adder_4b STAGE_3_FA1(.sum(sum_d1[11:8]), .c_out(c1[2]), .a(a_q[15:12]), .b(b_q[15:12]), .c_in(1'b1));

    mux_2to1_4b STAGE_3_M0(.out(sum_d[15:12]), .i0(sum_d0[11:8]), .i1(sum_d1[11:8]), .sel(c[2]));
    mux_2to1_1b STAGE_3_M1(.out(c[3]), .i0(c0[2]), .i1(c1[2]), .sel(c[2]));

    //Stage_4_4bit
    full_adder_4b STAGE_4_FA0(.sum(sum_d0[15:12]), .c_out(c0[3]), .a(a_q[19:16]), .b(b_q[19:16]), .c_in(1'b0));
    full_adder_4b STAGE_4_FA1(.sum(sum_d1[15:12]), .c_out(c1[3]), .a(a_q[19:16]), .b(b_q[19:16]), .c_in(1'b1));

    mux_2to1_4b STAGE_4_M0(.out(sum_d[19:16]), .i0(sum_d0[15:12]), .i1(sum_d1[15:12]), .sel(c[3]));
    mux_2to1_1b STAGE_4_M1(.out(c[4]), .i0(c0[3]), .i1(c1[3]), .sel(c[3]));

    //Stage_5_4bit
    full_adder_4b STAGE_5_FA0(.sum(sum_d0[19:16]), .c_out(c0[4]), .a(a_q[23:20]), .b(b_q[23:20]), .c_in(1'b0));
    full_adder_4b STAGE_5_FA1(.sum(sum_d1[19:16]), .c_out(c1[4]), .a(a_q[23:20]), .b(b_q[23:20]), .c_in(1'b1));

    mux_2to1_4b STAGE_5_M0(.out(sum_d[23:20]), .i0(sum_d0[19:16]), .i1(sum_d1[19:16]), .sel(c[4]));
    mux_2to1_1b STAGE_5_M1(.out(c[5]), .i0(c0[4]), .i1(c1[4]), .sel(c[4]));

    //Stage_6_4bit
    full_adder_4b STAGE_6_FA0(.sum(sum_d0[23:20]), .c_out(c0[5]), .a(a_q[27:24]), .b(b_q[27:24]), .c_in(1'b0));
    full_adder_4b STAGE_6_FA1(.sum(sum_d1[23:20]), .c_out(c1[5]), .a(a_q[27:24]), .b(b_q[27:24]), .c_in(1'b1));

    mux_2to1_4b STAGE_6_M0(.out(sum_d[27:24]), .i0(sum_d0[23:20]), .i1(sum_d1[23:20]), .sel(c[5]));
    mux_2to1_1b STAGE_6_M1(.out(sum_d[28]), .i0(c0[5]), .i1(c1[5]), .sel(c[5]));

    DFF_29bit DFF2(.q(sum), .d(sum_d), .clk(clk), .rstn(rstn));
 
    endmodule