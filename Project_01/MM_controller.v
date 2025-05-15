module mm_controller(
    input clk, nrst, start,
    input [8-1:0] A_out, 
    input [32-1:0] B_out,
    output [21-1:0] C_in,
    output [10-1:0] address_a, address_c,
    output [8-1:0] address_b,
    output reg done, nce, nwrt, nce_out, nwrt_out
);
    reg state, next_state;
    reg rstn2;
    wire [14-1:0] count_out;
    always @(*) begin
        case (state)
        1'b0 : begin               
            if (start) begin
                next_state <= 1'b1;
            end
        end
        1'b1 : begin                
            if (!nrst) begin
                next_state <= 1'b0; 
            end
        end
        default : begin
            next_state <= 1'b0;
        end
        endcase
    end
    always @(posedge clk) begin
        state <= next_state;
    end
    always @(posedge clk) begin
        if (state == 1'b0) begin        // idle state
            nce <= 1'b1;
            nwrt <= 1'b0;
            done <= 1'b0;
            rstn2 <= 1'b0;
            nce_out <= 1'b1;
            nwrt_out <= 1'b0;
        end
        else begin                      // running state
            if ( count_out == 14'b1000_0000_0001_00) begin  // when multiplying is done
                nce <= 1'b1;
                nwrt <= 1'b0;
                done <= 1'b1;
                rstn2 <= 1'b1;
                nce_out <= 1'b0;
                nwrt_out <= 1'b1;
            end
            else begin
                nce <= 1'b0;
                nwrt <= 1'b1;
                done <= 1'b0;
                rstn2 <= 1'b1;
                nce_out <= count_out[2] | count_out[3] | count_out[4];
                nwrt_out <= count_out[2] | count_out[3] | count_out[4];
            end
        end
    end 
    assign address_a = {count_out[12:8], count_out[4:0]};
    assign address_b = count_out[7:5] + ( count_out[4:0] <<< 3 );
    assign address_c = ((count_out[12:5] - 1) <<< 2) + (count_out[2:0] - 1);
    matmul_controller MM0(.A(A_out), .B(B_out), .clk(clk), .rstn(rstn2), .count(count_out[4:0]), .out(C_in));
    counter_14bit counter(.clk(clk), .rstn(rstn2), .out(count_out));
endmodule

