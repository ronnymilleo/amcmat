function plotMeanFeatures(plotVector,fontSize,SNR,signal_bpsk,signal_qpsk,signal_qam16)%,signal_fsk2,signal_fsk4,signal_noise)
%% Means calculation
meansBPSK = meanFeatures(signal_bpsk);
meansQPSK = meanFeatures(signal_qpsk);
meansQAM16 = meanFeatures(signal_qam16);
%meansFSK2 = meanFeatures(signal_fsk2);
%meansFSK4 = meanFeatures(signal_fsk4);
%meansWGN = meanFeatures(signal_noise);
%% Standard deviation calculation
%stdBPSK = sigmaFeatures(signal_bpsk);
%stdQPSK = sigmaFeatures(signal_qpsk);
%stdQAM16 = sigmaFeatures(signal_qam16);
%stdFSK2 = sigmaFeatures(signal_fsk2);
%stdFSK4 = sigmaFeatures(signal_fsk4);
%stdWGN = sigmaFeatures(signal_noise);
%% Minimum and maximum calculation
% minBPSK = minFeatures(signal_bpsk);
% minQPSK = minFeatures(signal_qpsk);
% minQAM16 = minFeatures(signal_qam16);
% maxPSK2 = maxFeatures(signal_bpsk);
% maxQAM4 = maxFeatures(signal_qpsk);
% maxQAM16 = maxFeatures(signal_qam16);
%% Color definition
BPSKColor = [0, 0.4470, 0.7410];
QPSKColor = [0.9290, 0.6940, 0.1250];
QAM16Color = [0.8500, 0.3250, 0.0980];
%FSK2Color = [0.4940, 0.1840, 0.5560];
%FSK4Color = [0.4660, 0.6740, 0.1880];
%%
for i = 1:length(plotVector)
    if(find(plotVector == i))
        figure(i)
        %errorbar(SNR,meansQAM4(:,i,1),minQAM4(:,i,1),maxQAM4(:,i,1),'o-','Color',BPSKColor,'LineWidth',1.25)
        plot(SNR,meansBPSK(:,i,1),'Color',BPSKColor,'LineWidth',1.25)
        hold on
        %errorbar(SNR,meansQAM16(:,i,1),minQAM16(:,i,1),maxQAM16(:,i,1),'x-','Color',QPSKColor,'LineWidth',1.25)
        plot(SNR,meansQPSK(:,i,1),'Color',QPSKColor,'LineWidth',1.25)
        %errorbar(SNR,meansPSK2(:,i,1),minPSK2(:,i,1),maxPSK2(:,i,1),'+-','Color',QAM16Color,'LineWidth',1.25)
        plot(SNR,meansQAM16(:,i,1),'Color',QAM16Color,'LineWidth',1.25)
        hold off
        index = num2str(i);
        title(strcat('Feature ',index))
        x = xlabel('SNR');
        x.FontSize = fontSize;
        y = ylabel('Amplitude');
        y.FontSize = fontSize;
        lgd = legend('BPSK','QPSK','QAM16');
        lgd.FontSize = fontSize;
        set(gca,'FontSize',fontSize)
    end
end