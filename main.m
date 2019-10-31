%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Universidade Federal do Parana
% Programa de Pos-Graduacao em Engenharia Eletrica
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Clear memory
clear 
clc
MSGID = 'signal:hilbert:Ignore';
warning('off', MSGID)
%% Initial values
snrVector = [-15 -10 -5 0 5 10 15];                 % SNR vector
frames = 500;                                      % Number of frames
frameSize = 4096;                                   % Frame size in bits
featuresVector = [1 2 3 4 5 6 7 8 9 10];            % Features selection vector
numSamplesPerSymbol = 8;                            % Oversampling factor
randomPhaseFlag = 1;                                % 1 = random initial phase
noiseFlag = 1;                                      % 1 = generate channel noise
plotFlag = 0;                                       % 1 = scatterplot
ampFlag = 0;                                        % 1 = generate random amplitude
%% Generate and extract characteristics from signals 
f = waitbar(0,'Please wait...');
tic
signal_qam4 = features(snrVector,frames,frameSize,featuresVector,numSamplesPerSymbol,'QAM4',randomPhaseFlag,noiseFlag,plotFlag,ampFlag);
[a, MSGID] = lastwarn();
waitbar(1/6,f,'QAM4 done.');
signal_qam16 = features(snrVector,frames,frameSize,featuresVector,numSamplesPerSymbol,'QAM16',randomPhaseFlag,noiseFlag,plotFlag,ampFlag);
waitbar(2/6,f,'QAM16 done.');
signal_psk2 = features(snrVector,frames,frameSize,featuresVector,numSamplesPerSymbol,'PSK2',randomPhaseFlag,noiseFlag,plotFlag,ampFlag);
waitbar(3/6,f,'PSK2 done.');
signal_fsk2 = features(snrVector,frames,frameSize,featuresVector,numSamplesPerSymbol,'FSK2',randomPhaseFlag,noiseFlag,plotFlag,ampFlag);
waitbar(4/6,f,'FSK2 done.');
signal_fsk4 = features(snrVector,frames,frameSize,featuresVector,numSamplesPerSymbol,'FSK4',randomPhaseFlag,noiseFlag,plotFlag,ampFlag);
waitbar(5/6,f,'FSK4 done.');
signal_noise = features(snrVector,frames,frameSize,featuresVector,numSamplesPerSymbol,'noise');
waitbar(6/6,f,'Noise done.');
pause(0.5)
waitbar(1,f,'Finishing...');
pause(0.5)
toc

% Convert vector to string with '-' replacing spaces
step1 = strrep(num2str(featuresVector),'   ','-');
step2 = strrep(step1,'  ','-');
step3 = strrep(step2,' ','-');
name = strcat('ftData',num2str(frameSize),'-',step3);

save(name, 'signal_qam4', 'signal_qam16', 'signal_psk2', 'signal_fsk2', 'signal_fsk4', 'signal_noise');
close(f)
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
% 10 - Assimetria (Skewness)

close all
plotVector = [3 4];
fontSize = 12;
plotFeatures(plotVector,fontSize,snrVector,signal_qam4,signal_qam16,signal_psk2,signal_fsk2,signal_fsk4,signal_noise)
%% Plot das medias
close all
plotVector = [3 4];
fontSize = 12;
plotMeanFeatures(plotVector,fontSize,snrVector,signal_qam4,signal_qam16,signal_psk2,signal_fsk2,signal_fsk4,signal_noise)
%% RNA
%% Train
dataFile = 'ftData4096-1-2-3-4-5-6-7-8-9-10'; % Specify the calculated features file name to train
SNRstring = 'ALL'; % Can be set to '-20','-15','-10','-5','0','5','10' and '15'
% 'ALL' is default for training
hiddenLayer = [10,6]; % Config the setup of hidden layers
isPlot = 1; % Do you want to plot? It's confusion matrix
forgeNetwork(dataFile,SNRstring,isPlot,frames,hiddenLayer);
%% Evaluate
dataFile = 'ftData4096-1-2-3-4-5-6-7-8-9-10'; % Specify the calculated features file name to evaluate
SNRstring = '-5'; % Can be set to '-15','-10','-5','0','5','10' and '15'
netFile = 'netConfig-10-6-ftData4096-1-2-3-4-5-6-7-8-9-10'; % Specify the created network file name to evaluate
useNetwork(dataFile,netFile,frames,SNRstring) % Do the work