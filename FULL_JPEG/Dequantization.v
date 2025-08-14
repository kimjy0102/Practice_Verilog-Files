module Dequantization(
    input signed [8*8-1:0] data_in,
    output signed [8*12-1:0] data_out,
    input [15-1:0] cnt_in
);
    reg [7-1:0] x0, x1, x2, x3, x4, x5;// x6, x7;
    // sign extension
    wire signed [15-1:0] d0;
    wire signed [15-1:0] d1;
    wire signed [15-1:0] d2;
    wire signed [15-1:0] d3;
    wire signed [15-1:0] d4;
    wire signed [15-1:0] d5;
    //wire signed [15-1:0] d6;
    //wire signed [15-1:0] d7;
    // result
    wire signed [12-1:0] result0;
    wire signed [12-1:0] result1;
    wire signed [12-1:0] result2;
    wire signed [12-1:0] result3;
    wire signed [12-1:0] result4;
    wire signed [12-1:0] result5;
    //wire signed [12-1:0] result6;
    //wire signed [12-1:0] result7;
    always @(*) begin
        if (cnt_in[2:0] == 3'b100) begin
            x0 = 7'b0010000;
            x1 = 7'b0001011;
            x2 = 7'b0001010;
            x3 = 7'b0010000;
            x4 = 7'b0011000;
            x5 = 7'b0101000;
            //x6 = 7'b0000000;
            //x7 = 7'b0000000;
        end
        else if (cnt_in[2:0] == 3'b101) begin
            x0 = 7'b0001100;
            x1 = 7'b0001100;
            x2 = 7'b0001110;
            x3 = 7'b0010011;
            x4 = 7'b0011010;
            x5 = 7'b0111010;
            //x6 = 7'b0000000;
            //x7 = 7'b0000000;
        end
        else if (cnt_in[2:0] == 3'b110) begin
            x0 = 7'b0001110;
            x1 = 7'b0001101;
            x2 = 7'b0010000;
            x3 = 7'b0011000;
            x4 = 7'b0101000;
            x5 = 7'b0111001;
            //x6 = 7'b0000000;
            //x7 = 7'b0000000;
        end
        else if (cnt_in[2:0] ==3'b111) begin
            x0 = 7'b0001110; 
            x1 = 7'b0010001;
            x2 = 7'b0010110;
            x3 = 7'b0011101;
            x4 = 7'b0110011;
            x5 = 7'b1010111;
            //x6 = 7'b0000000;
            //x7 = 7'b0000000;
        end
        else if (cnt_in[2:0] ==3'b000) begin
            x0 = 7'b0010010; 
            x1 = 7'b0010110;
            x2 = 7'b0100101;
            x3 = 7'b0111000;
            x4 = 7'b1000100;
            x5 = 7'b0000000;
            //x6 = 7'b0000000;
            //x7 = 7'b0000000;
        end
        else if (cnt_in[2:0] ==3'b001) begin
            x0 = 7'b0011000;
            x1 = 7'b0100011;
            x2 = 7'b0110111;
            x3 = 7'b1000000;
            x4 = 7'b0000000;
            x5 = 7'b0000000;
            //x6 = 7'b0000000;
            //x7 = 7'b0000000;
        end
        else if (cnt_in[2:0] ==3'b010) begin
            x0 = 7'b000000;
            x1 = 7'b000000;
            x2 = 7'b000000;
            x3 = 7'b000000;
            x4 = 7'b000000;
            x5 = 7'b000000;
            //x6 = 7'b000000;
            //x7 = 7'b000000;
        end
        else if (cnt_in[2:0] ==3'b011) begin
            x0 = 7'b000000;
            x1 = 7'b000000;
            x2 = 7'b000000;
            x3 = 7'b000000;
            x4 = 7'b000000;
            x5 = 7'b000000;
            //x6 = 7'b000000;
            //x7 = 7'b000000;
        end
    end
    // quantization operation
    assign d0 = {{7{data_in[8*8-1]}}, data_in[8*8-1:8*7]} * $signed(x0);
    assign d1 = {{7{data_in[8*7-1]}}, data_in[8*7-1:8*6]} * $signed(x1);
    assign d2 = {{7{data_in[8*6-1]}}, data_in[8*6-1:8*5]} * $signed(x2);
    assign d3 = {{7{data_in[8*5-1]}}, data_in[8*5-1:8*4]} * $signed(x3);
    assign d4 = {{7{data_in[8*4-1]}}, data_in[8*4-1:8*3]} * $signed(x4);
    assign d5 = {{7{data_in[8*3-1]}}, data_in[8*3-1:8*2]} * $signed(x5);
    //assign d6 = {{7{data_in[8*2-1]}}, data_in[8*2-1:8*1]} * $signed(x6);
    //assign d7 = {{7{data_in[8*1-1]}}, data_in[8*1-1:8*0]} * $signed(x7);
    // output data
    assign result0 = d0[11:0]; // DC = 12.0
    assign result1 = d1[11:0]; // AC = 12.-2
    assign result2 = d2[11:0]; 
    assign result3 = d3[11:0]; 
    assign result4 = d4[11:0]; 
    assign result5 = d5[11:0]; 
    //assign result6 = d6[11:0]; 
    //assign result7 = d7[11:0]; 
    // assign output
    assign data_out = {result0, result1, result2, result3, result4, result5, 12'b0, 12'b0};

    
endmodule
