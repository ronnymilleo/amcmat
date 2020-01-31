function [dataOut] = QAM(M,frameSize,symbolRate,numSamplesPerSymbol,SNR,modParameters)
%% Signal generation
% % Filter creation
span = 10;
rolloff = 0.25;
rrcFilter = rcosdesign(rolloff, span, numSamplesPerSymbol);

% Create random message
dataIn = randi([0 M-1],frameSize,1);                            
% Generate random phase offset
phaseOffset = pi*(2*rand(1)-1);                       

% Modulate signal
if(modParameters.RP) % Variable initial phase
    qamSignal = qammod(dataIn,M).*exp(1i*phaseOffset);
else
    qamSignal = qammod(dataIn,M);
end

% Transmission filter
txSignal = upfirdn(qamSignal,rrcFilter,numSamplesPerSymbol,1);

if(modParameters.CN)
    rxSignal = applyChannel(txSignal,SNR);
else
    rxSignal = txSignal;
end

% SNR verification
% signalPower = 1/(length(txSignal))*sum(abs(txSignal).^2);
% noise = rxSignal - txSignal;
% noisePower = 1/(length(noise))*sum(abs(noise).^2);
% SNR = 10*log10(signalPower/noisePower);
% disp(strcat(2,'SNR: ',num2str(SNR),' dB'))

% Removing filter delay
rxSignal = rxSignal(span*numSamplesPerSymbol/2+1:end-span*numSamplesPerSymbol/2-1);

% Plot
if(modParameters.isPlot)
    sPlotFig = scatterplot(rxSignal,1,0,'g.');
    hold on
    scatterplot(qamSignal,1,0,'k*',sPlotFig)
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

% str = strcat('QAM16 RMS value: ',num2str(rms(dataOut)));
% disp(str)
end