function [output] = applyChannel(modulatedSignal, SNR)
    noisySignal = awgn(modulatedSignal,SNR,'measured');
    output = noisySignal;
end