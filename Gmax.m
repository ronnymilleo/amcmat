function [outputValue] = Gmax(inputVector)
fft2 = abs(fft(inputVector)).^2;
psd = fft2/length(inputVector);
outputValue = max(psd);
end

