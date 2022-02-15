%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Universidade Federal do Parana
% Programa de Pos-Graduacao em Engenharia Eletrica
% Ronny Milleo
% Adenilson Castro
% Updated 15/02/2022
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear
clc
%% Initial values
% Main vectors
% Using single to maintain 32 bit floats
% Default is -10 dB to 20 dB
snrArray = single(-10:2:20);

% Main config
% Symbol rate can be any number
symbolRate = 100000;
numSamplesPerSymbol = 8;
numFrames = 1;
% Every frame is created using a random initial phase
phase = single(randn(1,numFrames));
% Keep all frames with the same number of samples
frameSize = 2048 / numSamplesPerSymbol;
% Modulations
M = [2 4 8 16 64];

% Preallocation
signal_bpsk = single(zeros(length(snrArray), numFrames, frameSize * numSamplesPerSymbol));
signal_qpsk = single(zeros(length(snrArray), numFrames, frameSize * numSamplesPerSymbol));
signal_8psk = single(zeros(length(snrArray), numFrames, frameSize * numSamplesPerSymbol));
signal_qam16 = single(zeros(length(snrArray), numFrames, frameSize * numSamplesPerSymbol));
signal_qam64 = single(zeros(length(snrArray), numFrames, frameSize * numSamplesPerSymbol));
signal_noise = single(zeros(length(snrArray), numFrames, frameSize * numSamplesPerSymbol));
%%
for i = 1:5 % Modulation loop
    if M(i) == 2
        disp('Generating BPSK...')
        for j = 1:length(snrArray) % SNR loop
            str = sprintf('Generating BPSK for SNR = %d', snrArray(j));
            disp(str)
            for k = 1:numFrames % Frame loop
                signal_bpsk(j, k, :) = generate_psk(M(i),frameSize,numSamplesPerSymbol,snrArray(j),phase(k));
            end
        end
    end
    if M(i) == 4
        disp('Generating QPSK...')
        for j = 1:length(snrArray) % SNR loop
            str = sprintf('Generating QPSK for SNR = %d', snrArray(j));
            disp(str)
            for k = 1:numFrames % Frame loop
                signal_qpsk(j, k, :) = generate_psk(M(i),frameSize,numSamplesPerSymbol,snrArray(j),phase(k));
            end
        end
    end
    if M(i) == 8
        disp('Generating PSK8...')
        for j = 1:length(snrArray) % SNR loop
            str = sprintf('Generating PSK8 for SNR = %d', snrArray(j));
            disp(str)
            for k = 1:numFrames % Frame loop
                signal_8psk(j, k, :) = generate_psk(M(i),frameSize,numSamplesPerSymbol,snrArray(j),phase(k));
            end
        end
    end
    if M(i) == 16
        disp('Generating QAM16...')
        for j = 1:length(snrArray) % SNR loop
            str = sprintf('Generating QAM16 for SNR = %d', snrArray(j));
            disp(str)
            for k = 1:numFrames % Frame loop
                signal_qam16(j, k, :) = generate_qam(M(i),frameSize,numSamplesPerSymbol,snrArray(j),phase(k));
            end
        end
    end
    if M(i) == 64
        disp('Generating QAM64...')
        for j = 1:length(snrArray) % SNR loop
            str = sprintf('Generating QAM64 for SNR = %d', snrArray(j));
            disp(str)
            for k = 1:numFrames % Frame loop
                signal_qam64(j, k, :) = generate_qam(M(i),frameSize,numSamplesPerSymbol,snrArray(j),phase(k));
            end
        end
    end
end
for j = 1:length(snrArray) % SNR loop
    disp('Generating noise...')
    for k = 1:numFrames % Frame loop
        signal_noise(j, k, :) = wgn(frameSize*numSamplesPerSymbol,1,0,'dBW','complex');
    end
end
%% Save everything to a mat file to be loaded into the python script
save('all_modulations.mat')