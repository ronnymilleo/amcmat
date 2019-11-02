function plotMeanFeatures(plotVector,fontSize,SNR,signal_bpsk,signal_qpsk,signal_qam16,signal_fsk2,signal_fsk4,signal_noise)
%% Means calculation
meansQAM4 = meanFeatures(SNR,signal_bpsk);
meansQAM16 = meanFeatures(SNR,signal_qpsk);
meansPSK2 = meanFeatures(SNR,signal_qam16);
meansFSK2 = meanFeatures(SNR,signal_fsk2);
meansFSK4 = meanFeatures(SNR,signal_fsk4);
meansWGN = meanFeatures(SNR,signal_noise);
%% Standard deviation calculation
stdQAM4 = sigmaFeatures(SNR,signal_bpsk);
stdQAM16 = sigmaFeatures(SNR,signal_qpsk);
stdPSK2 = sigmaFeatures(SNR,signal_qam16);
stdFSK2 = sigmaFeatures(SNR,signal_fsk2);
stdFSK4 = sigmaFeatures(SNR,signal_fsk4);
stdWGN = sigmaFeatures(SNR,signal_noise);
%% Color definition
BPSKColor = [0, 0.4470, 0.7410];
QPSKColor = [0.9290, 0.6940, 0.1250];
QAM16Color = [0.8500, 0.3250, 0.0980];
FSK2Color = [0.4940, 0.1840, 0.5560];
FSK4Color = [0.4660, 0.6740, 0.1880];
%% Ft. 1
if(find(plotVector == 1))
    figure(1)
    errorbar(SNR,meansQAM4(:,1,1),3*stdQAM4(:,1,1),'o-','Color',BPSKColor)
    hold on
    errorbar(SNR,meansQAM16(:,1,1),3*stdQAM16(:,1,1),'x-','Color',QPSKColor)
    errorbar(SNR,meansPSK2(:,1,1),3*stdPSK2(:,1,1),'+-','Color',QAM16Color)
    errorbar(SNR,meansFSK2(:,1,1),3*stdFSK2(:,1,1),'*-','Color',FSK2Color)
    errorbar(SNR,meansFSK4(:,1,1),3*stdFSK4(:,1,1),'^-','Color',FSK4Color)
    errorbar(SNR,meansWGN(:,1,1),3*stdWGN(:,1,1),'d-k')
    hold off
    title('Desvio padrao do valor absoluto da fase')
    x = xlabel('SNR');
    x.FontSize = fontSize;
    y = ylabel('Amplitude');
    y.FontSize = fontSize;
    lgd = legend('BPSK','QPSK','QAM16','FSK2','FSK4','Noise');
    lgd.FontSize = fontSize;
    set(gca,'FontSize',fontSize)
end
%% Ft. 2
if(find(plotVector == 2))
    figure(2)
    errorbar(SNR,meansQAM4(:,2,1),3*stdQAM4(:,2,1),'o-','Color',BPSKColor)
    hold on
    errorbar(SNR,meansQAM16(:,2,1),3*stdQAM16(:,2,1),'x-','Color',QPSKColor)
    errorbar(SNR,meansPSK2(:,2,1),3*stdPSK2(:,2,1),'+-','Color',QAM16Color)
    errorbar(SNR,meansFSK2(:,2,1),3*stdFSK2(:,2,1),'*-','Color',FSK2Color)
    errorbar(SNR,meansFSK4(:,2,1),3*stdFSK4(:,2,1),'^-','Color',FSK4Color)
    errorbar(SNR,meansWGN(:,2,1),3*stdWGN(:,2,1),'d-k')
    hold off
    title('Desvio padrao do valor direto da fase')
    x = xlabel('SNR');
    x.FontSize = fontSize;
    y = ylabel('Amplitude');
    y.FontSize = fontSize;
    lgd = legend('BPSK','QPSK','QAM16','FSK2','FSK4','Noise');
    lgd.FontSize = fontSize;
    set(gca,'FontSize',fontSize)
end
%% Ft. 3
if(find(plotVector == 3))
    figure(3)
    errorbar(SNR,meansQAM4(:,3,1),3*stdQAM4(:,3,1),'o-','Color',BPSKColor)
    hold on
    errorbar(SNR,meansQAM16(:,3,1),3*stdQAM16(:,3,1),'x-','Color',QPSKColor)
    errorbar(SNR,meansPSK2(:,3,1),3*stdPSK2(:,3,1),'+-','Color',QAM16Color)
    errorbar(SNR,meansFSK2(:,3,1),3*stdFSK2(:,3,1),'*-','Color',FSK2Color)
    errorbar(SNR,meansFSK4(:,3,1),3*stdFSK4(:,3,1),'^-','Color',FSK4Color)
    errorbar(SNR,meansWGN(:,3,1),3*stdWGN(:,3,1),'d-k')
    hold off
    title('Desvio padrao do valor absoluto da frequencia')
    x = xlabel('SNR');
    x.FontSize = fontSize;
    y = ylabel('Amplitude');
    y.FontSize = fontSize;
    lgd = legend('BPSK','QPSK','QAM16','FSK2','FSK4','Noise');
    lgd.FontSize = fontSize;
    set(gca,'FontSize',fontSize)
end
%% Ft. 4
if(find(plotVector == 4))
    figure(4)
    errorbar(SNR,meansQAM4(:,4,1),3*stdQAM4(:,4,1),'o-','Color',BPSKColor)
    hold on
    errorbar(SNR,meansQAM16(:,4,1),3*stdQAM16(:,4,1),'x-','Color',QPSKColor)
    errorbar(SNR,meansPSK2(:,4,1),3*stdPSK2(:,4,1),'+-','Color',QAM16Color)
    errorbar(SNR,meansFSK2(:,4,1),3*stdFSK2(:,4,1),'*-','Color',FSK2Color)
    errorbar(SNR,meansFSK4(:,4,1),3*stdFSK4(:,4,1),'^-','Color',FSK4Color)
    errorbar(SNR,meansWGN(:,4,1),3*stdWGN(:,4,1),'d-k')
    hold off
    title('Desvio padrao do valor direto da frequencia')
    x = xlabel('SNR');
    x.FontSize = fontSize;
    y = ylabel('Amplitude');
    y.FontSize = fontSize;
    lgd = legend('BPSK','QPSK','QAM16','FSK2','FSK4','Noise');
    lgd.FontSize = fontSize;
    set(gca,'FontSize',fontSize)
end
%% Ft. 5
if(find(plotVector == 5))
    figure(5)
    errorbar(SNR,meansQAM4(:,5,1),3*stdQAM4(:,5,1),'o-','Color',BPSKColor)
    hold on
    errorbar(SNR,meansQAM16(:,5,1),3*stdQAM16(:,5,1),'x-','Color',QPSKColor)
    errorbar(SNR,meansPSK2(:,5,1),3*stdPSK2(:,5,1),'+-','Color',QAM16Color)
    errorbar(SNR,meansFSK2(:,5,1),3*stdFSK2(:,5,1),'*-','Color',FSK2Color)
    errorbar(SNR,meansFSK4(:,5,1),3*stdFSK4(:,5,1),'^-','Color',FSK4Color)
    errorbar(SNR,meansWGN(:,5,1),3*stdWGN(:,5,1),'d-k')
    hold off
    title('Achatamento da distribuicao normal (Curtose)')
    x = xlabel('SNR');
    x.FontSize = fontSize;
    y = ylabel('Amplitude');
    y.FontSize = fontSize;
    lgd = legend('BPSK','QPSK','QAM16','FSK2','FSK4','Noise');
    lgd.FontSize = fontSize;
    set(gca,'FontSize',fontSize)
end
%% Ft. 6
if(find(plotVector == 6))
    figure(6)
    errorbar(SNR,meansQAM4(:,6,1),3*stdQAM4(:,6,1),'o-','Color',BPSKColor)
    hold on
    errorbar(SNR,meansQAM16(:,6,1),3*stdQAM16(:,6,1),'x-','Color',QPSKColor)
    errorbar(SNR,meansPSK2(:,6,1),3*stdPSK2(:,6,1),'+-','Color',QAM16Color)
    errorbar(SNR,meansFSK2(:,6,1),3*stdFSK2(:,6,1),'*-','Color',FSK2Color)
    errorbar(SNR,meansFSK4(:,6,1),3*stdFSK4(:,6,1),'^-','Color',FSK4Color)
    errorbar(SNR,meansWGN(:,6,1),3*stdWGN(:,6,1),'d-k')
    hold off
    title('Valor maximo da DEP da amplitude NC')
    x = xlabel('SNR');
    x.FontSize = fontSize;
    y = ylabel('Amplitude');
    y.FontSize = fontSize;
    lgd = legend('BPSK','QPSK','QAM16','FSK2','FSK4','Noise');
    lgd.FontSize = fontSize;
    set(gca,'FontSize',fontSize)
end
%% Ft. 7
if(find(plotVector == 7))
    figure(7)
    errorbar(SNR,meansQAM4(:,7,1),3*stdQAM4(:,7,1),'o-','Color',BPSKColor)
    hold on
    errorbar(SNR,meansQAM16(:,7,1),3*stdQAM16(:,7,1),'x-','Color',QPSKColor)
    errorbar(SNR,meansPSK2(:,7,1),3*stdPSK2(:,7,1),'+-','Color',QAM16Color)
    errorbar(SNR,meansFSK2(:,7,1),3*stdFSK2(:,7,1),'*-','Color',FSK2Color)
    errorbar(SNR,meansFSK4(:,7,1),3*stdFSK4(:,7,1),'^-','Color',FSK4Color)
    errorbar(SNR,meansWGN(:,7,1),3*stdWGN(:,7,1),'d-k')
    hold off
    title('Media da amplitude NC ao quadrado')
    x = xlabel('SNR');
    x.FontSize = fontSize;
    y = ylabel('Amplitude');
    y.FontSize = fontSize;
    lgd = legend('BPSK','QPSK','QAM16','FSK2','FSK4','Noise');
    lgd.FontSize = fontSize;
    set(gca,'FontSize',fontSize)
end
%% Ft. 8
if(find(plotVector == 8))
    figure(8)
    errorbar(SNR,meansQAM4(:,8,1),3*stdQAM4(:,8,1),'o-','Color',BPSKColor)
    hold on
    errorbar(SNR,meansQAM16(:,8,1),3*stdQAM16(:,8,1),'x-','Color',QPSKColor)
    errorbar(SNR,meansPSK2(:,8,1),3*stdPSK2(:,8,1),'+-','Color',QAM16Color)
    errorbar(SNR,meansFSK2(:,8,1),3*stdFSK2(:,8,1),'*-','Color',FSK2Color)
    errorbar(SNR,meansFSK4(:,8,1),3*stdFSK4(:,8,1),'^-','Color',FSK4Color)
    errorbar(SNR,meansWGN(:,8,1),3*stdWGN(:,8,1),'d-k')
    hold off
    title('Desvio padrao do valor absoluto da amplitude NC')
    x = xlabel('SNR');
    x.FontSize = fontSize;
    y = ylabel('Amplitude');
    y.FontSize = fontSize;
    lgd = legend('BPSK','QPSK','QAM16','FSK2','FSK4','Noise');
    lgd.FontSize = fontSize;
    set(gca,'FontSize',fontSize)
end
%% Ft. 9
if(find(plotVector == 9))
    figure(9)
    errorbar(SNR,meansQAM4(:,9,1),3*stdQAM4(:,9,1),'o-','Color',BPSKColor)
    hold on
    errorbar(SNR,meansQAM16(:,9,1),3*stdQAM16(:,9,1),'x-','Color',QPSKColor)
    errorbar(SNR,meansPSK2(:,9,1),3*stdPSK2(:,9,1),'+-','Color',QAM16Color)
    errorbar(SNR,meansFSK2(:,9,1),3*stdFSK2(:,9,1),'*-','Color',FSK2Color)
    errorbar(SNR,meansFSK4(:,9,1),3*stdFSK4(:,9,1),'^-','Color',FSK4Color)
    errorbar(SNR,meansWGN(:,9,1),3*stdWGN(:,9,1),'d-k')
    hold off
    title('Desvio padrao do valor direto da amplitude NC')
    x = xlabel('SNR');
    x.FontSize = fontSize;
    y = ylabel('Amplitude');
    y.FontSize = fontSize;
    lgd = legend('BPSK','QPSK','QAM16','FSK2','FSK4','Noise');
    lgd.FontSize = fontSize;
    set(gca,'FontSize',fontSize)
end
%% Ft. 0
if(find(plotVector == 10))
    figure(10)
    errorbar(SNR,meansQAM4(:,10,1),3*stdQAM4(:,10,1),'o-','Color',BPSKColor)
    hold on
    errorbar(SNR,meansQAM16(:,10,1),3*stdQAM16(:,10,1),'x-','Color',QPSKColor)
    errorbar(SNR,meansPSK2(:,10,1),3*stdPSK2(:,10,1),'+-','Color',QAM16Color)
    errorbar(SNR,meansFSK2(:,10,1),3*stdFSK2(:,10,1),'*-','Color',FSK2Color)
    errorbar(SNR,meansFSK4(:,10,1),3*stdFSK4(:,10,1),'^-','Color',FSK4Color)
    errorbar(SNR,meansWGN(:,10,1),3*stdWGN(:,10,1),'d-k')
    hold off
    title('Assimetria da distribuicao normal (Skewness)')
    x = xlabel('SNR');
    x.FontSize = fontSize;
    y = ylabel('Amplitude');
    y.FontSize = fontSize;
    lgd = legend('BPSK','QPSK','QAM16','FSK2','FSK4','Noise');
    lgd.FontSize = fontSize;
    set(gca,'FontSize',fontSize)
end
end