%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Universidade Federal do Parana
% Programa de Pos-Graduacao em Engenharia Eletrica
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Clear memory
clear 
clc
tic
%% Initial values 
SNR = [-15 -10 -5 0 5 10 15];                       % SNR vector
frames = 100;                                       % Number of frames
frameSize = 4096;                                   % Frame size in bits
randomInitPhaseFlag = 0;                            % 1 = random initial phase
plotFlag = 0;                                       % 1 = scatterplot
noisePower = 0;                                     % Noise power in dB
%% Generate and extract characteristics from signals 
% with following modulations(initial test purpose):
% QAM4, QAM16, PSK2, FSK2, FSK4
                                       
% Uncomment to get the same bits every time
%rng default 
signal_qam4 = features(SNR,frames,frameSize,'QAM4',randomInitPhaseFlag,plotFlag);
signal_qam16 = features(SNR,frames,frameSize,'QAM16',randomInitPhaseFlag,plotFlag);
signal_psk2 = features(SNR,frames,frameSize,'PSK2',randomInitPhaseFlag,plotFlag);
signal_fsk2 = features(SNR,frames,frameSize,'FSK2',randomInitPhaseFlag);
signal_fsk4 = features(SNR,frames,frameSize,'FSK4',randomInitPhaseFlag);
signal_noise = noiseFeatures(SNR,frames,frameSize,noisePower);

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
plotVector = [1 2 3 4 5 6 7 8 9];
plotFeatures(plotVector,SNR,signal_qam4,signal_qam16,signal_psk2,signal_fsk2,signal_fsk4,signal_noise)
toc

% Enterprise benchmark = 291.898754 s (7x100x9)
%% Calculo das medias dos frames para todas as caracteristicas
meansA = meanFeatures(SNR,signal_qam4);
meansB = meanFeatures(SNR,signal_qam16);
meansC = meanFeatures(SNR,signal_psk2);
meansD = meanFeatures(SNR,signal_fsk2);
meansE = meanFeatures(SNR,signal_fsk4);
meansNoise = meanFeatures(SNR,signal_noise);

%% Plot das medias
plotVector = [1 2 3 4 5 6 7 8 9];
plotMeanFeatures(plotVector,SNR,meansA,meansB,meansC,meansD,meansE,meansNoise)

%% Create and train a RNA
%ON HOLD! ToDo: check RNA creation with lolis/andre
targets = 3; %By now, only three modulations are under test
len_vec = length(signal_qam4(:,:,1));

% Input data: result from signal characteristics extraction to each noise
% value. Each table is a frame.
for k = 1:frames
    for j = 1:9%9 = n� de features
        for i = 1:length(SNR)
            input(i,j,k) = signal_qam4(i,k,j)
        end
    end
end

    
        