function [dataOut] = PSK2(frameSize,numSamplesPerSymbol,SNR,phaseFlag,noiseFlag,plotFlag,ampFlag)
%% Signal generation
M = 2;                                                      % Constelation size
k = log2(M);                                                % Bits per symbol
n = k*(frameSize+1);                                        % Frame size in bits
span = 10;                                                  % Filter config
rolloff = 0.25;                                             % Filter rolloff
rrcFilter = rcosdesign(rolloff, span, numSamplesPerSymbol); % Filter creation

% Default settings
switch nargin
    case 3
        phaseFlag = 1;
        noiseFlag = 1;
        plotFlag = 0;
        ampFlag = 1;
    case 4
        noiseFlag = 1;
        plotFlag = 0;
        ampFlag = 1;
    case 5
        plotFlag = 0;
        ampFlag = 1;
    case 6
        ampFlag = 1;
end

% Message
dataIn = randi([0 1],n,1);                                  % Create random message

initPhase = pi*(2*rand(1)-1);                               % Generate random phase

if(phaseFlag)
    dataMod = pskmod(dataIn,M,initPhase);                   % Modulate signal
else
    % Modulation
    dataMod = pskmod(dataIn,M);                             % Modulate signal
end

% Transmission filter
txSignal = upfirdn(dataMod,rrcFilter,numSamplesPerSymbol,1);% Transmitted signal

if(noiseFlag == 1)
    rxSignal = awgn(txSignal,SNR,'measured');
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
if(plotFlag == 1)
    sPlotFig = scatterplot(rxSignal,1,0,'g.');
    hold on
    scatterplot(dataMod,1,0,'k*',sPlotFig)
end

dataOut = rxSignal/rms(rxSignal);

if(ampFlag)
    amp = randi([1 10],1);
    dataOut = dataOut./amp;
end

% str = strcat('QAM4 RMS value: ',num2str(rms(dataOut)));
% disp(str)
end