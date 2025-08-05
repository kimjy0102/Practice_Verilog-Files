%% DCT Coefficient Quantization Function
function  T_quant = func_DCT_Coefficient_quant(num_bin)
% num_bin : The DCT Quantization bit allocation 

N=8;

%% coefficient matrix
for i = 1:N
    for j = 1:N
        if i==1
            T(i,j) = cos((i-1)*(2*j-1)*pi/(2*N)) * sqrt(1/N);
        else
            T(i,j) = cos((i-1)*(2*j-1)*pi/(2*N)) * sqrt(2/N);
        end
    end
end
%% Change from Decimal to Binary number

for i = 1:N
    for j = 1:N
        T_bi(i,j,:) = func_Dec2Bin_mag(T(i,j), num_bin);
    end
end

%% Again Change from Binary to Decimal number

for i = 1:N
    for j = 1:N
        num_int = 0;
        T_quant(i,j) = func_Bin2Dec_mag(T_bi(i,j,:), num_int, num_bin);
    end
end
