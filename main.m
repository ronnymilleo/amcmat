%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Universidade Federal do Paraná
% Programa de Pós-Graduação em Engenharia Elétrica
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%generate signals with following modulations: QAM4, QAM16, PSK2
snr = [-5 0 5];                                     %SNR vector
n_frames = 5;                                       %number of frames

signal_qam4 = features(snr, n_frames, 'QAM4');
signal_qam16 = features(snr, n_frames, 'QAM16');
signal_psk2 = features(snr, n_frames, 'PSK2');

%%Create and train a RNA
n_targes=3; %By now, only three modulations are under test
len_vec=length(signal_qam4(:,:,1))

