function [dataOut] = PSK2(frameSize,SNR,plotFlag)
%% Geração do sinal 2-PSK
M = 2;                                                      % Tamanho da constelação
k = log2(M);                                                % Número de bits por símbolo
n = k*frameSize;                                            % Número de bits a processar
numSamplesPerSymbol = 1;                                    % Fator de Oversampling
span = 10;                                                  % Configuração do filtro
rolloff = 0.25;                                             % Fator de rolloff do filtro
rrcFilter = rcosdesign(rolloff, span, numSamplesPerSymbol); % Criação do filtro

% Configuração da mensagem
%rng default                                                 % Mantém o seed do gerador
dataIn = randi([0 1],n,1);                                  % Cria o vetor da mensagem
dataInMatrix = reshape(dataIn,length(dataIn)/k,k);          % Transformação de vetor em matrix
dataSymbolsIn = bi2de(dataInMatrix);                        % Conversão para inteiro

% Aplicação da modulação
dataMod = pskmod(dataSymbolsIn,M);                          % Modulação usando código gray
initPhase = pi*(2*rand(1)-1);                               % Fase inicial randômica
dataMod = dataMod.*exp(1i*initPhase);                       % Aplicação da fase inicial

% Aplicação do filtro na transmissão do sinal
txSignal = upfirdn(dataMod,rrcFilter,numSamplesPerSymbol,1);% Sinal transmitido

% SNR e canal
snr = SNR;
rxSignal = awgn(txSignal, snr, 'measured');                 % Aplicação do ruído do canal

% Filtro no sinal de recepção
rxFiltSignal = upfirdn(rxSignal,rrcFilter,1,numSamplesPerSymbol);   % Aplicação do filtro na recepção
rxFiltSignal = rxFiltSignal(span+1:end-span);                       % Retirada do delay do filtro

% Plot
if(plotFlag == 1)
    sPlotFig = scatterplot(rxSignal,1,0,'g.');
    hold on
    scatterplot(dataMod,1,0,'k*',sPlotFig)
end

% Demodulação
%dataSymbolsOut = pskdemod(rxFiltSignal, M);
%dataOutMatrix = de2bi(dataSymbolsOut,k);
%dataOut = dataOutMatrix(:);                                 % Transformaçao de matrix para vetor
dataOut = rxFiltSignal;

% Cálculo da taxa de erro
%[numErrors, ber] = biterr(dataIn, dataOut);
%fprintf('\nBER = %5.2e, baseado em %d erros\n', ...
%    ber, numErrors)
end