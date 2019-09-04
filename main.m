%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Universidade Federal do Parana
% Programa de Pos-Graduacao em Engenharia Eletrica
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Clear memory
clear 
clc
%tic
%% Initial values 
%SNR = linspace(-20,20,41);
SNR = [-20 -15 -10 -5 0 5 10 15];                   % SNR vector
frames = 50;                                        % Number of frames
frameSize = 4096;                                   % Frame size in bits
numSamplesPerSymbol = 8;                            % Oversampling factor
randomPhaseFlag = 0;                                % 1 = random initial phase
noiseFlag = 1;                                      % 1 = generate channel noise
plotFlag = 0;                                       % 1 = scatterplot

%% Generate and extract characteristics from signals 
% with following modulations(initial test purpose):
% QAM4, QAM16, PSK2, FSK2, FSK4
                                       
% Uncomment to get the same bits every time
%rng default 
signal_qam4 = features(SNR,frames,frameSize,numSamplesPerSymbol,'QAM4',randomPhaseFlag,noiseFlag,plotFlag);
signal_qam16 = features(SNR,frames,frameSize,numSamplesPerSymbol,'QAM16',randomPhaseFlag,noiseFlag,plotFlag);
signal_psk2 = features(SNR,frames,frameSize,numSamplesPerSymbol,'PSK2',randomPhaseFlag,noiseFlag,plotFlag);
signal_fsk2 = features(SNR,frames,frameSize,numSamplesPerSymbol,'FSK2',randomPhaseFlag,noiseFlag);
signal_fsk4 = features(SNR,frames,frameSize,numSamplesPerSymbol,'FSK4',randomPhaseFlag,noiseFlag);
signal_noise = features(SNR,frames,frameSize,numSamplesPerSymbol,'noise');

%% Plot
% 1 - Desvio padrao do valor absoluto da componente nao-linear da fase instantanea
% 2 - Desvio padrao da componente nao-linear da fase instantanea
% 3 - Desvio padrao do valor absoluto da componente nao-linear da frequência instantanea
% 4 - Desvio padrao da componente nao-linear da frequência instantanea
% 5 - Curtose
% 6 - Valor maximo da densidade espectral de potencia da amplitude instantanea normalizada e centralizada
% 7 - Media da amplitude instantanea normalizada centralizada ao quadrado
% 8 - Desvio padrao do valor absoluto da amplitude instantanea normalizada e centralizada
% 9 - Desvio padrao da amplitude instantanea normalizada e centralizada
close all
plotVector = [6];
plotFeatures(plotVector,SNR,signal_qam4,signal_qam16,signal_psk2,signal_fsk2,signal_fsk4,signal_noise)
%toc
% Enterprise benchmark = 291.898754 s (7x100x9)

%% Plot das medias
close all
plotVector = [6];
plotMeanFeatures(plotVector,SNR,signal_qam4,signal_qam16,signal_psk2,signal_fsk2,signal_fsk4,signal_noise)

%% Create and train a RNA
%ON HOLD! ToDo: check RNA creation with lolis/andre
targets = 3; %By now, only three modulations are under test
len_vec = length(signal_qam4(:,:,1));

% Input data: result from signal characteristics extraction to each noise
% value. Each table is a frame.
for k = 1:frames
    for j = 1:9%9 = numero de features
        for i = 1:length(SNR)
            input(i,j,k) = signal_qam4(i,k,j);
        end
    end
end