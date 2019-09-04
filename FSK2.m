function [dataOut] = FSK2(frameSize,numSamplesPerSymbol,SNR,phaseFlag,noiseFlag)
%% Geração do sinal FSK-2
M = 2;                                                      % Tamanho da constelação
k = log2(M);                                                % Número de bits por símbolo
n = k*frameSize;                                            % Número de bits a processar
freqSep = 10e3;                                             % Separação entre as frequẽncias da modulação
Fs = 2*freqSep;                                             % Frequência de amostragem da simulação

% Configuração da mensagem
dataIn = randi([0 1],n,1);  % Cria o vetor da mensagem

% Aplicação da modulação
dataMod = fskmod(dataIn,M,freqSep,numSamplesPerSymbol, Fs);    % Gray coding, phase offset = 0

if(phaseFlag == 1)
    dataMod = dataMod.*exp(1i*initPhase);                       % Aplicação da fase inicial
end

txSignal = dataMod;

if(noiseFlag == 1)
    if(SNR < 50)
        % SNR e canal
        snr = SNR;
        rxSignal = awgn(txSignal, snr, 'measured');                 % Aplicação do ruído do canal
    else
        rxSignal = txSignal;
    end
else
    rxSignal = txSignal;
end

dataOut = rxSignal;

% Demodulação
%dataOut = fskdemod(rxSignal,M,freqSep,numSamplesPerSymbol,Fs);

% Cálculo da taxa de erro
%[numErrors, ber] = biterr(dataIn, dataOut);
%fprintf('\nBER = %5.2e, baseado em %d erros\n', ...
%    ber, numErrors)
end