function [outputValue] = meanSquared(inputVector)
% Mean of normalized-centered instantaneous amplitude squared
inputSquared = inputVector.^2;
outputValue = mean(inputSquared);
end

