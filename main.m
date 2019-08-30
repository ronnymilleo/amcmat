%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Universidade Federal do Paran�
% Programa de P�s-Gradua��o em Engenharia El�trica
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Limpar mem�ria
clear 
clc

%% Initial values 
SNR = [-15 -10 -5 0 5 10 15];                        %SNR vector
frames = 50;                                        %number of frames
frameSize = 4096;
randomInitPhaseFlag = 0;
plotFlag = 0;

%%Generate and extract characteristics from signals 
 %with following modulations(initial test purpose): QAM4, QAM16, PSK2

%rng default                                                 % Mantém o seed do gerador

signal_qam4 = features(SNR,frames,frameSize,'QAM4',randomInitPhaseFlag,plotFlag);
signal_qam16 = features(SNR,frames,frameSize,'QAM16',randomInitPhaseFlag,plotFlag);
signal_psk2 = features(SNR,frames,frameSize,'PSK2',randomInitPhaseFlag,plotFlag);
signal_fsk2 = features(SNR,frames,frameSize,'FSK2',randomInitPhaseFlag);
signal_fsk4 = features(SNR,frames,frameSize,'FSK4',randomInitPhaseFlag);
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
plotVector = [1 2 3 4];
plotFeatures(plotVector,SNR,signal_qam4,signal_qam16,signal_psk2)

%% C�lculo das m�dias dos frames para todas as caracter�sticas
meansA = meanFeatures(SNR,signal_qam4);
meansB = meanFeatures(SNR,signal_qam16);
meansC = meanFeatures(SNR,signal_psk2);

%% Plot das médias
plotVector = [1 2 3 4 5 6 7 8 9];
plotMeanFeatures(plotVector,SNR,meansA,meansB,meansC)

%% Create and train a RNA
  %ON HOLD! ToDo: check RNA creation with lolis/andre
n_targes=3; %By now, only three modulations are under test
len_vec=length(signal_qam4(:,:,1))
