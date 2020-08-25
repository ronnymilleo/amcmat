%% Clear memory
clear
clc
s = RandStream('mt19937ar','Seed',1);
rng('shuffle')
%% Initial values
% Main vectors
snrVector = 20;                           % SNR vector

% Main config
frames = 1;                                 % Number of frames
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
save('testData.mat','signal_bpsk','signal_qpsk','signal_8psk','signal_qam16','signal_qam64','signal_noise')