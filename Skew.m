function [output] = Skew(input)
m = mean(input);
aux4 = (input - m).^3;
aux2 = (input - m).^2;
num = (1/length(input))*sum(aux4);
den = ((1/length(input))*sum(aux2)).^(3/2);
output = num/den;
end