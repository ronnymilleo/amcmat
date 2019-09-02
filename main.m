%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Universidade Federal do Paraná
% Programa de Pós-Graduação em Engenharia Elétrica
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Limpar memória
clear
clc

%% Initial values
SNR = [-10 -5 0 5 10 15 20];                       %SNR vector
frames = 10;                                        %number of frames
frameSize = 4096;
randomInitPhaseFlag = 0;
plotFlag = 0;

%%Generate and extract characteristics from signals
%with following modulations(initial test purpose): QAM4, QAM16, PSK2

signal_qam4 = features(SNR,frames,frameSize,'QAM4',randomInitPhaseFlag,plotFlag);
signal_qam16 = features(SNR,frames,frameSize,'QAM16',randomInitPhaseFlag,plotFlag);
signal_psk2 = features(SNR,frames,frameSize,'PSK2',randomInitPhaseFlag,plotFlag);

%% Plot
% 1 - Desvio padrao do valor absoluto da componente nao-linear da fase instantanea
% 2 - Desvio padrao da componente nao-linear da fase instantanea
% 3 - Desvio padrao do valor absoluto da componente nao-linear da frequÃªncia instantanea
% 4 - Desvio padrao da componente nao-linear da frequÃªncia instantanea
% 5 - Curtose
% 6 - Valor maximo da densidade espectral de potencia da amplitude instantanea normalizada e centralizada
% 7 - Media da amplitude instantanea normalizada centralizada ao quadrado
% 8 - Desvio padrao do valor absoluto da amplitude instantanea normalizada e centralizada
% 9 - Desvio padrao da amplitude instantanea normalizada e centralizada
plotVector = [1 2 3 4];
plotFeatures(plotVector,SNR,signal_qam4,signal_qam16,signal_psk2)

%% Cálculo das médias dos frames para todas as características
meansA = meanFeatures(SNR,signal_qam4);
meansB = meanFeatures(SNR,signal_qam16);
meansC = meanFeatures(SNR,signal_psk2);

%% Plot das mÃ©dias
plotVector = [1 2 3 4];
plotMeanFeatures(plotVector,SNR,meansA,meansB,meansC)

%% Create and train a RNA
%ON HOLD! ToDo: check RNA creation with lolis/andre
targets = 3; %By now, only three modulations are under test
len_vec = length(signal_qam4(:,:,1));

% Input data: result from signal characteristics extraction to each noise
% value. Each table is a frame.
for k = 1:frames
    for j = 1:9%9 = nº de features
        for i = 1:length(SNR)
            input(i,j,k) = signal_qam4(i,k,j)
        end
    end
end

    
        