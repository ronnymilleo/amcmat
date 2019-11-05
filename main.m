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
frames = 5000;                                      % Number of frames
frameSize = 4096;                                   % Frame size in bits
featuresVector = [1 2 3 4 5 6 7 8 9 10];            % Features selection vector
numSamplesPerSymbol = 8;                            % Oversampling factor

% Channel settings
snrVector = -14:2:14;                               % SNR vector
pathDelays = (0:5:15)*1e-6;                         % seconds
avgPathGains = [0 -3 -6 -9];                        % dB
maxDopplerShift = 50;                               % Hz
rayleightSettings = struct(...
    'Fs',numSamplesPerSymbol, ...
    'pathDelays',pathDelays, ...
    'avgPathGains',avgPathGains, ...
    'fD',maxDopplerShift);

% Modulation parameters
VIP = 1;        % Variable initial phase
VIA = 1;        % Variable initial amplitude
CN = 1;         % Channel noise
isPlot = 0;     % Modulation plot (scatterplot)
%% Generate and extract characteristics from signals 
disp('Starting. Please wait...');
tic
nFeatures = length(featuresVector);
fprintf('Extracting %d BPSK features...\n',nFeatures)
signal_bpsk = features(snrVector,frames,frameSize,featuresVector,numSamplesPerSymbol,'BPSK',VIP,VIA,CN,isPlot);
disp('BPSK features extracted (1/6)')
fprintf('Extracting %d QPSK features...\n',nFeatures)
signal_qpsk = features(snrVector,frames,frameSize,featuresVector,numSamplesPerSymbol,'QPSK',VIP,VIA,CN,isPlot);
disp(strcat('QAM4 features extracted (2/6)'))
fprintf('Extracting %d QAM16 features...\n',nFeatures)
signal_qam16 = features(snrVector,frames,frameSize,featuresVector,numSamplesPerSymbol,'QAM16',VIP,VIA,CN,isPlot);
disp(strcat('QAM16 features extracted (3/6)'))
fprintf('Extracting %d FSK2 features...\n',nFeatures)
signal_fsk2 = features(snrVector,frames,frameSize,featuresVector,numSamplesPerSymbol,'FSK2',VIP,VIA,CN);
disp(strcat('FSK2 features extracted (4/6)'))
fprintf('Extracting %d FSK4 features...\n',nFeatures)
signal_fsk4 = features(snrVector,frames,frameSize,featuresVector,numSamplesPerSymbol,'FSK4',VIP,VIA,CN);
disp(strcat('FSK4 features extracted (5/6)'))
fprintf('Extracting %d WGN features...\n',nFeatures)
signal_noise = features(snrVector,frames,frameSize,featuresVector,numSamplesPerSymbol,'noise');
disp(strcat('WGN features extracted (6/6)'))
toc
disp(strcat('Done. Saving...'))
% Convert vector to string with '-' replacing spaces
t = datetime('now');
DateString = datestr(t);
str = strrep(DateString,' ','-');
str = strrep(str,':','-');
name = strcat('.\Data\ftData-',str);
save(name, 'name', ...
    'signal_bpsk', ...
    'signal_qpsk', ...
    'signal_qam16', ...
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
disp(strcat('Finished.'))
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
plotVector = [3 4 10];
fontSize = 12;
nLines = 20;
plotFeatures(plotVector,nLines,fontSize,snrVector,signal_bpsk,signal_qpsk,signal_qam16,signal_fsk2,signal_fsk4,signal_noise)
%% Plot das medias
close all
plotVector = [3 4 10];
fontSize = 12;
plotMeanFeatures(plotVector,fontSize,snrVector,signal_bpsk,signal_qpsk,signal_qam16,signal_fsk2,signal_fsk4,signal_noise)
%% RNA
%% Train
dataFile = name; % Specify the calculated features file name to train
SNRstring = 'ALL'; % Can be set to '-20','-15','-10','-5','0','5','10' and '15'
% 'ALL' is default for training
hiddenLayer = [10 6]; % Config the setup of hidden layers
isPlot = 1; % Do you want to plot? It's confusion matrix
%frames = 1000;
forgeNetwork(dataFile,snrVector,SNRstring,isPlot,frames,hiddenLayer);
%% Evaluate
SNRstring = '-5'; % Can be set to '-15','-10','-5','0','5','10' and '15'
useNetwork(net,frames,SNRstring,signal_bpsk,signal_qpsk,signal_qam16,signal_fsk2,signal_fsk4,signal_noise) % Do the work