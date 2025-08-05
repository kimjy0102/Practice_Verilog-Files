module Quantization(
    input clk,
    input reset,
    input [8*12-1:0] data_in,
    output [8*8-1:0] data_out,
    input [15-1:0] cnt_in
);
    // Quantization number variables
    reg [6-1:0] x0, x1, x2, x3, x4, x5;// x6, x7;
    reg flag; // flag for dc value
    // sign extension
    wire signed [18-1:0] d0;
    wire signed [18-1:0] d1;
    wire signed [18-1:0] d2;
    wire signed [18-1:0] d3;
    wire signed [18-1:0] d4;
    wire signed [18-1:0] d5;
    //wire signed [18-1:0] d6;
    //wire signed [18-1:0] d7;
    // result
    wire signed [8-1:0] result0;
    wire signed [8-1:0] result1;
    wire signed [8-1:0] result2;
    wire signed [8-1:0] result3;
    wire signed [8-1:0] result4;
    wire signed [8-1:0] result5;
    //wire signed [8-1:0] result6;
    //wire signed [8-1:0] result7;
    always @(*) begin
        if (cnt_in[2:0] == 3'b011) begin
            flag = 1'b1; // flag for dc value
            x0 = 6'b100000;
            x1 = 6'b101110;
            x2 = 6'b110011;
            x3 = 6'b100000;
            x4 = 6'b010101;
            x5 = 6'b001100;
            //x6 = 6'b000000;
            //x7 = 6'b000000;
        end
        else if (cnt_in[2:0] == 3'b100) begin
            flag = 1'b0; // flag for dc value
            x0 = 6'b101010;
            x1 = 6'b101010;
            x2 = 6'b100100;
            x3 = 6'b011010;
            x4 = 6'b010011;
            x5 = 6'b001000;
            //x6 = 6'b000000;
            //x7 = 6'b000000;
        end
        else if (cnt_in[2:0] == 3'b101) begin
            flag = 1'b0;
            x0 = 6'b100100;
            x1 = 6'b100111;
            x2 = 6'b100000;
            x3 = 6'b010101;
            x4 = 6'b001100;
            x5 = 6'b001000;
            //x6 = 6'b000000;
            //x7 = 6'b000000;
        end
        else if (cnt_in[2:0] ==3'b110) begin
            flag = 1'b0;
            x0 = 6'b100100; 
            x1 = 6'b011110;
            x2 = 6'b010111;
            x3 = 6'b010001;
            x4 = 6'b001010;
            x5 = 6'b000101;
            //x6 = 6'b000000;
            //x7 = 6'b000000;
        end
        else if (cnt_in[2:0] ==3'b111) begin
            flag = 1'b0;
            x0 = 6'b011100; 
            x1 = 6'b010111;
            x2 = 6'b001101;
            x3 = 6'b001001;
            x4 = 6'b000111;
            x5 = 6'b000000;
            //x6 = 6'b000000;
            //x7 = 6'b000000;
        end
        else if (cnt_in[2:0] ==3'b000) begin
            flag = 1'b0;
            x0 = 6'b010101;
            x1 = 6'b001110;
            x2 = 6'b001001;
            x3 = 6'b001000;
            x4 = 6'b000000;
            x5 = 6'b000000;
            //x6 = 6'b000000;
            //x7 = 6'b000000;
        end
        else if (cnt_in[2:0] ==3'b001) begin
            flag = 1'b0;
            x0 = 6'b000000;
            x1 = 6'b000000;
            x2 = 6'b000000;
            x3 = 6'b000000;
            x4 = 6'b000000;
            x5 = 6'b000000;
            //x6 = 6'b000000;
            //x7 = 6'b000000;
        end
        else if (cnt_in[2:0] ==3'b010) begin
            flag = 1'b0;
            x0 = 6'b000000;
            x1 = 6'b000000;
            x2 = 6'b000000;
            x3 = 6'b000000;
            x4 = 6'b000000;
            x5 = 6'b000000;
            //x6 = 6'b000000;
            //x7 = 6'b000000;
        end
    end
    // quantization operation
    assign d0 = {{6{data_in[12*8-1]}}, data_in[12*8-1:12*7]} * $signed(x0);
    assign d1 = {{6{data_in[12*7-1]}}, data_in[12*7-1:12*6]} * $signed(x1);
    assign d2 = {{6{data_in[12*6-1]}}, data_in[12*6-1:12*5]} * $signed(x2);
    assign d3 = {{6{data_in[12*5-1]}}, data_in[12*5-1:12*4]} * $signed(x3);
    assign d4 = {{6{data_in[12*4-1]}}, data_in[12*4-1:12*3]} * $signed(x4);
    assign d5 = {{6{data_in[12*3-1]}}, data_in[12*3-1:12*2]} * $signed(x5);
    //assign d6 = {{6{data_in[12*2-1]}}, data_in[12*2-1:12*1]} * $signed(x6);
    //assign d7 = {{6{data_in[12*1-1]}}, data_in[12*1-1:12*0]} * $signed(x7);
    // output data
    assign result0 = flag ? d0[16:9] + d0[8] : {d0[17], d0[17:11]} + d0[10];
    assign result1 = {d1[17], d1[17:11]} + d1[10];
    assign result2 = {d2[17], d2[17:11]} + d2[10];
    assign result3 = {d3[17], d3[17:11]} + d3[10];
    assign result4 = {d4[17], d4[17:11]} + d4[10];
    assign result5 = {d5[17], d5[17:11]} + d5[10];
    //assign result6 = {d6[17], d6[17:11]} + d6[10];
    //assign result7 = {d7[17], d7[17:11]} + d7[10];
    // assign output
    assign data_out = {result0, result1, result2, result3, result4, result5, 8'b0, 8'b0};

    
endmodule