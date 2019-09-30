function [result] =  amcNet(reload, modulations, isPlot, parameters)
load('amcData')
result = [];
output_qam4 = [];
output_qam16 = [];
output_psk2 = [];
output_fsk2 = [];
output_fsk4 = [];
output_noise = [];
if reload
%% Create and train a RNA
targets = 6;
input = [];
[m,n] = size(signal_qam4(:,:,1)');
for k = 1:targets
    switch k
        case 1
            for i = 1:parameters.frames
                input = [input,signal_qam4(:,:,i)'];
            end
        case 2
            for i = 1:parameters.frames
                input = [input, signal_qam16(:,:,i)'];
            end
        case 3 
            for i = 1:parameters.frames
                input = [input, signal_psk2(:,:,i)'];
            end
        case 4 
            for i = 1:parameters.frames
                input = [input, signal_fsk2(:,:,i)'];
            end
        case 5
            for i = 1:parameters.frames
                input = [input, signal_fsk4(:,:,i)'];
            end
        case 6
            for i = 1:parameters.frames
                input = [input, signal_noise(:,:,i)'];
            end
    end
end

target = [ones(1, parameters.frames*n) zeros(1, 5*parameters.frames*n)
      zeros(1, parameters.frames*n) ones(1,parameters.frames*n) zeros(1, 4*parameters.frames*n)
      zeros(1, 2*parameters.frames*n) ones(1,parameters.frames*n) zeros(1,3*parameters.frames*n)
      zeros(1, 3*parameters.frames*n) ones(1,parameters.frames*n) zeros(1,2*parameters.frames*n)
      zeros(1, 4*parameters.frames*n) ones(1,parameters.frames*n) zeros(1,parameters.frames*n)
      zeros(1, 5*parameters.frames*n) ones(1,parameters.frames*n)];

%RNA creation
hiddenLayer = [10,6];
trainingFunction = 'trainbr';
transferFunction = 'softmax';
net = patternnet(hiddenLayer,trainingFunction);
net.layers{3}.transferFcn = transferFunction;
net.performFcn = 'mse';

net.divideParam.trainRatio = 70/100;
net.divideParam.valRatio = 15/100;
net.divideParam.testRatio = 15/100;
net = train(net, input, target);
output = net(input);
errors = gsubtract(target,output);
performance = perform(net,target,output);
config = strrep(num2str(hiddenlayer),'   ','-')
name = strcat('netConfig','-',num2str(hiddenLayer));
save(name,'errors','performance','net','target','output')
%%
figure;plotconfusion(target,output);
ax=gca;
ticks = {'QAM4','QAM16','PSK2','FSK2','FSK4','WGN',''};
set(ax,'XTickLabel',ticks);
set(ax,'YTickLabel',ticks);
%%
view(net)

%% Generate a function for evaluating the RNA with random data
genFunction(net, 'amcFcn', 'MatrixOnly', 'yes');

end

%% Generate another random signal to test the RNA
frames_test = 100; %Number of frames for testing
labels = {'QAM4','QAM16','PSK2','FSK2','FSK4','WGN'};
snr_str = {'SNR: -20dB', 'SNR: -15dB', 'SNR: -10dB', 'SNR: -5dB', 'SNR: 0dB', 'SNR: 5dB', 'SNR: 10dB', 'SNR: 15dB'};

for i = 1:length(modulations)
    if(strcmp(modulations{i},'QAM4'))
        input_qam4 = [];
        data_qam4 = features(parameters.SNR,frames_test,parameters.frameSize,parameters.numSamplesPerSymbol,...
                            'QAM4',parameters.randomPhaseFlag,parameters.noiseFlag,parameters.plotFlag);
        for f = 1:frames_test
            input_qam4 = [input_qam4, data_qam4(:,:,f)'];
        end
        output_qam4 = amcFcn(input_qam4);
        if isPlot
            for j = 1:length(parameters.SNR)
                figure    
                pie(output_qam4(:,j))
                legend(labels)
                title(snr_str{j})
            end
        end
    elseif(strcmp(modulations{i},'QAM16'))
        input_qam16 = [];
        data_qam16 = features(parameters.SNR,frames_test,parameters.frameSize,parameters.numSamplesPerSymbol,...
                            'QAM16',parameters.randomPhaseFlag,parameters.noiseFlag,parameters.plotFlag);
        for f = 1:frames_test
            input_qam16 = [input_qam16, data_qam16(:,:,f)'];
        end
        output_qam16 = amcFcn(input_qam16);
        if isPlot
            for j = 1:length(parameters.SNR)
                figure    
                pie(output_qam16(:,j))
                legend(labels)
                title(snr_str{j})
            end
        end
    elseif(strcmp(modulations{i},'PSK2'))
        input_psk2 = [];
        data_psk2 = features(parameters.SNR,frames_test,parameters.frameSize,parameters.numSamplesPerSymbol,...
                            'PSK2',parameters.randomPhaseFlag,parameters.noiseFlag,parameters.plotFlag);
        for f = 1:frames_test
            input_psk2 = [input_psk2, data_psk2(:,:,f)'];
        end
        output_psk2 = amcFcn(input_psk2);
        if isPlot
            for j = 1:length(parameters.SNR)
                figure    
                pie(output_psk2(:,j))
                legend(labels)
                title(snr_str{j})
            end
        end
    elseif(strcmp(modulations{i},'FSK2'))
        input_fsk2 = [];
        data_fsk2 = features(parameters.SNR,frames_test,parameters.frameSize,parameters.numSamplesPerSymbol,...
                            'FSK2',parameters.randomPhaseFlag,parameters.noiseFlag,parameters.plotFlag);
        for f = 1:frames_test
            input_fsk2 = [input_fsk2, data_fsk2(:,:,f)'];
        end
        output_fsk2 = amcFcn(input_fsk2);
        if isPlot
            for j = 1:length(parameters.SNR)
                figure    
                pie(output_fsk2(:,j))
                legend(labels)
                title(snr_str{j})
            end
        end
    elseif(strcmp(modulations{i},'FSK4'))
        input_fsk4 = [];
        data_fsk4 = features(parameters.SNR,frames_test,parameters.frameSize,parameters.numSamplesPerSymbol,...
                            'FSK4',parameters.randomPhaseFlag,parameters.noiseFlag,parameters.plotFlag);
        for f = 1:frames_test
            input_fsk4 = [input_fsk4, data_fsk4(:,:,f)'];
        end
        output_fsk4 = amcFcn(input_fsk4);
        if isPlot
            for j = 1:length(parameters.SNR)
                figure    
                pie(output_fsk4(:,j))
                legend(labels)
                title(snr_str{j})
            end
        end
    else
        input_noise = [];
        data_noise = features(parameters.SNR,frames_test,parameters.frameSize,parameters.numSamplesPerSymbol,'noise');
        for f = 1:frames_test
            input_noise = [input_noise, data_noise(:,:,f)'];
        end
        output_noise = amcFcn(input_noise);        
        if isPlot
            for j = 1:length(parameters.SNR)
                figure    
                pie(output_noise(:,j))
                legend(labels)
                title(snr_str{j})
            end
        end
    end
end
%%
result = cat(3, output_qam4, output_qam16, output_psk2, output_fsk2, output_fsk4, output_noise);
end
