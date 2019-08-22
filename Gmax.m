function [outputValue] = Gmax(inputVector)
% Maximum value of the spectral power density
% of the normalized and centered instantaneous amplitude
inputFFT = fft(inputVector);
averageFFT = abs(inputFFT);
averageFFTSquared = averageFFT.^2;
vectorSize = length(inputVector);
outputValue = max(averageFFTSquared)/vectorSize;
end

