function [result] = useNetwork(net,frames,SNR,signal_bpsk,signal_qpsk,signal_qam16,signal_fsk2,signal_fsk4,signal_noise)
%% Use existing network
% Allocation
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
%     if (strcmp(SNR,'-20') || strcmp(SNR,'ALL'))
%         for i = 1:frames
%             input = cat(2,input,signal(1,:,i)'); % SNR = -20
%         end
%     end
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
if(strcmp(SNR,'ALL'))
    [m,n] = size(signal_bpsk(:,:,1)');
    target = [ones(1, frames*n) zeros(1, 5*frames*n)
          zeros(1, frames*n) ones(1,frames*n) zeros(1, 4*frames*n)
          zeros(1, 2*frames*n) ones(1,frames*n) zeros(1,3*frames*n)
          zeros(1, 3*frames*n) ones(1,frames*n) zeros(1,2*frames*n)
          zeros(1, 4*frames*n) ones(1,frames*n) zeros(1,frames*n)
          zeros(1, 5*frames*n) ones(1,frames*n)];
else
    [m,n] = size(signal_bpsk(1,:,1)');
    target = [ones(1, frames*n) zeros(1, 5*frames*n)
          zeros(1, frames*n) ones(1,frames*n) zeros(1, 4*frames*n)
          zeros(1, 2*frames*n) ones(1,frames*n) zeros(1,3*frames*n)
          zeros(1, 3*frames*n) ones(1,frames*n) zeros(1,2*frames*n)
          zeros(1, 4*frames*n) ones(1,frames*n) zeros(1,frames*n)
          zeros(1, 5*frames*n) ones(1,frames*n)];
end
genFunction(net, 'amcFcn', 'MatrixOnly', 'yes'); % Update network function
output = amcFcn(input);
performance = perform(net,target,output);
str = strcat('Network performance: ',num2str(performance));
disp(str)
[~,cm] = confusion(target,output);

if(strcmp(SNR,'ALL'))
    overall = 0;
    for i = 1:length(cm(:,1))
        for j = 1:length(cm(1,:))
            if( i == j )
                overall = overall + cm(i,j);
                result(i) = cm(i,j)/(7*frames);
            end
        end
    end
    result(7) = overall/(6*7*frames);
else
    overall = 0;
    for i = 1:length(cm(:,1))
        for j = 1:length(cm(1,:))
            if( i == j )
                overall = overall + cm(i,j);
                result(i) = cm(i,j)/frames;
            end
        end
    end
    result(7) = overall/(6*frames);
end
result(8) = performance;

% figure;plotconfusion(target,output);
% ax=gca;
% ticks = {'BPSK','QPSK','QAM16','FSK2','FSK4','WGN',''};
% set(ax,'XTickLabel',ticks);
% set(ax,'YTickLabel',ticks);
end