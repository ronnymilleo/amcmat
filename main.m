%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Universidade Federal do Parana
% Programa de Pos-Graduacao em Engenharia Eletrica
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Clear memory
clear 
clc
tic
%% Initial values 
%SNR = linspace(-20,20,41);
SNR = [-20 -15 -10 -5 0 5 10 15];                   % SNR vector
SNR_AB = 10.^(SNR/10);
frames = 200;                                        % Number of frames
frameSize = 2048;                                   % Frame size in bits
numSamplesPerSymbol = 8;                            % Oversampling factor
randomPhaseFlag = 0;                                % 1 = random initial phase
noiseFlag = 1;                                      % 1 = generate channel noise
plotFlag = 0;                                       % 1 = scatterplot

%% Generate and extract characteristics from signals 
% with following modulations(initial test purpose):
% QAM4, QAM16, PSK2, FSK2, FSK4
                                       
% Uncomment to get the same bits every time
%rng default 
signal_qam4 = features(SNR,frames,frameSize,numSamplesPerSymbol,'QAM4',randomPhaseFlag,noiseFlag,plotFlag);
signal_qam16 = features(SNR,frames,frameSize,numSamplesPerSymbol,'QAM16',randomPhaseFlag,noiseFlag,plotFlag);
signal_psk2 = features(SNR,frames,frameSize,numSamplesPerSymbol,'PSK2',randomPhaseFlag,noiseFlag,plotFlag);
signal_fsk2 = features(SNR,frames,frameSize,numSamplesPerSymbol,'FSK2',randomPhaseFlag,noiseFlag);
signal_fsk4 = features(SNR,frames,frameSize,numSamplesPerSymbol,'FSK4',randomPhaseFlag,noiseFlag);
signal_noise = features(SNR,frames,frameSize,numSamplesPerSymbol,'noise');
toc

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

%close all
%plotVector = [5];
%plotFeatures(plotVector,SNR,signal_qam4,signal_qam16,signal_psk2,signal_fsk2,signal_fsk4,signal_noise)

%% Plot das medias
close all
plotVector = [1 2 3 4 5 6 7 8 9];
plotMeanFeatures(plotVector,SNR,signal_qam4,signal_qam16,signal_psk2,signal_fsk2,signal_fsk4,signal_noise)

%% Create and train a RNA
targets = 6; %By now, only three modulations are under test
input = [];
[m,n] = size(signal_qam4(:,:,1)');
for k = 1:targets
    switch k
        case 1
            for i = 1:frames
                input = [input,signal_qam4(:,:,i)'];
            end
        case 2
            for i = 1:frames
                input = [input, signal_qam16(:,:,i)'];
            end
        case 3 
            for i = 1:frames
                input = [input, signal_psk2(:,:,i)'];
            end
        case 4 
            for i = 1:frames
                input = [input, signal_fsk2(:,:,i)'];
            end
        case 5
            for i = 1:frames
                input = [input, signal_fsk4(:,:,i)'];
            end
        case 6
            for i = 1:frames
                input = [input, signal_noise(:,:,i)'];
            end
    end
end

target = [ones(1, frames*n) zeros(1, 5*frames*n)
          zeros(1, frames*n) ones(1,frames*n) zeros(1, 4*frames*n)
          zeros(1, 2*frames*n) ones(1,frames*n) zeros(1,3*frames*n)
          zeros(1, 3*frames*n) ones(1,frames*n) zeros(1,2*frames*n)
          zeros(1, 4*frames*n) ones(1,frames*n) zeros(1,frames*n)
          zeros(1, 5*frames*n) ones(1,frames*n)];

%RNA creation
hiddenLayer = [10, 10, 10];
net = patternnet(hiddenLayer,'trainbr');
net.layers{4}.transferFcn = 'softmax';
net.performFcn = 'mse';

net.divideParam.trainRatio = 70/100;
net.divideParam.valRatio = 15/100;
net.divideParam.testRatio = 15/100;

net = train(net, input, target);
output = net(input);
errors = gsubtract(target,output);
performance = perform(net,target,output);
%%
figure;plotconfusion(target,output);
ax=gca;
ticks = {'QAM4','QAM16','PSK2','FSK2','FSK4','WGN',''};
set(ax,'XTickLabel',ticks);
set(ax,'YTickLabel',ticks);
%%
view(net)