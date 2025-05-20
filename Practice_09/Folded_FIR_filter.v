module folded_fir_filter(
    input clk100, clk20, reset,
    input signed [12-1:0] a,
    input signed [13-1:0] c0, c1, c2, c3, c4,
    output reg signed [22-1:0] b
);
    reg signed [12-1:0] data_selection;
    reg signed [13-1:0] co_selection;
    wire [25-1:0] mul_out;
    wire [20-1:0] round;
    wire [22-1:0] sum;
    reg signed [12-1:0] data_selection_q, a_q0, a_q1, a_q2, a_q3, a_q4;
    reg signed [13-1:0] co_selection_q;
    reg signed [22-1:0] temp_accumulate;
    reg signed [22-1:0] b_d;
    reg [3-1:0] counter_3bit;
    reg rstn, zero_selection;
    reg [22-1:0] accumulate;

    always @ (posedge clk20) begin
        if (!reset) begin
            a_q0 <= 12'b0;
            a_q1 <= 12'b0;
            a_q2 <= 12'b0;
            a_q3 <= 12'b0;
            a_q4 <= 12'b0;
        end
        else begin
            a_q0 <= a;
            a_q1 <= a_q0;
            a_q2 <= a_q1;
            a_q3 <= a_q2;
            a_q4 <= a_q3;
        end
    end
    assign mul_out = data_selection_q * co_selection_q;
    assign round = mul_out[23:4] + mul_out[3];
    assign sum = temp_accumulate + {{2{round[19]}}, round};
    always @ (posedge clk100) begin
        if (!reset) begin
            data_selection_q <= 12'b0;
            co_selection_q <= 13'b0;
            accumulate <= 22'b0;
            zero_selection <= 1'b0;
            b <= 22'b0;
            rstn <= 1'b0;
        end
        else begin
            rstn <= 1'b1;
            data_selection_q <= data_selection;
            co_selection_q <= co_selection;
            accumulate <= sum;
            b <= b_d;
            if ( counter_3bit == 3'b000)
                zero_selection <= 0;
            else
                zero_selection <= 1;
        end
    end
    always @ (posedge clk100) begin
        if (!rstn) 
            counter_3bit <= 3'b0;
        else begin
            counter_3bit <= counter_3bit + 1;
            if ( counter_3bit == 3'b100)
                counter_3bit <= 0;
            else 
                counter_3bit <= counter_3bit + 1;
        end
    end

    always @ ( counter_3bit ) begin
        case (counter_3bit) 
            3'b000: begin
                data_selection = a_q0;
                co_selection = c0;
            end
            3'b001: begin
                data_selection = a_q1;
                co_selection = c1;
            end
            3'b010: begin
                data_selection = a_q2;
                co_selection = c2;
            end
            3'b011: begin
                data_selection = a_q3;
                co_selection = c3;
            end
            3'b100: begin
                data_selection = a_q4;
                co_selection = c4;
            end
        default: begin
                data_selection = 12'b0;
                co_selection = 13'b0;
        end
        endcase
    end
    always @(*) begin
        if (zero_selection == 1'b0) begin
            temp_accumulate = 22'b0;
            b_d = accumulate;
        end
        else begin
            temp_accumulate = accumulate;
            b_d = b;
        end
    end

endmodule
