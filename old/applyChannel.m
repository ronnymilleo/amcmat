function [output] = applyChannel(modulatedSignal, SNR, s)
    noisySignal = awgn(modulatedSignal,SNR,'measured',s);
    output = noisySignal;
end