function plotFeatures(plotVector,nLines,fontSize,SNR,bpsk,qpsk,qam16)%,D,E,noise)
%% Color definition
BPSKColor = [0, 0.4470, 0.7410];
QPSKColor = [0.9290, 0.6940, 0.1250];
QAM16Color = [0.8500, 0.3250, 0.0980];
%FSK2Color = [0.4940, 0.1840, 0.5560];
%FSK4Color = [0.4660, 0.6740, 0.1880];
%%
for a = 1:length(plotVector)
    if(find(plotVector == a))
        figure(a)
        for i = 1:nLines
            hold on
            plot(SNR,bpsk(:,a,i),'Color',BPSKColor)
            plot(SNR,qpsk(:,a,i),'Color',QPSKColor)
            plot(SNR,qam16(:,a,i),'Color',QAM16Color)
            %plot(SNR,D(:,a,i),'Color',FSK2Color)
            %plot(SNR,E(:,a,i),'Color',FSK4Color)
            %plot(SNR,noise(:,a,i),'k')
            hold off
            index = num2str(a);
            title(strcat('Feature ', index))
            x = xlabel('SNR');
            x.FontSize = fontSize;
            y = ylabel('Amplitude');
            y.FontSize = fontSize;
            lgd = legend('BPSK','QPSK','QAM16');%,'FSK2','FSK4','Noise');
            lgd.FontSize = fontSize;
            set(gca,'FontSize',fontSize)
        end
    end
end
end