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
frames = 1000;                                      % Number of frames
frameSize = 4096;                                   % Frame size in bits
featuresVector = [1 2 3 4 5 6 7 8 9 10];            % Features selection vector
numSamplesPerSymbol = 8;                            % Oversampling factor
% Modulation parameters
VIP = 1;        % Variable initial phase
VIA = 0;        % Variable initial amplitude
CN = 1;         % Channel noise
isPlot = 0;     % Modulation plot (scatterplot)
%% Generate and extract characteristics from signals 
f = waitbar(0,'Please wait...');
tic
signal_qam4 = features(snrVector,frames,frameSize,featuresVector,numSamplesPerSymbol,'QAM4',VIP,VIA,CN,isPlot);
waitbar(1/6,f,'QAM4 done.');
signal_qam16 = features(snrVector,frames,frameSize,featuresVector,numSamplesPerSymbol,'QAM16',VIP,VIA,CN,isPlot);
waitbar(2/6,f,'QAM16 done.');
signal_psk2 = features(snrVector,frames,frameSize,featuresVector,numSamplesPerSymbol,'PSK2',VIP,VIA,CN,isPlot);
waitbar(3/6,f,'PSK2 done.');
signal_fsk2 = features(snrVector,frames,frameSize,featuresVector,numSamplesPerSymbol,'FSK2',VIP,VIA,CN);
waitbar(4/6,f,'FSK2 done.');
signal_fsk4 = features(snrVector,frames,frameSize,featuresVector,numSamplesPerSymbol,'FSK4',VIP,VIA,CN);
waitbar(5/6,f,'FSK4 done.');
signal_noise = features(snrVector,frames,frameSize,featuresVector,numSamplesPerSymbol,'noise');
waitbar(6/6,f,'Noise done.');
pause(0.5)
waitbar(1,f,'Finishing...');
pause(0.5)
toc

% Convert vector to string with '-' replacing spaces
t = datetime('now');
DateString = datestr(t);
str = strrep(DateString,' ','-');
str = strrep(str,':','-');
name = strcat('ftData-',str,'.mat');
save(name, 'name', ...
    'signal_qam4', ...
    'signal_qam16', ...
    'signal_psk2', ...
    'signal_fsk2', ...
    'signal_fsk4', ...
    'signal_noise', ...
    'frames', ...
    'frameSize',...
    'featuresVector',...
    'snrVector', ...
    'numSamplesPerSymbol', ...
    'CN', ...
    'VIP', ...
    'VIA');
close(f)
%% Plot
% 1 - Desvio padrao do valor absoluto da componente nao-linear da fase instantanea
% 2 - Desvio padrao da componente nao-linear da fase instantanea
%
% 3 - Desvio padrao do valor absoluto da componente nao-linear da frequência instantanea
% 4 - Desvio padrao da componente nao-linear da frequência instantanea
%
% 5 - Curtose
%
% 6 - Valor maximo da densidade espectral de potencia da amplitude instantanea normalizada e centralizada
%
% 7 - Media da amplitude instantanea normalizada centralizada ao quadrado
% 8 - Desvio padrao do valor absoluto da amplitude instantanea normalizada e centralizada
% 9 - Desvio padrao da amplitude instantanea normalizada e centralizada

% 10 - Assimetria (Skewness)
%%
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
dataFile = name; % Specify the calculated features file name to train
SNRstring = 'ALL'; % Can be set to '-20','-15','-10','-5','0','5','10' and '15'
% 'ALL' is default for training
hiddenLayer = [18 12 6]; % Config the setup of hidden layers
isPlot = 1; % Do you want to plot? It's confusion matrix
frames = 1000;
forgeNetwork(dataFile,SNRstring,isPlot,frames,hiddenLayer);
%% Evaluate
dataFile = name; % Specify the calculated features file name to evaluate
SNRstring = 'ALL'; % Can be set to '-15','-10','-5','0','5','10' and '15'
netFile = cat(2,'netConfig-18-12-6-',name); % Specify the created network file name to evaluate
useNetwork(dataFile,netFile,frames,SNRstring) % Do the work