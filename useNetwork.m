function [] = useNetwork(file,netFile,frames,SNR)
%% Use existing network
% Allocation
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
    if (strcmp(SNR,'-20') || strcmp(SNR,'ALL'))
        for i = 1:frames
            input = cat(2,input,signal(1,:,i)'); % SNR = -20
        end
    end
    if (strcmp(SNR,'-15') || strcmp(SNR,'ALL'))
        for i = 1:frames
            input = cat(2,input,signal(2,:,i)'); % SNR = -15
        end
    end
    if (strcmp(SNR,'-10') || strcmp(SNR,'ALL'))
        for i = 1:frames
            input = cat(2,input,signal(3,:,i)'); % SNR = -10
        end
    end
    if (strcmp(SNR,'-5') || strcmp(SNR,'ALL'))
        for i = 1:frames
            input = cat(2,input,signal(4,:,i)'); % SNR = -5
        end
    end
    if (strcmp(SNR,'0') || strcmp(SNR,'ALL'))
        for i = 1:frames
            input = cat(2,input,signal(5,:,i)'); % SNR = 0
        end
    end
    if (strcmp(SNR,'5') || strcmp(SNR,'ALL'))
        for i = 1:frames
            input = cat(2,input,signal(6,:,i)'); % SNR = 5
        end
    end
    if (strcmp(SNR,'10') || strcmp(SNR,'ALL'))
        for i = 1:frames
            input = cat(2,input,signal(7,:,i)'); % SNR = 10
        end
    end
    if (strcmp(SNR,'15') || strcmp(SNR,'ALL'))
        for i = 1:frames
            input = cat(2,input,signal(8,:,i)'); % SNR = 15
        end
    end
end
if(strcmp(SNR,'ALL'))
    [m,n] = size(signal_qam4(:,:,1)');
    target = [ones(1, frames*n) zeros(1, 5*frames*n)
          zeros(1, frames*n) ones(1,frames*n) zeros(1, 4*frames*n)
          zeros(1, 2*frames*n) ones(1,frames*n) zeros(1,3*frames*n)
          zeros(1, 3*frames*n) ones(1,frames*n) zeros(1,2*frames*n)
          zeros(1, 4*frames*n) ones(1,frames*n) zeros(1,frames*n)
          zeros(1, 5*frames*n) ones(1,frames*n)];
else
    [m,n] = size(signal_qam4(1,:,1)');
    target = [ones(1, frames*n) zeros(1, 5*frames*n)
          zeros(1, frames*n) ones(1,frames*n) zeros(1, 4*frames*n)
          zeros(1, 2*frames*n) ones(1,frames*n) zeros(1,3*frames*n)
          zeros(1, 3*frames*n) ones(1,frames*n) zeros(1,2*frames*n)
          zeros(1, 4*frames*n) ones(1,frames*n) zeros(1,frames*n)
          zeros(1, 5*frames*n) ones(1,frames*n)];
end
load(netFile)
genFunction(net, 'amcFcn', 'MatrixOnly', 'yes'); % Update network function
output = amcFcn(input);
performance = perform(net,target,output);
str = strcat('Network performance: ',num2str(performance));
disp(str)
figure;plotconfusion(target,output);
ax=gca;
ticks = {'QAM4','QAM16','PSK2','FSK2','FSK4','WGN',''};
set(ax,'XTickLabel',ticks);
set(ax,'YTickLabel',ticks);
end