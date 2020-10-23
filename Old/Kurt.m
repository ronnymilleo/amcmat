function [output] = Kurt(input)
m = mean(input);
aux4 = (input - m).^4;
aux2 = (input - m).^2;
num = (1/length(input))*sum(aux4);
den = ((1/length(input))*sum(aux2)).^2;
output = num/den;
end