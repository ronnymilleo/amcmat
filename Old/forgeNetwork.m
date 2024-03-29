function [net, performance, tr] = forgeNetwork(file,snrVector,snrString,isPlot,frames,hiddenLayer)
%% Create a new network using input parameters
% file is the string name of the file that will be loaded
% SNR is the string setting to select if the network will train using only
% 1 measurement of SNR or all of them, use 'ALL'
% isPlot is the plot flag, 1 == plot
% signal_bpsk = [];
% signal_qpsk = [];
% signal_qam16 = [];
% signal_fsk2 = [];
% signal_fsk4 = [];
% signal_noise = [];
load(file,'signal_bpsk','signal_qpsk','signal_qam16','signal_fsk2','signal_fsk4','signal_noise')
input = [];
signal = [];
for a = 1:6
    switch(a)
        case 1
            signal = signal_bpsk;
        case 2
            signal = signal_qpsk;
        case 3
            signal = signal_qam16;
        case 4
            signal = signal_fsk2;
        case 5
            signal = signal_fsk4;
        case 6
            signal = signal_noise;
    end
    if (strcmp(snrString,'ALL'))
        for b = 1:length(snrVector) 
            for i = 1:frames
                input = cat(2,input,signal(b,:,i)');
            end
        end
    else
        disp('Under construction...');
    end 
end
[~,n] = size(signal_bpsk(:,:,1)');
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
net.divideParam.trainRatio = 70/100;
net.divideParam.valRatio = 0/100; % Takes out validation
net.divideParam.testRatio = 30/100;
net.trainParam.epochs = 10000;
[net,tr]= train(net, input, target,'useGPU','yes'); % GPU speeds up sim.
output = net(input);
performance = perform(net,target,output);
config0 = strrep(num2str(hiddenLayer),'   ','-');
config1 = strrep(config0,'  ','-');
config2 = strrep(config1,' ','-');
performance_str = strrep(num2str(performance),'0.','p');
name = strcat('.\Nets\',performance_str,'-',file(8:end),'-','net','-',config2);
save(name,'net','performance','tr','hiddenLayer')
%% Generate a function for evaluating the RNA with random data
genFunction(net, 'amcFcn', 'MatrixOnly', 'yes');
%%
if(isPlot)
    figure;plotconfusion(target,output);
    ax=gca;
    ticks = {'BPSK','QPSK','QAM16','FSK2','FSK4','WGN',''};
    set(ax,'XTickLabel',ticks);
    set(ax,'YTickLabel',ticks);
    view(net)
end
end