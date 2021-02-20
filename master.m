%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Universidade Federal do Parana
% Programa de Pos-Graduacao em Engenharia Eletrica
% Ronny Milléo
% Adenilson Castro
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear
clc
%% Initial values
% Main vectors
snrArray = single(-10:2:20);

% Main config
symbolRate = 10000;
numSamplesPerSymbol = 8;
numFrames = 1000;
initial_phase_offset = single(randn(1,numFrames));
frameSize = 2048 / numSamplesPerSymbol;
M = [2 4 8 16 64];

% Preallocation
signal_bpsk = single(zeros(length(snrArray), numFrames, frameSize * numSamplesPerSymbol));
signal_qpsk = signal_bpsk;
signal_8psk = signal_qpsk;
signal_qam16 = signal_8psk;
signal_qam64 = signal_qam16;
signal_noise = signal_qam64;
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
%signal_bpsk = squeeze(signal_bpsk);
%signal_qpsk = squeeze(signal_qpsk);
%signal_8psk = squeeze(signal_8psk);
%signal_qam16 = squeeze(signal_qam16);
%signal_qam64 = squeeze(signal_qam64);
%signal_noise = squeeze(signal_noise);
%%
save('all_modulations.mat')
%%
%save('BPSK_ltd_rnd_phases.mat','signal_bpsk')
%save('QPSK_ltd_rnd_phases.mat','signal_qpsk')
%save('PSK8_ltd_rnd_phases.mat','signal_8psk')
%save('QAM16_ltd_rnd_phases.mat','signal_qam16')
%save('QAM64_ltd_rnd_phases.mat','signal_qam64')
%save('noise.mat','signal_noise')