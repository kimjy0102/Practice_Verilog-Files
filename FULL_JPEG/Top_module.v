module top_jpeg(
    input clk,
    input reset, 
    input [8*8-1:0] data_in,
    output [8*8-1:0] data_out,
    output reg [15-1:0] address_in,
    output [15-1:0] address_out
);
    // counter for all 
    reg [8*12-1:0] dequant_out_q;
    always @(posedge clk) begin
        if (!reset) begin
            address_in <= 15'b0000_0000_0000_000;
        end else begin
            address_in <= address_in + 1;
        end
    end
    
    // 2D DCT
    wire [8*12-1:0] dct_2d_out;
    Full_dct DCT(.clk(clk), .reset(reset), .data_in(data_in), .cnt_in(address_in), .data_out(dct_2d_out)); // first data out at cnt 19
    // quantization
    wire [8*8-1:0] Quant_out;
    Quantization Quant(.clk(clk), .reset(reset), .data_in(dct_2d_out), .data_out(Quant_out), .cnt_in(address_in));  // first data out at cnt 19
    // zigzag 
    wire [8*64-1:0] Zigzag_out;
    zigzag Zigzag(.data_in(Quant_out), .data_out(Zigzag_out), .cnt_in(address_in)); // first data out at cnt 26
    // encoding
    // counter -> use address_in[2:0] 
    reg [8*64-1:0] encoder_in;
    always @(posedge clk) begin // at 26, d-> q 
        if (!reset) begin
            encoder_in <= 0;
        end
        else begin
            if ( address_in[2:0] == 3'b010)
                encoder_in <= Zigzag_out;
            else
                encoder_in <= encoder_in;
        end
    end
    wire [14*64-1:0] encoded_out;
    wire [14*64-1:0] temp_decoder_out;
    RLE_enhanced RLE(.clk(clk), .reset(reset), .data_in(encoder_in), .address_in(address_in[2:0]), .encoded_data(encoded_out)); // first data in at 27, out at 34
    //RLE RLE(.data_in(Zigzag_out), .encoded_data(encoded_out)); // first data in at 26  
    reg [14*64-1:0] encoded_out_q;
    always @(posedge clk) begin // data out at 34, d-> q
        if (!reset) begin
            encoded_out_q <= 0;
        end
        else begin
            if (address_in[2:0] == 3'b010)
                encoded_out_q <= encoded_out;
            else
                //encoded_out_q <= encoded_out_q;
                encoded_out_q <= temp_decoder_out;
        end
    end
    // decoding
    //wire [8*64-1:0] decoded_out;
    wire [8*8-1:0] decode_result;
    decoder_enhanced Decoder_enh(.data_in(encoded_out_q), .data_out(temp_decoder_out), .result_out(decode_result)); // start at 35 end at 42
    reg [8*64-1:0] decoded_out;
    reg [8*64-1:0] decoded_confirm;
    always @(posedge clk) begin
        if (!reset) begin
            decoded_out <= 0;
        end
        else begin
            if ( address_in[2:0] == 3'b011) begin // 35 // 43
                decoded_out[8*64-1:8*56] <= decode_result;
                decoded_confirm <= decoded_out;
            end
            else if (address_in[2:0] == 3'b100) // 36
                decoded_out[8*56-1:8*48] <= decode_result;
            else if (address_in[2:0] == 3'b101) // 37
                decoded_out[8*48-1:8*40] <= decode_result;
            else if (address_in[2:0] == 3'b110) // 38
                decoded_out[8*40-1:8*32] <= decode_result;
            else if (address_in[2:0] == 3'b111) // 39
                decoded_out[8*32-1:8*24] <= decode_result;
            else if (address_in[2:0] == 3'b000) // 40
                decoded_out[8*24-1:8*16] <= decode_result;
            else if (address_in[2:0] == 3'b001) // 41
                decoded_out[8*16-1:8*8] <= decode_result;
            else if (address_in[2:0] == 3'b010) // 42
                decoded_out[8*8-1:8*0] <= decode_result;
        end
    end
    //decoder_full Decoder(.data_in(encoded_out_q), .data_out(decoded_out));    // first data in at cnt 35
    // inverse zigzag
    wire [8*8-1:0] inverse_zigzag_out;
    inverse_zigzag Inverse_Zigzag(.data_in(decoded_confirm), .data_out(inverse_zigzag_out), .address_in(address_in));   // first data in, out at cnt 44, first block done at 51
    // Dequantization
    wire [8*12-1:0] Dequant_out;
    Dequantization Dequant(.data_in(inverse_zigzag_out), .data_out(Dequant_out), .cnt_in(address_in)); // first data out at 44
    // add dff
    always @(posedge clk) begin
        if (!reset) begin
            dequant_out_q <= 96'b0;
        end else begin
            dequant_out_q <= Dequant_out;
        end
    end
    // Inverse DCT starts at 45
    Full_idct IDCT(.clk(clk), .reset(reset), .data_in(dequant_out_q), .data_out(data_out), .cnt_in(address_in), .cnt_out(address_out));    
endmodule