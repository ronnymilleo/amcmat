%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Universidade Federal do Paraná
% Programa de Pós-Graduação em Engenharia Elétrica
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Limpar memória
clear
clc
%% Valores iniciais
SNR = [-10 -5 0 5 10 15 20];
frames = 10;
frameSize = 4096;
randomInitPhaseFlag = 0;
plotFlag = 0;
%% Extração de características dos sinais modulados
A = features(SNR,frames,frameSize,'QAM4',randomInitPhaseFlag,plotFlag);
B = features(SNR,frames,frameSize,'QAM16',randomInitPhaseFlag,plotFlag);
C = features(SNR,frames,frameSize,'PSK2',randomInitPhaseFlag,plotFlag);
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
plotFeatures(plotVector,SNR,A,B,C)
%% Cálculo das médias dos frames para todas as características
meansA = meanFeatures(SNR,A);
meansB = meanFeatures(SNR,B);
meansC = meanFeatures(SNR,C);
%% Plot das médias
plotVector = [1 2 3 4];
plotMeanFeatures(plotVector,SNR,meansA,meansB,meansC)