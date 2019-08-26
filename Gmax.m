function [outputValue] = Gmax(inputVector)
% Maximum value of the spectral power density
% of the normalized and centered instantaneous amplitude
fft2 = abs(fft(inputVector)).^2;
psd = fft2/length(inputVector);
outputValue = max(psd);
end

