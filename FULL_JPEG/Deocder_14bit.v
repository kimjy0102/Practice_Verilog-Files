module decoder_14bit(
    input [14-1:0] data,
    input [7-1:0] pos,
    output reg [8-1:0] out,
    output reg [7-1:0] flag,
    output reg [10-1:0] size
); 

    always @(*) begin
        if (data == 14'b1111_1111_1111_11) begin
            flag = pos;
            size = 10'b0;
            out = 8'b0; 
        end
        else if (data == 14'b0000_0000_0000_00) begin
            flag = 7'b0;
            size = 10'b0;
            out = 8'b0;
        end
        else begin
            flag = 7'b0;
            size = (data[13:8] + 1) << 3; // number of zero and data * 8 (to shift)
            out = data[7:0];
        end 
    end    
endmodule
