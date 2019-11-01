function forgeNetwork(file,SNR,isPlot,frames,hiddenLayer)
%% Create a new network using input parameters
% file is the string name of the file that will be loaded
% SNR is the string setting to select if the network will train using only
% 1 measurement of SNR or all of them, use 'ALL'
% isPlot is the plot flag, 1 == plot
signal_qam4 = [];
signal_qam16 = [];
signal_psk2 = [];
signal_fsk2 = [];
signal_fsk4 = [];
signal_noise = [];
load(file,'signal_qam4','signal_qam16','signal_psk2','signal_fsk2','signal_fsk4','signal_noise')
input = [];
signal = [];
for a = 1:6
    switch(a)
        case 1
            signal = signal_qam4;
        case 2
            signal = signal_qam16;
        case 3
            signal = signal_psk2;
        case 4
            signal = signal_fsk2;
        case 5
            signal = signal_fsk4;
        case 6
            signal = signal_noise;
    end
    if (strcmp(SNR,'-15') || strcmp(SNR,'ALL'))
        for i = 1:frames
            input = cat(2,input,signal(1,:,i)'); % SNR = -15
        end
    end
    if (strcmp(SNR,'-10') || strcmp(SNR,'ALL'))
        for i = 1:frames
            input = cat(2,input,signal(2,:,i)'); % SNR = -10
        end
    end
    if (strcmp(SNR,'-5') || strcmp(SNR,'ALL'))
        for i = 1:frames
            input = cat(2,input,signal(3,:,i)'); % SNR = -5
        end
    end
    if (strcmp(SNR,'0') || strcmp(SNR,'ALL'))
        for i = 1:frames
            input = cat(2,input,signal(4,:,i)'); % SNR = 0
        end
    end
    if (strcmp(SNR,'5') || strcmp(SNR,'ALL'))
        for i = 1:frames
            input = cat(2,input,signal(5,:,i)'); % SNR = 5
        end
    end
    if (strcmp(SNR,'10') || strcmp(SNR,'ALL'))
        for i = 1:frames
            input = cat(2,input,signal(6,:,i)'); % SNR = 10
        end
    end
    if (strcmp(SNR,'15') || strcmp(SNR,'ALL'))
        for i = 1:frames
            input = cat(2,input,signal(7,:,i)'); % SNR = 15
        end
    end
end
[m,n] = size(signal_qam4(:,:,1)');
target = [ones(1, frames*n) zeros(1, 5*frames*n)
      zeros(1, frames*n) ones(1,frames*n) zeros(1, 4*frames*n)
      zeros(1, 2*frames*n) ones(1,frames*n) zeros(1,3*frames*n)
      zeros(1, 3*frames*n) ones(1,frames*n) zeros(1,2*frames*n)
      zeros(1, 4*frames*n) ones(1,frames*n) zeros(1,frames*n)
      zeros(1, 5*frames*n) ones(1,frames*n)];
%%
% RNA creation
%trainingFunction = 'trainbr'; Default is faster
transferFunction = 'softmax';
net = patternnet(hiddenLayer);
net.layers{length(hiddenLayer)+1}.transferFcn = transferFunction;
%net.performFcn = 'mse'; Default is better
net.divideParam.trainRatio = 80/100;
net.divideParam.valRatio = 0/100; % Takes out validation
net.divideParam.testRatio = 20/100;
net = train(net, input, target,'useGPU','yes'); % GPU speeds up sim.
output = net(input);
performance = perform(net,target,output);
config0 = strrep(num2str(hiddenLayer),'   ','-');
config1 = strrep(config0,'  ','-');
config2 = strrep(config1,' ','-');
name = strcat('netConfig','-',config2,'-',file);
save(name,'net','performance')
%% Generate a function for evaluating the RNA with random data
genFunction(net, 'amcFcn', 'MatrixOnly', 'yes');
%%
if(isPlot)
    figure;plotconfusion(target,output);
    ax=gca;
    ticks = {'QAM4','QAM16','PSK2','FSK2','FSK4','WGN',''};
    set(ax,'XTickLabel',ticks);
    set(ax,'YTickLabel',ticks);
    view(net)
end
end