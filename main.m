%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Universidade Federal do Parana
% Programa de Pos-Graduacao em Engenharia Eletrica
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Clear memory
clear
clc
s = RandStream('mt19937ar','Seed',1);
rng('shuffle')
%% Initial values
% Main vectors
snrVector = -10:2:20;                           % SNR vector
featuresVector = [1 2 3 4 5 6 7 8 9 10];        % Features selection vector

% Main config
frames = 1000;                                 % Number of frames
frameSize = 1024;                               % Frame size in bits
symbolRate = 100000;                            % Symbol rate
numSamplesPerSymbol = 8;                        % Oversampling factor

% Modulation parameters
modParameters = struct(...
    'RP', 1, ... % Activade variable initial phase / Random phase
    'RA', 0, ... % Activade variable initial amplitude / Random amplitude
    'CN', 1, ... % Activate channel noise
    'isPlot', 0);% Activate modulation plot (scatterplot + spectrum)            
%% Generate dataset
[signal_bpsk, signal_qpsk, signal_8psk] = generatePSKDataset(snrVector,frames,frameSize,symbolRate,numSamplesPerSymbol,s,modParameters);
[signal_qam16, signal_qam64] = generateQAMDataset(snrVector,frames,frameSize,symbolRate,numSamplesPerSymbol,s,modParameters);
signal_noise = generateWGNDataset(snrVector,frames,frameSize);
% Convert to single precision
signal_bpsk = single(signal_bpsk);
signal_qpsk = single(signal_qpsk);
signal_8psk = single(signal_8psk);
signal_qam16 = single(signal_qam16);
signal_qam64 = single(signal_qam64);
signal_noise = single(signal_noise);
save('BPSK.mat','signal_bpsk')
save('QPSK.mat','signal_qpsk')
save('PSK8.mat','signal_8psk')
save('QAM16.mat','signal_qam16')
save('QAM64.mat','signal_qam64')
save('noise.mat','signal_noise')
%%
signals = struct('bpsk',signal_bpsk,'qpsk',signal_qpsk,'psk8',signal_8psk,'qam16',signal_qam16,'qam64',signal_qam64,'qam256',signal_qam256);
%% Generate and extract characteristics from signals 
disp('Starting. Please wait...');
tic
nFeatures = length(featuresVector);
fprintf('Extracting %d BPSK features...\n',nFeatures)
features_bpsk = features(1,signals,'BPSK',snrVector,featuresVector,frames,frameSize,symbolRate,numSamplesPerSymbol,modParameters);
disp('BPSK features extracted (1/6)')
fprintf('Extracting %d QPSK features...\n',nFeatures)
features_qpsk = features(1,signals,'QPSK',snrVector,featuresVector,frames,frameSize,symbolRate,numSamplesPerSymbol,modParameters);
disp(strcat('QAM4 features extracted (2/6)'))
fprintf('Extracting %d QAM16 features...\n',nFeatures)
features_qam16 = features(1,signals,'QAM16',snrVector,featuresVector,frames,frameSize,symbolRate,numSamplesPerSymbol,modParameters);
disp(strcat('QAM16 features extracted (3/6)'))
% fprintf('Extracting %d FSK2 features...\n',nFeatures)
% features_fsk2 = features(1,signals,'FSK2',snrVector,featuresVector,frames,frameSize,symbolRate,numSamplesPerSymbol,modParameters);
% disp(strcat('FSK2 features extracted (4/6)'))
% fprintf('Extracting %d FSK4 features...\n',nFeatures)
% features_fsk4 = features(1,signals,'FSK4',snrVector,featuresVector,frames,frameSize,symbolRate,numSamplesPerSymbol,modParameters);
% disp(strcat('FSK4 features extracted (5/6)'))
fprintf('Extracting %d WGN features...\n',nFeatures)
features_noise = features(1,signals,'noise',snrVector,featuresVector,frames,frameSize,symbolRate,numSamplesPerSymbol,modParameters);
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
    'features_bpsk', ...
    'features_qpsk', ...
    'features_qam16', ...
    'features_noise', ...
    'frames', ...
    'frameSize',...
    'symbolRate',...
    'numSamplesPerSymbol', ...
    'snrVector', ...
    'featuresVector', ...
    'modParameters');
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
%
% 10 - SNR
%% Plot
close all
plotVector = [1 2 3 4 5 6 7 8 9];
fontSize = 12;
nLines = 20;
plotFeatures(plotVector,nLines,fontSize,snrVector,features_bpsk,features_qpsk,features_qam16)%,signal_fsk2,signal_fsk4,signal_noise)
%% Plot das medias
close all
plotVector = [1 2 3 4 5 6 7 8 9];
fontSize = 12;
plotMeanFeatures(plotVector,fontSize,snrVector,features_bpsk,features_qpsk,features_qam16)%,signal_fsk2,signal_fsk4,signal_noise)
%% RNA
%% Train
% hiddenLayers = {...
%     [20 16], ...
%     [18 14], ...
%     [16 12], ...
%     [14 10], ...
%     [12 8], ...
%     [10 6], ...
%     [20 18 16], ...
%     [18 16 14], ...
%     [16 14 12], ...
%     [14 12 10], ...
%     [12 10 8], ...
%     [10 8 6]};
hiddenLayers = {[20 18 16]};
for n = 1:length(hiddenLayers)
    dataFile = name; % Specify the calculated features file name to train
    SNRstring = 'ALL'; % Can be set to '-20','-15','-10','-5','0','5','10' and '15'
    % 'ALL' is default for training
    hiddenLayer = hiddenLayers{n}; % Config the setup of hidden layers
    isPlot = 0; % Confusion matrix
    [net, performance, tr] = forgeNetwork(dataFile,snrVector,SNRstring,isPlot,frames,hiddenLayer);
    close all
end
%% Create a empty table to save results
T = table;
%% Evaluate
SNRstring = {};
for a = 1:length(snrVector)
    SNRstring = cat(2,SNRstring,num2str(snrVector(a)));
end
SNRstring = cat(2,SNRstring,'ALL');
result = zeros(length(SNRstring),8);
for n = 1:length(SNRstring)
    result(n,:) = useNetwork(net,frames,snrVector,n,SNRstring(n),features_bpsk,features_qpsk,features_qam16,features_fsk2,features_fsk4,features_noise); % Do the work
end
% Building table
frames_cell = num2cell(frames*ones(1,length(SNRstring))');
frameSize_cell = num2cell(frameSize*ones(1,length(SNRstring))');
result_cell = num2cell(result);
final_cell = cat(2,SNRstring',frames_cell,frameSize_cell,result_cell);

T0 = cell2table(final_cell,...
    'VariableNames',{'SNR' 'frames' 'frameSize' 'BPSK' 'QPSK' 'QAM16' 'FSK2' 'FSK4' 'WGN' 'Overall' 'Performance'});

T = cat(1,T,T0);
%% Save to file
writetable(T,'data.xlsx')