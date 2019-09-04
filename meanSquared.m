function [outputValue] = meanSquared(inputVector)
inputSquared = inputVector.^2;
outputValue = mean(inputSquared);
end

