module Full_dct_synthesis(
    input clk,
    input reset,
    input [8*8-1:0] data_in,
    output reg [8*12-1:0] data_out,
    output reg [15-1:0] cnt_in,
    output reg [15-1:0] cnt_out
);
    // for synthesis 
    reg [8*8-1:0] data_in_q;
    wire [8*12-1:0] data_out_d;
    // address of sram and counter;
    reg TP1_enable;
    reg TP2_enable;
    reg TP1_reset, TP2_reset;
    wire [8*8-1:0] DCT_1D_out;
    wire enable_0, enable_2;
    reg out_enable;
    wire [6*12-1:0] DCT_2D_out;
    // output of first tpmem is 8*8 bits
    wire [8*8-1:0] TP_0_out;
    // 2nd DCT 
    wire dc_enable;
    // output of second tpmem is 8*12 bits
    wire [8*12-1:0] TP_2_out;
    always @(posedge clk) begin
        if (!reset) begin
            cnt_in <= 15'b0000_0000_0000_000;
            TP1_enable <= 1'b0;
            TP2_enable <= 1'b0;
            out_enable <= 1'b0;
            TP1_reset <= 1'b0;
            TP2_reset <= 1'b0;
        end
        else begin
            cnt_in <= cnt_in + 1;
            if (cnt_in == 15'b000_0000_0001_0010) begin
                out_enable <= 1'b1;
            end
            if (cnt_in[3:0] == 4'b0000) begin
                TP1_enable <= 1'b1;
                TP1_reset <= 1'b1;
            end 
            else if (cnt_in[3:0] == 4'b1001) begin
                TP2_enable <= 1'b1;
                TP2_reset <= 1'b1;
            end
            else begin
                TP1_enable <= TP1_enable;
                TP2_enable <= TP2_enable;
            end
        end
    end
    // 1d dct output
    // After the first DCT output is 8*8 bits
    DCT_1D DCT1(.data_in(data_in_q), .data_out(DCT_1D_out));

    TPmem_8bit TP0(.i_data(DCT_1D_out), .i_enable(TP1_enable), .i_clk(clk), .i_Reset(TP1_reset), .o_data(TP_0_out), .o_en(enable_0));



    // enable for 2nd DCT -> dc value 
    assign dc_enable = (cnt_in[2:0] == 3'b010) ? 1'b1 : 1'b0;
    DCT_2D DCT2(.data_in(TP_0_out), .control(dc_enable), .data_out(DCT_2D_out));
    // storage enable when counter == 10
    TPmem_updated TP2(.i_data(DCT_2D_out), .i_enable(TP2_enable), .i_clk(clk), .i_Reset(TP2_reset), .o_data(TP_2_out), .o_en(enable_2));
    // address for output memory
    always @(posedge clk) begin
        if (!out_enable) begin
            cnt_out <= 15'b000_0000_0000_0000;
        end else begin
            cnt_out <= cnt_out + 1;
        end
    end
    assign data_out_d = TP_2_out;
    // synthesis
    always @ (posedge clk) begin
        if (!reset) begin
            data_in_q <= 64'b0;
            data_out <= 96'b0;
        end else begin
            data_in_q <= data_in;
            data_out <= data_out_d;
        end
    end


endmodule
