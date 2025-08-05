module module_4bit // starting from 4bit module 2bit -> comes as 2bit 

(   input [8-1:0] data_in_0, // input data
    input [8-1:0] data_in_1,
    input [8-1:0] data_in_2,
    input [8-1:0] data_in_3,
    output reg flag,     // determines if the input is 0000
    output reg [2-1:0] left, // output of left zero's 0 ~ 3
    output reg [2-1:0] right, // output of right zero's 0 ~ 3
    output reg [4*14-1:0] array, // output array
    // max size -> all 4 has data  && each component size -> 14bit (0 counts, data 8bit)
    output reg [3-1:0] size // actually using size in array (total) max is 4 -> 100 -> 3bit
);
    wire [4-1:0] truncated_data; // if data is non zero -> 1 zero -> 0
    assign truncated_data[0] = | data_in_0;
    assign truncated_data[1] = | data_in_1;
    assign truncated_data[2] = | data_in_2;
    assign truncated_data[3] = | data_in_3;
    // {data4, data3, data2, data1}
    always @(*) begin
        case (truncated_data)
            4'b0000: begin
                flag = 1'b0; 
                left = 2'b0;
                right = 2'b0;
                array = 56'b0;
                size = 3'b0;
            end
            4'b0001: begin
                flag = 1'b1; 
                left = 2'b11; // 3
                right = 2'b00; // 0
                array = {14'b0, 14'b0, 14'b0, 6'b0, data_in_0};
                size = 3'b001; // 1
            end
            4'b0010: begin
                flag = 1'b1;
                left = 2'b10; //2
                right = 2'b01; //1
                array = {14'b0, 14'b0, 14'b0, 6'b0, data_in_1};
                size = 3'b001; //1
            end
            4'b0011: begin
                flag = 1'b1;
                left = 2'b10; //2
                right = 2'b00; //0
                array = {14'b0, 14'b0, 6'b0, data_in_1, 6'b0, data_in_0};
                size = 3'b010; //2
            end
            4'b0100: begin
                flag = 1'b1;
                left = 2'b01; //1
                right = 2'b10; //2
                array = {14'b0, 14'b0, 14'b0, 6'b0, data_in_2};
                size = 3'b001; //1
            end
            4'b0101: begin
                flag = 1'b1;
                left = 2'b01; // 1
                right = 2'b00; // 0
                array = {14'b0, 14'b0, 6'b0, data_in_2, 6'b000001, data_in_0};
                size = 3'b010; //2
            end
            4'b0110: begin
                flag = 1'b1;
                left = 2'b01; //1
                right = 2'b01; //1
                array = {14'b0, 14'b0, 6'b0, data_in_2, 6'b0, data_in_1};
                size = 3'b010; //2
            end
            4'b0111: begin
                flag = 1'b1;
                left = 2'b01; //1
                right = 2'b00; // 0
                array = {14'b0, 6'b0, data_in_2, 6'b0, data_in_1, 6'b0, data_in_0};
                size = 3'b011; //3
            end
            4'b1000: begin
               flag = 1'b1;
               left = 2'b00; //0
               right = 2'b11; //3
               array = {14'b0, 14'b0, 14'b0, 6'b0, data_in_3};
               size = 3'b001; //1 
            end
            4'b1001: begin
                flag = 1'b1;
                left = 2'b00; //0
                right = 2'b00; //0
                array = {14'b0, 14'b0, 6'b0, data_in_3, 6'b000010, data_in_0};
                size = 3'b010; //2
            end
            4'b1010: begin
                flag = 1'b1;
                left = 2'b00; //0
                right = 2'b01; //1
                array = {14'b0, 14'b0, 6'b0, data_in_3, 6'b000001, data_in_1};
                size = 3'b010; // 2
            end
            4'b1011: begin
                flag = 1'b1;
                left = 2'b00; // 0
                right = 2'b00; //0
                array = {14'b0, 6'b0, data_in_3, 6'b000001, data_in_1, 6'b0, data_in_0};
                size = 3'b011; //3
            end
            4'b1100: begin
                flag = 1'b1;
                left = 2'b00;   //0
                right = 2'b10; //2
                array = {14'b0, 14'b0, 6'b0, data_in_3, 6'b0, data_in_2};
                size = 3'b010; //2
            end
            4'b1101: begin
                flag = 1'b1;
                left = 2'b00; //0
                right = 2'b00; //0
                array = {14'b0, 6'b0, data_in_3, 6'b0, data_in_2, 6'b000001, data_in_0};
                size = 3'b011; //3
            end
            4'b1110: begin
                flag = 1'b1;
                left = 2'b00; //0
                right = 2'b01; //1
                array = {14'b0, 6'b0, data_in_3, 6'b0, data_in_2, 6'b0, data_in_1};
                size = 3'b011; //3
            end
            4'b1111: begin
                flag = 1'b1;
                left = 2'b00; //0
                right = 2'b00; //0
                array ={6'b0, data_in_3, 6'b0, data_in_2, 6'b0, data_in_1, 6'b0, data_in_0};
                size = 3'b100; //4
            end
        endcase
    end
endmodule

