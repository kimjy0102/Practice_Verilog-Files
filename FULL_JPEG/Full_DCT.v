module Full_dct(
    input clk,
    input reset,
    input [8*8-1:0] data_in,
    output [8*12-1:0] data_out,
    input [15-1:0] cnt_in
);
    // address of sram and counter;
    reg TP1_enable;
    reg TP2_enable;
    reg TP1_reset, TP2_reset;
    wire [8*8-1:0] DCT_1D_out;
    wire enable_0, enable_2;
    //wire [8*12-1:0] DCT_2D_out;
    wire [6*12-1:0] DCT_2D_out;
    // output of first tpmem is 8*8 bits
    wire [8*8-1:0] TP_0_out;
    // 2nd DCT
    // 2nd DCT 
    wire dc_enable; 
       // output of second tpmem is 8*12 bits
    wire [8*12-1:0] TP_2_out;
    always @(posedge clk) begin
        if (!reset) begin
            TP1_enable <= 1'b0;
            TP2_enable <= 1'b0;
            TP1_reset <= 1'b0;
            TP2_reset <= 1'b0;
        end
        else begin
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
    DCT_1D DCT1(.data_in(data_in), .data_out(DCT_1D_out));

    TPmem_8bit TP0(.i_data(DCT_1D_out), .i_enable(TP1_enable), .i_clk(clk), .i_Reset(TP1_reset), .o_data(TP_0_out), .o_en(enable_0));

    assign dc_enable = (cnt_in[2:0] == 3'b010) ? 1'b1 : 1'b0;
    DCT_2D DCT2(.data_in(TP_0_out), .control(dc_enable), .data_out(DCT_2D_out));
    // storage enable when counter == 10
    TPmem_updated TP2(.i_data(DCT_2D_out), .i_enable(TP2_enable), .i_clk(clk), .i_Reset(TP2_reset), .o_data(TP_2_out), .o_en(enable_2));
    // address for output memory
    assign data_out = TP_2_out;
endmodule
    
