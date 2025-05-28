module top_FFT(
    output reg [24-1:0] out,
    input [24-1:0] in,
    input clk, reset
);
    // variables 
    reg [24-1:0] a_0, a_1, a_2, a_3, a_4, a_5, a_6, a_7;
    reg [24-1:0] b_0, b_1, b_2, b_3;
    reg [24-1:0] c_0, c_1;
    reg [24-1:0] d_0;
    reg [24-1:0] in_q0, in_q1, in_q2, in_q3, in_q4;
    reg [24-1:0] stage_out_0, stage_out_1, stage_out_2;
    reg [24-1:0] mux_out1, mux_out2, mux_out3, mux_out4, mux_out5, mux_out6, mux_out7, mux_out8;
    reg enable1, enable1_1, enable2, enable3;
    wire [4-1:0] mux_sel1;
    wire [3-1:0] mux_sel2;
    wire [2-1:0] mux_sel3;
    wire [24-1:0] but_out1, but_out2, but_out3, but_out4, but_out5, but_out6, but_out7, but_out8;
    wire [24-1:0] mul_out1, mul_out2, mul_out3;
    reg [24-1:0] twiddle_0, twiddle_1, twiddle_2;
    ///////// counter for butterfly mux selection ///
        // first 4-bit counter
    always @ (posedge clk) begin
        if (!reset) begin
            enable1 <= 1'b0;
        end else begin
            enable1 <= 1'b1;
        end
    end
    // one more delay to first counter
    always @ (posedge clk) begin
        if (!reset) begin
            enable1_1 <= 1'b0;
        end else begin
            if (enable1 == 1'b1) 
                enable1_1 <= 1'b1;
        end
    end 
    counter_4bit counter1(.clk(clk), .rstn(enable1_1), .out(mux_sel1)); // reset? 
        // first mux selection
    always @ (*) begin
        if ( mux_sel1[3] == 1'b0) begin
            mux_out1 = a_7;
            mux_out2 = in_q1;
            stage_out_0 = mul_out1;
        end else begin
            mux_out1 = but_out1;
            mux_out2 = but_out2;
            stage_out_0 = mux_out1;
        end
    end
        // second 3-bit counter
    always @ (posedge clk) begin
        if (!reset) begin
            enable2 <= 1'b0;
        end else begin
           if (mux_sel1 == 4'b1000)
                enable2 <= 1'b1;
        end
    end
    counter_3bit counter2(.clk(clk), .rstn(enable2), .out(mux_sel2));
        // second mux selection
    always @ (*) begin
        if (mux_sel2[2] == 1'b0) begin
            mux_out3 = b_3;
            mux_out4 = in_q2;
            stage_out_1 = mul_out2;
        end else begin
            mux_out3 = but_out3;
            mux_out4 = but_out4;
            stage_out_1 = mux_out3;
        end
    end
        // thrid 2-bit counter
    always @ (posedge clk) begin
        if (!reset) begin
            enable3 <= 1'b0;
        end else begin
            if ( mux_sel2 == 3'b100 )
                enable3 <= 1'b1;        
        end
    end
    counter_2bit counter3(.clk(clk), .rstn(enable3), .out(mux_sel3));
        // third mux selection
    always @ (*) begin
        if (mux_sel3[1] == 1'b0 ) begin
            mux_out5 = c_1;
            mux_out6 = in_q3;
            stage_out_2 = mul_out3;
        end else begin
            mux_out5 = but_out5;
            mux_out6 = but_out6;
            stage_out_2 = mux_out5;
        end
    end
        // fourth mux selection
    always @ (*) begin
        if (mux_sel3[0] == 1'b1) begin
            mux_out7 = d_0;
            mux_out8 = in_q4;
        end else begin
            mux_out7 = but_out7;
            mux_out8 = but_out8;
        end
    end
    ////////////////////////////////////////////////////
        //  butterfly unit
    Butterfly BU1(.C1(but_out1), .C2(but_out2), .A(a_7), .B(in_q1));
    Butterfly BU2(.C1(but_out3), .C2(but_out4), .A(b_3), .B(in_q2));
    Butterfly BU3(.C1(but_out5), .C2(but_out6), .A(c_1), .B(in_q3));
    Butterfly BU4(.C1(but_out7), .C2(but_out8), .A(d_0), .B(in_q4));
    ////////////////////////////////////////////////////
    // twiddle factor multiplication
        // first twiddle factor : start at 16, 8 period and 8 times -> another 0 ~ 15 counter starts at counter1 at 4'b1111
        // mux for twiddle selection -> whehter multiply by twiddle factor or not
        // twiddle unit
    Twiddle_Factor TU1(.out(mul_out1), .C(mux_out1), .T(twiddle_0));
    Twiddle_Factor TU2(.out(mul_out2), .C(mux_out3), .T(twiddle_1));
    Twiddle_Factor TU3(.out(mul_out3), .C(mux_out5), .T(twiddle_2));
        // twiddle selection
    always @ (*) begin
        case (mux_sel1[2:0])
            3'b000: begin
                twiddle_0 = 24'h400000;
            end
            3'b001: begin
                twiddle_0 = 24'h3B2E78;
            end
            3'b010: begin
                twiddle_0 = 24'h2D4D2C;
            end
            3'b011: begin
                twiddle_0 = 24'h188C4E;
            end
            3'b100: begin
                twiddle_0 = 24'h000C00;
            end
            3'b101: begin
                twiddle_0 = 24'hE78C4E;
            end
            3'b110: begin
                twiddle_0 = 24'hD2CD2C;
            end
            3'b111: begin
                twiddle_0 = 24'hC4EE78;
            end
            default: begin
                twiddle_0 = 24'h400000;
            end
        endcase
    end
    always @ (*) begin
        case (mux_sel2[1:0]) 
            2'b00: begin
                twiddle_1 = 24'h400000;
            end
            2'b01: begin
                twiddle_1 = 24'h2D4D2C;
            end
            2'b10: begin
                twiddle_1 = 24'h000C00;
            end
            2'b11: begin
                twiddle_1 = 24'hD2CD2C;
            end
            default: begin
                twiddle_1 = 24'h400000;
            end
        endcase
    end
    always @ (*) begin
        case (mux_sel3[0])
            1'b0: begin
                twiddle_2 = 24'h400000;
            end
            1'b1: begin
                twiddle_2 = 24'h000C00;
            end
            default: begin
                twiddle_2 = 24'h400000;
            end
        endcase
    end
    ////////////////////////////////////////////////////
    // input buffer
    always @ (posedge clk) begin
        if (!reset) begin
            in_q0 <= 24'b0;
        end else begin
            in_q0 <= in;
        end
    end
    always @ (posedge clk) begin
        if (!reset) begin
            in_q1 <= 24'b0;
        end else begin
            in_q1 <= in_q0;
        end
    end
    // stage 0 -> 1 buffer
    always @ (posedge clk) begin
        if (!reset) begin
            in_q2 <= 24'b0;
        end else begin
            in_q2 <= stage_out_0;
        end
    end
    // stage 1 -> 2 buffer
    always @ (posedge clk) begin
        if (!reset) begin
            in_q3 <= 24'b0;
        end else begin
            in_q3 <= stage_out_1;
        end
    end
    // stage 2 -> 3 buffer
    always @ (posedge clk) begin
        if (!reset) begin
            in_q4 <= 24'b0;
        end else begin
            in_q4 <= stage_out_2;
        end
    end
    ////////////////////////////////////////////////////
    // first stage 8 dff
    always @ (posedge clk) begin
        if (!reset) begin
            a_0 <= 24'b0;
            a_1 <= 24'b0;
            a_2 <= 24'b0;
            a_3 <= 24'b0;
            a_4 <= 24'b0;
            a_5 <= 24'b0;
            a_6 <= 24'b0;
            a_7 <= 24'b0;
        end else begin
            a_0 <= mux_out2;
            a_1 <= a_0;
            a_2 <= a_1;
            a_3 <= a_2;
            a_4 <= a_3;
            a_5 <= a_4;
            a_6 <= a_5;
            a_7 <= a_6;
        end
    end
    // second stage 4 dff
    always @ (posedge clk) begin
        if (!reset) begin
            b_0 <= 24'b0;
            b_1 <= 24'b0;
            b_2 <= 24'b0;
            b_3 <= 24'b0;
        end else begin
            b_0 <= mux_out4;
            b_1 <= b_0;
            b_2 <= b_1;
            b_3 <= b_2;
        end
    end
    // third stage 2 dff
    always @ (posedge clk) begin
        if (!reset) begin
            c_0 <= 24'b0;
            c_1 <= 24'b0;
        end else begin
            c_0 <= mux_out6;
            c_1 <= c_0;
        end
    end
    // fourth stage 1 dff
    always @ (posedge clk) begin
        if (!reset) begin
            d_0 <= 24'b0;
        end else begin
            d_0 <= mux_out8;
        end
    end
    // output register 
    assign out = mux_out7;
endmodule