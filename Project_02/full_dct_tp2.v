module full_dct_tp2(
    input clk,
    input reset,
    input [8*8-1:0] data_in,
    output reg [8*12-1:0] data_out,
    output reg [15-1:0] cnt_in,
    output reg [15-1:0] cnt_out
);
    // address of sram and counter;
    reg TP1_enable;
    reg TP2_enable;
    reg TP1_reset, TP2_reset;
    wire [8*10-1:0] DCT_1D_out;
    wire enable_0, enable1, enable_2, enable3;
    reg out_enable;
    wire [8*12-1:0] DCT_2D_out;
        // output of first tpmem is 8*9 bits
    wire [8*10-1:0] TP_0_out;
    wire [8*10-1:0] TP_1_out;
        // 2nd DCT 
    wire [8*10-1:0] DCT_2D_in;
    wire dc_enable;
    // output of second tpmem is 8*12 bits
    wire [8*12-1:0] TP_2_out;
    wire [8*12-1:0] TP_3_out;
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
            else if (cnt_in[3:0] == 4'b1000) begin
                TP1_enable <= 1'b0;
            end
            else if (cnt_in[3:0] == 4'b1001) begin
                TP2_enable <= 1'b1;
                TP2_reset <= 1'b1;
            end
            else if (cnt_in[3:0] == 4'b0001) begin
                TP2_enable <= 1'b0;
            end
            else begin
                TP1_enable <= TP1_enable;
                TP2_enable <= TP2_enable;
            end
        end
    end
    // 1d dct output
    // After the first DCT output is 8*9 bits
    DCT_1D DCT1(.data_in(data_in), .data_out(DCT_1D_out));
    // counter for TPmem -> starts when counter + 1
    // enable for tp mem counter
    // storage enable when counter == 0
    TPmem_9bit TP0(.i_data(DCT_1D_out), .i_enable(TP1_enable), .i_clk(clk), .i_Reset(TP1_reset), .o_data(TP_0_out), .o_en(enable_0));
    TPmem_9bit TP1(.i_data(DCT_1D_out), .i_enable(~TP1_enable), .i_clk(clk), .i_Reset(TP1_reset), .o_data(TP_1_out), .o_en(enable_1));
    // output of first tpmem is 8*9 bits


    // enable for 2nd DCT -> dc value 
    assign dc_enable = (cnt_in[2:0] == 3'b010) ? 1'b1 : 1'b0;
    assign DCT_2D_in = (enable_0) ? TP_0_out : TP_1_out;
    DCT_2D DCT2(.data_in(DCT_2D_in), .control(dc_enable), .data_out(DCT_2D_out));
    // storage enable when counter == 10
    TPmem TP2(.i_data(DCT_2D_out), .i_enable(TP2_enable), .i_clk(clk), .i_Reset(TP2_reset), .o_data(TP_2_out), .o_en(enable_2));
    TPmem TP3(.i_data(DCT_2D_out), .i_enable(~TP2_enable), .i_clk(clk), .i_Reset(TP2_reset), .o_data(TP_3_out), .o_en(enable_3));
    // address for output memory
    always @(posedge clk) begin
        if (!out_enable) begin
            cnt_out <= 15'b000_0000_0000_0000;
        end else begin
            cnt_out <= cnt_out + 1;
        end
    end
    assign data_out = (enable_2) ? TP_2_out : TP_3_out;
endmodule
    
