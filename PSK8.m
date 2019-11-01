function [dataOut] = PSK8(frameSize,numSamplesPerSymbol,SNR,VIP,VIA,CN,isPlot)
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
        VIP = 1;
        VIA = 1;
        CN = 1;
        isPlot = 0;
    case 4
        VIA = 1;
        CN = 1;
        isPlot = 0;
    case 5
        CN = 1;
        isPlot = 0;
    case 6
        isPlot = 0;
end

% Message
dataIn = randi([0 M-1],n,1);                                  % Create random message

initPhase = pi*(2*rand(1)-1);                               % Generate random phase

if(VIP)
    dataMod = pskmod(dataIn,M,initPhase);                   % Modulate signal
else
    % Modulation
    dataMod = pskmod(dataIn,M);                             % Modulate signal
end

% Transmission filter
txSignal = upfirdn(dataMod,rrcFilter,numSamplesPerSymbol,1);% Transmitted signal

if(CN)
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
if(isPlot)
    sPlotFig = scatterplot(rxSignal,1,0,'g.');
    hold on
    scatterplot(dataMod,1,0,'k*',sPlotFig)
end

dataOut = rxSignal/rms(rxSignal);

if(VIA)
    amp = randi([1 10],1);
    dataOut = dataOut./amp;
end

% str = strcat('QAM4 RMS value: ',num2str(rms(dataOut)));
% disp(str)
end