%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Universidade Federal do Parana
% Programa de Pos-Graduacao em Engenharia Eletrica
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Clear memory
clear 
clc
%% Initial values 
%SNR = linspace(-20,20,41);
SNR = [-20 -15 -10 -5 0 5 10 15];                   % SNR vector
SNR_AB = 10.^(SNR/10);
frames = 250;                                       % Number of frames
frameSize = 2048;                                   % Frame size in bits
numSamplesPerSymbol = 8;                            % Oversampling factor
randomPhaseFlag = 1;                                % 1 = random initial phase
noiseFlag = 1;                                      % 1 = generate channel noise
plotFlag = 0;                                       % 1 = scatterplot

%% Generate and extract characteristics from signals 
% with following modulations(initial test purpose):
% QAM4, QAM16, PSK2, FSK2, FSK4

f = uifigure;
d = uiprogressdlg(f,'Title','Generating signal data...','Indeterminate','on');

% Uncomment to get the same bits every time
%rng default 

signal_qam4 = features(SNR,frames,frameSize,numSamplesPerSymbol,'QAM4',randomPhaseFlag,noiseFlag,plotFlag);
signal_qam16 = features(SNR,frames,frameSize,numSamplesPerSymbol,'QAM16',randomPhaseFlag,noiseFlag,plotFlag);
signal_psk2 = features(SNR,frames,frameSize,numSamplesPerSymbol,'PSK2',randomPhaseFlag,noiseFlag,plotFlag);
signal_fsk2 = features(SNR,frames,frameSize,numSamplesPerSymbol,'FSK2',randomPhaseFlag,noiseFlag);
signal_fsk4 = features(SNR,frames,frameSize,numSamplesPerSymbol,'FSK4',randomPhaseFlag,noiseFlag);
signal_noise = features(SNR,frames,frameSize,numSamplesPerSymbol,'noise');

close(d);
close(f);
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
plotVector = [5];
fontSize = 12;
plotFeatures(plotVector,fontSize,SNR,signal_qam4,signal_qam16,signal_psk2,signal_fsk2,signal_fsk4,signal_noise)

%% Plot das medias
close all
plotVector = [5];
plotMeanFeatures(plotVector,fontSize,SNR,signal_qam4,signal_qam16,signal_psk2,signal_fsk2,signal_fsk4,signal_noise)

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

net.trainFcn = 'trainscg';
net.trainParam.goal=1e-6;

net.divideParam.trainRatio = 70/100;
net.divideParam.valRatio = 15/100;
net.divideParam.testRatio = 15/100;
net = train(net, input, target, 'useParallel','yes','showResources','yes','useGPU','yes');

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

%% Generate a function for evaluating the RNA with random data
genFunction(net, 'rnaFcn', 'MatrixOnly', 'yes');

%% Generate another random signal to test the RNA
frames_test = 1;

data_qam4 = features(SNR,frames_test,frameSize,numSamplesPerSymbol,'QAM4',randomPhaseFlag,noiseFlag,plotFlag);
data_qam16 = features(SNR,frames_test,frameSize,numSamplesPerSymbol,'QAM16',randomPhaseFlag,noiseFlag,plotFlag);
data_psk2 = features(SNR,frames_test,frameSize,numSamplesPerSymbol,'PSK2',randomPhaseFlag,noiseFlag,plotFlag);
data_fsk2 = features(SNR,frames_test,frameSize,numSamplesPerSymbol,'FSK2',randomPhaseFlag,noiseFlag);
data_fsk4 = features(SNR,frames_test,frameSize,numSamplesPerSymbol,'FSK4',randomPhaseFlag,noiseFlag);
data_noise = features(SNR,frames_test,frameSize,numSamplesPerSymbol,'noise');

input_qam4 = [];
input_qam16 = [];
input_psk2 = [];
input_fsk2 = [];
input_fsk4 = [];
input_noise = [];

for k = 1:targets
    switch k
        case 1
            for i = 1:frames_test
                input_qam4 = [input_qam4, data_qam4(:,:,i)'];
            end
        case 2        
            for i = 1:frames_test
                input_qam16 = [input_qam16, data_qam16(:,:,i)'];
            end
        case 3
            for i = 1:frames_test
                input_psk2 = [input_psk2, data_psk2(:,:,i)'];
            end
        case 4
            for i = 1:frames_test
                input_fsk2 = [input_fsk2, data_fsk2(:,:,i)'];
            end
        case 5
            for i = 1:frames_test
                input_fsk4 = [input_fsk4, data_fsk4(:,:,i)'];
            end
        case 6
            for i = 1:frames_test
                input_noise = [input_noise, data_noise(:,:,i)'];
            end
    end
end

output_qam4 = rnaFcn(input_qam4);
output_qam16 = rnaFcn(input_qam16);
output_psk2 = rnaFcn(input_psk2);
output_fsk2 = rnaFcn(input_fsk2);
output_fsk4 = rnaFcn(input_fsk4);
output_noise = rnaFcn(input_noise);
%% Plot pie chart with the result of RNA function

labels = {'QAM4','QAM16','PSK2','FSK2','FSK4','WGN'};
snr_str = {'SNR: -20dB', 'SNR: -15dB', 'SNR: -10dB', 'SNR: -5dB', 'SNR: 0dB', 'SNR: 5dB', 'SNR: 10dB', 'SNR: 15dB'};
for i = 1:length(SNR)
    figure    
    pie(output_qam4(:,i))
    legend(labels)
    title(snr_str{i})
end
