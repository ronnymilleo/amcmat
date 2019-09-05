%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Universidade Federal do Parana
% Programa de Pos-Graduacao em Engenharia Eletrica
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Clear memory
clear 
clc
%tic
%% Initial values 
%SNR = linspace(-20,20,41);
SNR = [-20 -15 -10 -5 0 5 10 15];                   % SNR vector
SNR_AB = 10.^(SNR/10);
frames = 10;                                        % Number of frames
frameSize = 4096;                                   % Frame size in bits
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
close all
plotVector = [6];
plotFeatures(plotVector,SNR,signal_qam4,signal_qam16,signal_psk2,signal_fsk2,signal_fsk4,signal_noise)
%toc
% Enterprise benchmark = 291.898754 s (7x100x9)

%% Plot das medias
close all
plotVector = [5];
plotMeanFeatures(plotVector,SNR,signal_qam4,signal_qam16,signal_psk2,signal_fsk2,signal_fsk4,signal_noise)

%% Create and train a RNA
targets = 3; %By now, only three modulations are under test

% Input data: result from signal characteristics extraction to each noise
% value. First, the data is organized by frame(each table), SNR(each line)
% and feature(each column)
for k = 1:frames
    for j = 1:9%9 = amount of features
        for i = 1:length(SNR)
            input_qam4(i,j,k) = signal_qam4(i,k,j);
            input_qam16(i,j,k) = signal_qam16(i,k,j);
            input_psk2(i,j,k) = signal_psk2(i,k,j);
            
            if j == 9 %Adding the SNR value to the last column
                for i = 1:length(SNR)
                    input_qam4(i,10,k) = SNR_AB(i);
                    input_qam16(i,10,k) = SNR_AB(i);
                    input_psk2(i,10,k) = SNR_AB(i);
                end
            end                
        end
    end
end

%concatenate all the values from individual inputs into a unique dataset
%with the last columns containing the target class
input = [];
for k = 1:targets
    for n = 1:frames
        switch k
            case 1
                input = [input;input_qam4(:,:,n)];
            case 2
                input = [input;input_qam16(:,:,n)];
            case 3
                input = [input;input_psk2(:,:,n)];
        end
    end
end

%Create the target class
target = [];
for i = 1:length(input)/(frames*length(SNR))
    switch i
        case 1
            for j = 1:length(input)/targets
                target = [target;1];
            end
        case 2
            for j = 1:length(input)/targets
                target = [target;2];
            end
        case 3
            for j = 1:length(input)/targets
                target = [target;3];
            end
    end
end

%RNA creation
hiddenLayer = 10;
net = patternnet(hiddenLayer,'trainrp');
net.layers{2}.transferFcn = 'softmax';
net.performFcn = 'mse';

net.divideParam.trainRatio = 70/100;
net.divideParam.valRatio = 15/100;
net.divideParam.testRatio = 15/100;

net = train(net, input, target);
output = net(input);
errors = gsubtract(target,output);
performance = perform(net,target,output);

figure;plotconfusion(target,output);
ax=gca;
ticks = {'4QAM','16QAM','2PSK'};
set(ax,'XTickLabel',ticks);
set(ax,'YTickLabel',ticks);

view(net)
