function [dataOut] = FSK2(frameSize,numSamplesPerSymbol,SNR,phaseFlag,noiseFlag)
%% Signal generation
M = 2; % Number of symbols
n = frameSize; % Frame size in bits
freqSep = numSamplesPerSymbol; % Frequency separation
Fs = M*numSamplesPerSymbol; % Sampling frequency

% Message
dataIn = randi([0 1],n,1); % Create random message

% Modulation
dataMod = fskmod(dataIn,M,freqSep,numSamplesPerSymbol, Fs);
initPhase = pi*(2*rand(1)-1); % Generate random phase

if(phaseFlag == 1)
    dataMod = dataMod.*exp(1i*initPhase); % Add random phase
end

txSignal = dataMod;

if(noiseFlag == 1)
    if(SNR < 50)
        snr = SNR;
        rxSignal = awgn(txSignal, snr, 'measured'); % Channel noise
    else
        rxSignal = txSignal;
    end
else
    rxSignal = txSignal;
end

dataOut = rxSignal/rms(rxSignal);
dataOut = dataOut(1:end-numSamplesPerSymbol);
end