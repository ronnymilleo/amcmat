%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Universidade Federal do Parana
% Programa de Pos-Graduacao em Engenharia Eletrica
% Ronny Milléo
% Adenilson Castro
% Atualizado 19/10/2021
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear
clc
%% Initial values
% Main vectors
snrArray = single(-10:2:20);

% Main config
symbolRate = 100000;
numSamplesPerSymbol = 8;
numFrames = 1000;
phase = single(randn(1,numFrames));
frameSize = 2048 / numSamplesPerSymbol;
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
%%
save('all_modulations.mat')