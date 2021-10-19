%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Universidade Federal do Parana
% Programa de Pos-Graduacao em Engenharia Eletrica
% Ronny Milléo
% Adenilson Castro
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Clear memory
clear
clc
s = RandStream('mt19937ar','Seed',42);
rng('shuffle')
%% Initial values
% Main vectors
snrVector = -10:2:20;                          % SNR array

% Main config
symbolRate = 100000;                           % Symbol rate
numSamplesPerSymbol = 8;                       % Oversampling factor
frames = 10;                                 % Number of frames
frameSize = 2048 / numSamplesPerSymbol;        % Frame size in bits

% Modulation parameters
modParameters = struct(...
    'RP', 1, ... % Activade variable initial phase / Random phase
    'RA', 0, ... % Activade variable initial amplitude / Random amplitude
    'CN', 1, ... % Activate channel noise
    'isPlot', 0);% Activate modulation plot (scatterplot + spectrum)            
%% Generate dataset
[signal_bpsk, signal_qpsk, signal_8psk] = generatePSKDataset(snrVector,frames,frameSize,symbolRate,numSamplesPerSymbol,s,modParameters);
[signal_qam16, signal_qam64] = generateQAMDataset(snrVector,frames,frameSize,symbolRate,numSamplesPerSymbol,s,modParameters);
signal_noise = generateWGNDataset(snrVector,frames,frameSize,numSamplesPerSymbol);
% Convert to single precision
signal_bpsk = single(signal_bpsk);
signal_qpsk = single(signal_qpsk);
signal_8psk = single(signal_8psk);
signal_qam16 = single(signal_qam16);
signal_qam64 = single(signal_qam64);
signal_noise = single(signal_noise);
%%
save('all_modulations.mat')
%%
save('BPSK.mat','signal_bpsk')
save('QPSK.mat','signal_qpsk')
save('PSK8.mat','signal_8psk')
save('QAM16.mat','signal_qam16')
save('QAM64.mat','signal_qam64')
save('noise.mat','signal_noise')
%%
