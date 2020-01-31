function [dataOut] = FSK(M,frameSize,symbolRate,numSamplesPerSymbol,SNR,modParameters)
%% Signal generation
% Frequency Separation
FREQSEP = numSamplesPerSymbol*symbolRate/M;

% Rule for no aliasing:
% Fs = numSamplesPerSymbol*symbolRate > M * FREQSEP

% Create random message
dataIn = randi([0 M-1],frameSize,1);                                             

% Modulate signal
modulator = comm.FSKModulator(M,FREQSEP,symbolRate,...
    'SamplesPerSymbol',numSamplesPerSymbol,...
    'OutputDataType','double');
fskSignal = modulator(dataIn);

if(modParameters.CN)
    rxSignal = applyChannel(fskSignal,SNR);
else
    rxSignal = fskSignal;
end

% SNR verification
% signalPower = 1/(length(txSignal))*sum(abs(txSignal).^2);
% noise = rxSignal - txSignal;
% noisePower = 1/(length(noise))*sum(abs(noise).^2);
% SNR = 10*log10(signalPower/noisePower);
% disp(strcat(2,'SNR: ',num2str(SNR),' dB'))

% Plot
if(modParameters.isPlot)
    dspView = dsp.SpectrumAnalyzer('SampleRate',symbolRate*numSamplesPerSymbol);
    dspView(rxSignal);
end

% Power normalization
dataOut = rxSignal/rms(rxSignal);

% Apply random amplitude
if(modParameters.RA)
    amp = randi([1 10],1);
    dataOut = dataOut./amp;
end

% str = strcat('FSK2 RMS value: ',num2str(rms(dataOut)));
% disp(str)
end