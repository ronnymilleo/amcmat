function [dataOut] = FSK2(frameSize,numSamplesPerSymbol,SNR,VIA,CN)
%% Signal generation
M = 2; % Number of symbols
n = frameSize; % Frame size in bits
freqSep = numSamplesPerSymbol; % Frequency separation
Fs = M*numSamplesPerSymbol; % Sampling frequency

% Default settings
switch nargin
    case 3
        VIA = 1;
        CN = 1;
    case 4
        CN = 1;
end

% Message
dataIn = randi([0 1],n,1); % Create random message

% Modulation
dataMod = fskmod(dataIn,M,freqSep,numSamplesPerSymbol, Fs);

%initPhase = pi*(2*rand(1)-1); % Generate random phase

% if(phaseFlag == 1)
%     dataMod = dataMod.*exp(1i*initPhase); % Add random phase
% end

txSignal = dataMod;

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

dataOut = rxSignal/rms(rxSignal);

if(VIA)
    amp = randi([1 10],1);
    dataOut = dataOut./amp;
end

% str = strcat('QAM4 RMS value: ',num2str(rms(dataOut)));
% disp(str)
end