%% Geração do sinal FSK-2
freqSep = 10e3;             % Separação entre as frequẽncias da modulação
M = 2;                      % Tamanho da constelação
k = log2(M);                % Número de bits por símbolo
Fs = (M-1)*freqSep;        % Frequência de amostragem da simulação
n = k*4096;                 % Número de bits a processar
numSamplesPerSymbol = 2;    % Oversampling factor
% Configuração da mensagem
rng default                 % Mantém o seed igual
dataIn = randi([0 1],n,1);  % Cria o vetor da mensagem
% Aplicação da modulação
dataMod = fskmod(dataIn,M,freqSep,numSamplesPerSymbol, Fs);    % Gray coding, phase offset = 0
txSignal = dataMod;
% SNR
snr = 20;
% Aplicação do ruído do canal
rxSignal = awgn(txSignal, snr, 'measured');
% Plot
sPlotFig = scatterplot(rxSignal,1,0,'g.');
hold on
scatterplot(dataMod,1,0,'k*',sPlotFig)
% Demodulação
dataOut = fskdemod(rxSignal,M,freqSep,numSamplesPerSymbol,Fs);
% Cálculo da taxa de erro
[numErrors, ber] = biterr(dataIn, dataOut);
fprintf('\nBER = %5.2e, baseado em %d erros\n', ...
    ber, numErrors)