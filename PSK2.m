function [dataOut] = PSK2(frameSize,numSamplesPerSymbol,SNR,phaseFlag,noiseFlag,plotFlag)
%% Signal generation
M = 2;                                                      % Constelation size
k = log2(M);                                                % Bits per symbol
n = k*frameSize;                                            % Frame size in bits
span = 10;                                                  % Filter config
rolloff = 0.25;                                             % Filter rolloff
rrcFilter = rcosdesign(rolloff, span, numSamplesPerSymbol); % Filter creation

% Message
dataIn = randi([0 1],n,1);                                  % Create random message

% Modulation
dataMod = pskmod(dataIn,M);                                 % Modulate signal
initPhase = pi*(2*rand(1)-1);                               % Generate random phase

if(phaseFlag == 1)
    dataMod = dataMod.*exp(1i*initPhase);                   % Apply random phase
end

% Transmission filter
txSignal = upfirdn(dataMod,rrcFilter,numSamplesPerSymbol,1);% Transmitted signal

if(noiseFlag == 1)
    if(SNR < 50)
        snr = SNR;
        rxSignal = awgn(txSignal, snr, 'measured');         % Channel noise
    else
        rxSignal = txSignal;
    end
else
    rxSignal = txSignal;
end

% Removing filter delay
rxSignal = rxSignal(span*numSamplesPerSymbol/2+1:end-span*numSamplesPerSymbol/2-1);

% Plot
if(plotFlag == 1)
    sPlotFig = scatterplot(rxSignal,1,0,'g.');
    hold on
    scatterplot(dataMod,1,0,'k*',sPlotFig)
end

dataOut = rxSignal/rms(rxSignal);
end