%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Universidade Federal do Parana
% Programa de Pos-Graduacao em Engenharia Eletrica
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Clear memory
clear 
clc
%% Initial values 
%SNR = linspace(-20,20,41);
SNR = [-20 -15 -10 -5 0 5 10 15];                   % SNR vector
SNR_AB = 10.^(SNR/10);
frames = 350;                                       % Number of frames
frameSize = 2048;                                   % Frame size in bits
numSamplesPerSymbol = 8;                            % Oversampling factor
randomPhaseFlag = 1;                                % 1 = random initial phase
noiseFlag = 1;                                      % 1 = generate channel noise
plotFlag = 0;                                       % 1 = scatterplot

%% Generate and extract characteristics from signals 

%f = uifigure;
%d = uiprogressdlg(f,'Title','Generating signal data...','Indeterminate','on');

% Uncomment to get the same bits every time
%rng default 

signal_qam4 = features(SNR,frames,frameSize,numSamplesPerSymbol,'QAM4',randomPhaseFlag,noiseFlag,plotFlag);
signal_qam16 = features(SNR,frames,frameSize,numSamplesPerSymbol,'QAM16',randomPhaseFlag,noiseFlag,plotFlag);
signal_psk2 = features(SNR,frames,frameSize,numSamplesPerSymbol,'PSK2',randomPhaseFlag,noiseFlag,plotFlag);
signal_fsk2 = features(SNR,frames,frameSize,numSamplesPerSymbol,'FSK2',randomPhaseFlag,noiseFlag);
signal_fsk4 = features(SNR,frames,frameSize,numSamplesPerSymbol,'FSK4',randomPhaseFlag,noiseFlag);
signal_noise = features(SNR,frames,frameSize,numSamplesPerSymbol,'noise');

save('amcData', 'signal_qam4', 'signal_qam16', 'signal_psk2', 'signal_fsk2', 'signal_fsk4', 'signal_noise');

%close(d);
%close(f);
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
plotVector = [5];
fontSize = 12;
plotFeatures(plotVector,fontSize,SNR,signal_qam4,signal_qam16,signal_psk2,signal_fsk2,signal_fsk4,signal_noise)

%% Plot das medias
close all
plotVector = [5];
plotMeanFeatures(plotVector,fontSize,SNR,signal_qam4,signal_qam16,signal_psk2,signal_fsk2,signal_fsk4,signal_noise)

%% RNA
%If the first parameter is true, the RNA is created and trained again. Otherwise it will only generate a
%random signal and test it using the current RNA configuration; second 
%parameter is the group of modulations to test; third is whether to plot
%the results or not
modulations = {'QAM4', 'QAM16','PSK2', 'FSK2', 'FSK4', 'NOISE'};
parameters = struct('frames',frames,'frameSize',frameSize,'SNR',SNR,'noiseFlag',noiseFlag,...
                    'numSamplesPerSymbol',numSamplesPerSymbol,'randomPhaseFlag',randomPhaseFlag,'plotFlag',plotFlag);
result = amcNet(false, modulations, false, parameters);