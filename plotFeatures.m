function plotFeatures(plotVector,fontSize,SNR,A,B,C,D,E,noise)
%% Color definition
QAM4Color = [0.9290, 0.6940, 0.1250];
QAM16Color = [0.8500, 0.3250, 0.0980];
PSK2Color = [0, 0.4470, 0.7410];
FSK2Color = [0.4940, 0.1840, 0.5560];
FSK4Color = [0.4660, 0.6740, 0.1880];
%%
L = round(length(A(1,1,:))/10);
%%
if(find(plotVector == 1))
    figure(1)
    for i = 1:L
        hold on
        plot(SNR,A(:,1,i),'Color',QAM4Color)
        plot(SNR,B(:,1,i),'Color',QAM16Color)
        plot(SNR,C(:,1,i),'Color',PSK2Color)
        plot(SNR,D(:,1,i),'Color',FSK2Color)
        plot(SNR,E(:,1,i),'Color',FSK4Color)
        plot(SNR,noise(:,1,i),'k')
        hold off
        title('Desvio padrao do valor absoluto da fase')
        x = xlabel('SNR');
        x.FontSize = fontSize;
        y = ylabel('Amplitude');
        y.FontSize = fontSize;
        lgd = legend('QAM4','QAM16','BPSK','FSK2','FSK4','Noise');
        lgd.FontSize = fontSize;
        set(gca,'FontSize',fontSize)
    end
end
%%
if(find(plotVector == 2))
    figure(2)
    for i = 1:L
        hold on
        plot(SNR,A(:,2,i),'Color',QAM4Color)
        plot(SNR,B(:,2,i),'Color',QAM16Color)
        plot(SNR,C(:,2,i),'Color',PSK2Color)
        plot(SNR,D(:,2,i),'Color',FSK2Color)
        plot(SNR,E(:,2,i),'Color',FSK4Color)
        plot(SNR,noise(:,2,i),'k')
        hold off
        title('Desvio padrao do valor direto da fase')
        x = xlabel('SNR');
        x.FontSize = fontSize;
        y = ylabel('Amplitude');
        y.FontSize = fontSize;
        lgd = legend('QAM4','QAM16','BPSK','FSK2','FSK4','Noise');
        lgd.FontSize = fontSize;
        set(gca,'FontSize',fontSize)
    end
end
%%
if(find(plotVector == 3))
    figure(3)
    for i = 1:L
        hold on
        plot(SNR,A(:,3,i),'Color',QAM4Color)
        plot(SNR,B(:,3,i),'Color',QAM16Color)
        plot(SNR,C(:,3,i),'Color',PSK2Color)
        plot(SNR,D(:,3,i),'Color',FSK2Color)
        plot(SNR,E(:,3,i),'Color',FSK4Color)
        plot(SNR,noise(:,3,i),'k')
        hold off
        title('Desvio padrao do valor absoluto da frequencia')
        x = xlabel('SNR');
        x.FontSize = fontSize;
        y = ylabel('Amplitude');
        y.FontSize = fontSize;
        lgd = legend('QAM4','QAM16','BPSK','FSK2','FSK4','Noise');
        lgd.FontSize = fontSize;
        set(gca,'FontSize',fontSize)
    end
end
%%
if(find(plotVector == 4))
    figure(4)
    for i = 1:L
        hold on
        plot(SNR,A(:,4,i),'Color',QAM4Color)
        plot(SNR,B(:,4,i),'Color',QAM16Color)
        plot(SNR,C(:,4,i),'Color',PSK2Color)
        plot(SNR,D(:,4,i),'Color',FSK2Color)
        plot(SNR,E(:,4,i),'Color',FSK4Color)
        plot(SNR,noise(:,4,i),'k')
        hold off
        title('Desvio padrao do valor direto da frequencia')
        x = xlabel('SNR');
        x.FontSize = fontSize;
        y = ylabel('Amplitude');
        y.FontSize = fontSize;
        lgd = legend('QAM4','QAM16','BPSK','FSK2','FSK4','Noise');
        lgd.FontSize = fontSize;
        set(gca,'FontSize',fontSize)
    end
end
%%
if(find(plotVector == 5))
    figure(5)
    for i = 1:L
        hold on
        plot(SNR,A(:,5,i),'Color',QAM4Color)
        plot(SNR,B(:,5,i),'Color',QAM16Color)
        plot(SNR,C(:,5,i),'Color',PSK2Color)
        plot(SNR,D(:,5,i),'Color',FSK2Color)
        plot(SNR,E(:,5,i),'Color',FSK4Color)
        plot(SNR,noise(:,5,i),'k')
        hold off
        title('Achatamento da distribuição normal (Curtose)')
        x = xlabel('SNR');
        x.FontSize = fontSize;
        y = ylabel('Amplitude');
        y.FontSize = fontSize;
        lgd = legend('QAM4','QAM16','BPSK','FSK2','FSK4','Noise');
        lgd.FontSize = fontSize;
        set(gca,'FontSize',fontSize)
    end
end
%%
if(find(plotVector == 6))
    figure(6)
    for i = 1:L
        hold on
        plot(SNR,A(:,6,i),'Color',QAM4Color)
        plot(SNR,B(:,6,i),'Color',QAM16Color)
        plot(SNR,C(:,6,i),'Color',PSK2Color)
        plot(SNR,D(:,6,i),'Color',FSK2Color)
        plot(SNR,E(:,6,i),'Color',FSK4Color)
        plot(SNR,noise(:,6,i),'k')
        hold off
        title('Valor maximo da DEP da amplitude NC')
        x = xlabel('SNR');
        x.FontSize = fontSize;
        y = ylabel('Amplitude');
        y.FontSize = fontSize;
        lgd = legend('QAM4','QAM16','BPSK','FSK2','FSK4','Noise');
        lgd.FontSize = fontSize;
        set(gca,'FontSize',fontSize)
    end
end
%%
if(find(plotVector == 7))
    figure(7)
    for i = 1:L
        hold on
        plot(SNR,A(:,7,i),'Color',QAM4Color)
        plot(SNR,B(:,7,i),'Color',QAM16Color)
        plot(SNR,C(:,7,i),'Color',PSK2Color)
        plot(SNR,D(:,7,i),'Color',FSK2Color)
        plot(SNR,E(:,7,i),'Color',FSK4Color)
        plot(SNR,noise(:,7,i),'k')
        hold off
        title('Media da amplitude NC ao quadrado')
        x = xlabel('SNR');
        x.FontSize = fontSize;
        y = ylabel('Amplitude');
        y.FontSize = fontSize;
        lgd = legend('QAM4','QAM16','BPSK','FSK2','FSK4','Noise');
        lgd.FontSize = fontSize;
        set(gca,'FontSize',fontSize)
    end
end
%%
if(find(plotVector == 8))
    figure(8)
    for i = 1:L
        hold on
        plot(SNR,A(:,8,i),'Color',QAM4Color)
        plot(SNR,B(:,8,i),'Color',QAM16Color)
        plot(SNR,C(:,8,i),'Color',PSK2Color)
        plot(SNR,D(:,8,i),'Color',FSK2Color)
        plot(SNR,E(:,8,i),'Color',FSK4Color)
        plot(SNR,noise(:,8,i),'k')
        hold off
        title('Desvio padrao do valor absoluto da amplitude NC')
        x = xlabel('SNR');
        x.FontSize = fontSize;
        y = ylabel('Amplitude');
        y.FontSize = fontSize;
        lgd = legend('QAM4','QAM16','BPSK','FSK2','FSK4','Noise');
        lgd.FontSize = fontSize;
        set(gca,'FontSize',fontSize)
    end
end    
%%
if(find(plotVector == 9))
    figure(9)
    for i = 1:L
        hold on
        plot(SNR,A(:,9,i),'Color',QAM4Color)
        plot(SNR,B(:,9,i),'Color',QAM16Color)
        plot(SNR,C(:,9,i),'Color',PSK2Color)
        plot(SNR,D(:,9,i),'Color',FSK2Color)
        plot(SNR,E(:,9,i),'Color',FSK4Color)
        plot(SNR,noise(:,9,i),'k')
        hold off
        title('Desvio padrao do valor direto da amplitude NC')
        x = xlabel('SNR');
        x.FontSize = fontSize;
        y = ylabel('Amplitude');
        y.FontSize = fontSize;
        lgd = legend('QAM4','QAM16','BPSK','FSK2','FSK4','Noise');
        lgd.FontSize = fontSize;
        set(gca,'FontSize',fontSize)
    end
end
%%
if(find(plotVector == 10))
    figure(9)
    for i = 1:L
        hold on
        plot(SNR,A(:,10,i),'Color',QAM4Color)
        plot(SNR,B(:,10,i),'Color',QAM16Color)
        plot(SNR,C(:,10,i),'Color',PSK2Color)
        plot(SNR,D(:,10,i),'Color',FSK2Color)
        plot(SNR,E(:,10,i),'Color',FSK4Color)
        plot(SNR,noise(:,10,i),'k')
        hold off
        title('Assimetria da distribuição normal (Skewness)')
        x = xlabel('SNR');
        x.FontSize = fontSize;
        y = ylabel('Amplitude');
        y.FontSize = fontSize;
        lgd = legend('QAM4','QAM16','BPSK','FSK2','FSK4','Noise');
        lgd.FontSize = fontSize;
        set(gca,'FontSize',fontSize)
    end
end
end