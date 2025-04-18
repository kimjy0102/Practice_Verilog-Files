`timescale 1 ns / 1 ps
module stimulus_full_adder_18bit;

wire [18:0] sum;
reg  [17:0] a, b;

reg  [18:0] mat_sum [0:99];
reg  [18:0] mat_sum_cmp;
reg  [17:0] mat_a   [0:99];
reg  [17:0] mat_b   [0:99];

full_adder_18bit add0(.sum(sum), .a(a), .b(b), .c_in(1'b0));

integer i;
integer err;

initial
begin
  $readmemh("a_input.txt",    mat_a);
  $readmemh("b_input.txt",    mat_b);
  $readmemh("sum_output.txt", mat_sum);

  i = 0;
  err = 0;
  #(10);

  for(i=0 ; i<100 ; i=i+1)
  begin
    a = mat_a[i];
    b = mat_b[i];

    #(0)
    mat_sum_cmp = mat_sum[i];
    if(sum != mat_sum_cmp) err = err + 1;
    #(10);
  end
  #(20)
  $stop;
end

endmodule