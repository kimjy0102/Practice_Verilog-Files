%%  Convert a binary number to a decimal number when the data format is sign and magnitude
function decimal = func_Bin2Dec_mag(Bin_data, num_int, num_bin)
% 'num_int' indicates the number of digits greater than 0. 
% 'num_bin' is the total number of binary digits.

%% Reordering to fit in the program

bin = Bin_data(num_bin:-1:1);

NumInt = num_int;
NumBin = num_bin;
dec = 0;
sign = bin(NumBin);

%% Convert binary to decimal

%%% number contains float values
if NumBin > NumInt 
    % integer
    for i = 1:NumInt
        if (bin(NumBin-1-(NumInt-i)) == 1)
            dec = dec + power(2, i-1);
        end
    end
    % float
    for i = 1:NumBin-NumInt-1
        if (bin(NumBin-NumInt-i) == 1)
            dec = dec + power(2, -i);
        end
    end

%%% number is pure interger
else
    for i = 1:NumBin-1
        if (bin(i) == 1)
            dec = dec + power(2, i-1);
        end
    end
end

%% Apply sign data
if (sign == 1)
    decimal = -dec;
else
    decimal = dec;
end