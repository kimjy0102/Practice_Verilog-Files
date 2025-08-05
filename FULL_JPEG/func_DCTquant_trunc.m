%% Result of 2D - DCT Quantization Function
function  Block_quant = func_DCTquant_trunc(Block, block_width, block_height)

% 8bit
for i = 1:block_height
   for j = 1:block_width
      if (i==1) && (j==1)
          % change it respect to the truncation point
          Block_quant(i,j) = floor(Block(i,j)/2)*2; 
      else
          Block_quant(i,j) = floor(Block(i,j)*2)/2;
      end
   end
end

