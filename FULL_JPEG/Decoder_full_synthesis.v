module decoder_enhanced_synthesis(
    input clk,
    input reset,
    input [14*64-1:0] data_in,
    output reg [14*64-1:0] data_out,
    output reg [8*8-1:0] result_out
);
    reg [14*64-1:0] data_in_q;
    wire [14*64-1:0] data_out_d;
    wire [8*8-1:0] result_out_d;
    wire [14*64-1:0] temp_01;
    wire [14*64-1:0] temp_02;
    wire [14*64-1:0] temp_03;
    wire [14*64-1:0] temp_04;
    wire [14*64-1:0] temp_05;
    wire [14*64-1:0] temp_06;
    wire [14*64-1:0] temp_07;
    decoder_sub D0(.data_in(data_in), .result(result_out_d[8*8-1:8*7]), .data_out(temp_01));
    decoder_sub D1(.data_in(temp_01), .result(result_out_d[8*7-1:8*6]), .data_out(temp_02));
    decoder_sub D2(.data_in(temp_02), .result(result_out_d[8*6-1:8*5]), .data_out(temp_03));
    decoder_sub D3(.data_in(temp_03), .result(result_out_d[8*5-1:8*4]), .data_out(temp_04));
    decoder_sub D4(.data_in(temp_04), .result(result_out_d[8*4-1:8*3]), .data_out(temp_05));
    decoder_sub D5(.data_in(temp_05), .result(result_out_d[8*3-1:8*2]), .data_out(temp_06));
    decoder_sub D6(.data_in(temp_06), .result(result_out_d[8*2-1:8*1]), .data_out(temp_07));
    decoder_sub D7(.data_in(temp_07), .result(result_out_d[8*1-1:8*0]), .data_out(data_out_d));    
    always @(posedge clk) begin
        if (!reset) begin
            data_in_q <= 0;
            result_out <= 0;
            data_out <= 0;
        end else begin
            data_in_q <= data_in;
            data_out <= data_out_d;
            result_out <= result_out_d;
        end
    end
endmodule
