function plotMeanFeatures(plotVector,SNR,signal_qam4,signal_qam16,signal_psk2,signal_fsk2,signal_fsk4,signal_noise)
%% Means calculation
meansQAM4 = meanFeatures(SNR,signal_qam4);
meansQAM16 = meanFeatures(SNR,signal_qam16);
meansPSK2 = meanFeatures(SNR,signal_psk2);
meansFSK2 = meanFeatures(SNR,signal_fsk2);
meansFSK4 = meanFeatures(SNR,signal_fsk4);
meansWGN = meanFeatures(SNR,signal_noise);
%% Standard deviation calculation
stdQAM4 = sigmaFeatures(SNR,signal_qam4);
stdQAM16 = sigmaFeatures(SNR,signal_qam16);
stdPSK2 = sigmaFeatures(SNR,signal_psk2);
stdFSK2 = sigmaFeatures(SNR,signal_fsk2);
stdFSK4 = sigmaFeatures(SNR,signal_fsk4);
stdWGN = sigmaFeatures(SNR,signal_noise);
%% Color definition
QAM4Color = [0.9290, 0.6940, 0.1250];
QAM16Color = [0.8500, 0.3250, 0.0980];
PSK2Color = [0, 0.4470, 0.7410];
FSK2Color = [0.4940, 0.1840, 0.5560];
FSK4Color = [0.4660, 0.6740, 0.1880];
%% Ft. 1
if(find(plotVector == 1))
    figure(1)
    errorbar(SNR,meansQAM4(:,1,1),3*stdQAM4(:,1,1),'o-','Color',QAM4Color)
    hold on
    errorbar(SNR,meansQAM16(:,1,1),3*stdQAM16(:,1,1),'x-','Color',QAM16Color)
    errorbar(SNR,meansPSK2(:,1,1),3*stdPSK2(:,1,1),'+-','Color',PSK2Color)
    errorbar(SNR,meansFSK2(:,1,1),3*stdFSK2(:,1,1),'*-','Color',FSK2Color)
    errorbar(SNR,meansFSK4(:,1,1),3*stdFSK4(:,1,1),'^-','Color',FSK4Color)
    errorbar(SNR,meansWGN(:,1,1),3*stdWGN(:,1,1),'d-k')
    hold off
    title('Desvio padrão do valor absoluto da fase')
    xlabel('SNR')
    ylabel('Ft. 1')
    legend('QAM4','QAM16','BPSK','FSK2','FSK4','Noise')
end
%% Ft. 2
if(find(plotVector == 2))
    figure(2)
    errorbar(SNR,meansQAM4(:,1,2),3*stdQAM4(:,1,2),'o-','Color',QAM4Color)
    hold on
    errorbar(SNR,meansQAM16(:,1,2),3*stdQAM16(:,1,2),'x-','Color',QAM16Color)
    errorbar(SNR,meansPSK2(:,1,2),3*stdPSK2(:,1,2),'+-','Color',PSK2Color)
    errorbar(SNR,meansFSK2(:,1,2),3*stdFSK2(:,1,2),'*-','Color',FSK2Color)
    errorbar(SNR,meansFSK4(:,1,2),3*stdFSK4(:,1,2),'^-','Color',FSK4Color)
    errorbar(SNR,meansWGN(:,1,2),3*stdWGN(:,1,2),'d-k')
    hold off
    title('Desvio padrão do valor direto da fase')
    xlabel('SNR')
    ylabel('Ft. 2')
    legend('QAM4','QAM16','BPSK','FSK2','FSK4','Noise')
end
%% Ft. 3
if(find(plotVector == 3))
    figure(3)
    errorbar(SNR,meansQAM4(:,1,3),3*stdQAM4(:,1,3),'o-','Color',QAM4Color)
    hold on
    errorbar(SNR,meansQAM16(:,1,3),3*stdQAM16(:,1,3),'x-','Color',QAM16Color)
    errorbar(SNR,meansPSK2(:,1,3),3*stdPSK2(:,1,3),'+-','Color',PSK2Color)
    errorbar(SNR,meansFSK2(:,1,3),3*stdFSK2(:,1,3),'*-','Color',FSK2Color)
    errorbar(SNR,meansFSK4(:,1,3),3*stdFSK4(:,1,3),'^-','Color',FSK4Color)
    errorbar(SNR,meansWGN(:,1,3),3*stdWGN(:,1,3),'d-k')
    hold off
    title('Desvio padrão do valor absoluto da frequência')
    xlabel('SNR')
    ylabel('Ft. 3')
    legend('QAM4','QAM16','BPSK','FSK2','FSK4','Noise')
end
%% Ft. 4
if(find(plotVector == 4))
    figure(4)
    errorbar(SNR,meansQAM4(:,1,4),3*stdQAM4(:,1,4),'o-','Color',QAM4Color)
    hold on
    errorbar(SNR,meansQAM16(:,1,4),3*stdQAM16(:,1,4),'x-','Color',QAM16Color)
    errorbar(SNR,meansPSK2(:,1,4),3*stdPSK2(:,1,4),'+-','Color',PSK2Color)
    errorbar(SNR,meansFSK2(:,1,4),3*stdFSK2(:,1,4),'*-','Color',FSK2Color)
    errorbar(SNR,meansFSK4(:,1,4),3*stdFSK4(:,1,4),'^-','Color',FSK4Color)
    errorbar(SNR,meansWGN(:,1,4),3*stdWGN(:,1,4),'d-k')
    hold off
    title('Desvio padrão do valor direto da frequência')
    xlabel('SNR')
    ylabel('Ft. 4')
    legend('QAM4','QAM16','BPSK','FSK2','FSK4','Noise')
end
%% Ft. 5
if(find(plotVector == 5))
    figure(5)
    errorbar(SNR,meansQAM4(:,1,5),3*stdQAM4(:,1,5),'o-','Color',QAM4Color)
    hold on
    errorbar(SNR,meansQAM16(:,1,5),3*stdQAM16(:,1,5),'x-','Color',QAM16Color)
    errorbar(SNR,meansPSK2(:,1,5),3*stdPSK2(:,1,5),'+-','Color',PSK2Color)
    errorbar(SNR,meansFSK2(:,1,5),3*stdFSK2(:,1,5),'*-','Color',FSK2Color)
    errorbar(SNR,meansFSK4(:,1,5),3*stdFSK4(:,1,5),'^-','Color',FSK4Color)
    errorbar(SNR,meansWGN(:,1,5),3*stdWGN(:,1,5),'d-k')
    hold off
    title('Curtose')
    xlabel('SNR')
    ylabel('Ft. 5')
    legend('QAM4','QAM16','BPSK','FSK2','FSK4','Noise')
end
%% Ft. 6
if(find(plotVector == 6))
    figure(6)
    errorbar(SNR,meansQAM4(:,1,6),3*stdQAM4(:,1,6),'o-','Color',QAM4Color)
    hold on
    errorbar(SNR,meansQAM16(:,1,6),3*stdQAM16(:,1,6),'x-','Color',QAM16Color)
    errorbar(SNR,meansPSK2(:,1,6),3*stdPSK2(:,1,6),'+-','Color',PSK2Color)
    errorbar(SNR,meansFSK2(:,1,6),3*stdFSK2(:,1,6),'*-','Color',FSK2Color)
    errorbar(SNR,meansFSK4(:,1,6),3*stdFSK4(:,1,6),'^-','Color',FSK4Color)
    errorbar(SNR,meansWGN(:,1,6),3*stdWGN(:,1,6),'d-k')
    hold off
    title('Valor máximo da DEP da amplitude NC')
    xlabel('SNR')
    ylabel('Ft. 6')
    legend('QAM4','QAM16','BPSK','FSK2','FSK4','Noise')
end
%% Ft. 7
if(find(plotVector == 7))
    figure(7)
    errorbar(SNR,meansQAM4(:,1,7),3*stdQAM4(:,1,7),'o-','Color',QAM4Color)
    hold on
    errorbar(SNR,meansQAM16(:,1,7),3*stdQAM16(:,1,7),'x-','Color',QAM16Color)
    errorbar(SNR,meansPSK2(:,1,7),3*stdPSK2(:,1,7),'+-','Color',PSK2Color)
    errorbar(SNR,meansFSK2(:,1,7),3*stdFSK2(:,1,7),'*-','Color',FSK2Color)
    errorbar(SNR,meansFSK4(:,1,7),3*stdFSK4(:,1,7),'^-','Color',FSK4Color)
    errorbar(SNR,meansWGN(:,1,7),3*stdWGN(:,1,7),'d-k')
    hold off
    title('Média da amplitude NC ao quadrado')
    xlabel('SNR')
    ylabel('Ft. 7')
    legend('QAM4','QAM16','BPSK','FSK2','FSK4','Noise')
end
%% Ft. 8
if(find(plotVector == 8))
    figure(8)
    errorbar(SNR,meansQAM4(:,1,8),3*stdQAM4(:,1,8),'o-','Color',QAM4Color)
    hold on
    errorbar(SNR,meansQAM16(:,1,8),3*stdQAM16(:,1,8),'x-','Color',QAM16Color)
    errorbar(SNR,meansPSK2(:,1,8),3*stdPSK2(:,1,8),'+-','Color',PSK2Color)
    errorbar(SNR,meansFSK2(:,1,8),3*stdFSK2(:,1,8),'*-','Color',FSK2Color)
    errorbar(SNR,meansFSK4(:,1,8),3*stdFSK4(:,1,8),'^-','Color',FSK4Color)
    errorbar(SNR,meansWGN(:,1,8),3*stdWGN(:,1,8),'d-k')
    hold off
    title('Desvio padrão do valor absoluto da amplitude NC')
    xlabel('SNR')
    ylabel('Ft. 8')
    legend('QAM4','QAM16','BPSK','FSK2','FSK4','Noise')
end
%% Ft. 9
if(find(plotVector == 9))
    figure(9)
    errorbar(SNR,meansQAM4(:,1,9),3*stdQAM4(:,1,9),'o-','Color',QAM4Color)
    hold on
    errorbar(SNR,meansQAM16(:,1,9),3*stdQAM16(:,1,9),'x-','Color',QAM16Color)
    errorbar(SNR,meansPSK2(:,1,9),3*stdPSK2(:,1,9),'+-','Color',PSK2Color)
    errorbar(SNR,meansFSK2(:,1,9),3*stdFSK2(:,1,9),'*-','Color',FSK2Color)
    errorbar(SNR,meansFSK4(:,1,9),3*stdFSK4(:,1,9),'^-','Color',FSK4Color)
    errorbar(SNR,meansWGN(:,1,9),3*stdWGN(:,1,9),'d-k')
    hold off
    title('Desvio padrão do valor direto da amplitude NC')
    xlabel('SNR')
    ylabel('Ft. 9')
    legend('QAM4','QAM16','BPSK','FSK2','FSK4','Noise')
end
end