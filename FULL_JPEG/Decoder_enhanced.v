module decoder_enhanced(
    input [14*64-1:0] data_in,
    output [14*64-1:0] data_out,
    output [8*8-1:0] result_out
);
    wire [14*64-1:0] temp_01;
    wire [14*64-1:0] temp_02;
    wire [14*64-1:0] temp_03;
    wire [14*64-1:0] temp_04;
    wire [14*64-1:0] temp_05;
    wire [14*64-1:0] temp_06;
    wire [14*64-1:0] temp_07;
    decoder_sub D0(.data_in(data_in), .result(result_out[8*8-1:8*7]), .data_out(temp_01));
    decoder_sub D1(.data_in(temp_01), .result(result_out[8*7-1:8*6]), .data_out(temp_02));
    decoder_sub D2(.data_in(temp_02), .result(result_out[8*6-1:8*5]), .data_out(temp_03));
    decoder_sub D3(.data_in(temp_03), .result(result_out[8*5-1:8*4]), .data_out(temp_04));
    decoder_sub D4(.data_in(temp_04), .result(result_out[8*4-1:8*3]), .data_out(temp_05));
    decoder_sub D5(.data_in(temp_05), .result(result_out[8*3-1:8*2]), .data_out(temp_06));
    decoder_sub D6(.data_in(temp_06), .result(result_out[8*2-1:8*1]), .data_out(temp_07));
    decoder_sub D7(.data_in(temp_07), .result(result_out[8*1-1:8*0]), .data_out(data_out));    
endmodule

module decoder_sub(
    input [14*64-1:0] data_in,
    output [8-1:0] result,
    output [14*64-1:0] data_out
);
    wire [8-1:0] value;
    wire [6-1:0] zero_count;
    assign zero_count = data_in[14*64-1:14*64-6];
    assign value = data_in[14*64-7:14*63];
    assign result = (zero_count == 0) ? value : 8'b0;
    assign data_out = (zero_count == 0) ? (data_in << 14) : {(zero_count-1), value, data_in[14*63-1:0]};

endmodule