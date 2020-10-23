function [output] = standardDeviation(input)
aux1 = sum((input - mean(input)).^2);
aux2 = 1/(length(input) - 1);
output = sqrt(aux2*(aux1));
end