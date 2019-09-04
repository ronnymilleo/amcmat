function plotFeatures(plotVector,SNR,A,B,C,D,E,noise)
%% Color definition
QAM4Color = [0.9290, 0.6940, 0.1250];
QAM16Color = [0.8500, 0.3250, 0.0980];
PSK2Color = [0, 0.4470, 0.7410];
FSK2Color = [0.4940, 0.1840, 0.5560];
FSK4Color = [0.4660, 0.6740, 0.1880];
%%
if(find(plotVector == 1))
    figure(1)
    for i = 1:length(A(1,:,1))
        hold on
        plot(SNR,A(:,i,1),'Color',QAM4Color)
        plot(SNR,B(:,i,1),'Color',QAM16Color)
        plot(SNR,C(:,i,1),'Color',PSK2Color)
        plot(SNR,D(:,i,1),'Color',FSK2Color)
        plot(SNR,E(:,i,1),'Color',FSK4Color)
        plot(SNR,noise(:,i,1),'k')
        hold off
        title('Desvio padrão do valor absoluto da fase')
        xlabel('SNR')
        ylabel('Ft. 1')
        legend('QAM4','QAM16','BPSK','FSK2','FSK4','Noise')
    end
end
%%
if(find(plotVector == 2))
    figure(2)
    for i = 1:length(A(1,:,1))
        hold on
        plot(SNR,A(:,i,2),'Color',QAM4Color)
        plot(SNR,B(:,i,2),'Color',QAM16Color)
        plot(SNR,C(:,i,2),'Color',PSK2Color)
        plot(SNR,D(:,i,2),'Color',FSK2Color)
        plot(SNR,E(:,i,2),'Color',FSK4Color)
        plot(SNR,noise(:,i,2),'k')
        hold off
        title('Desvio padrão do valor direto da fase')
        xlabel('SNR')
        ylabel('Ft. 2')
        legend('QAM4','QAM16','BPSK','FSK2','FSK4','Noise')
    end
end
%%
if(find(plotVector == 3))
    figure(3)
    for i = 1:length(A(1,:,1))
        hold on
        plot(SNR,A(:,i,3),'Color',QAM4Color)
        plot(SNR,B(:,i,3),'Color',QAM16Color)
        plot(SNR,C(:,i,3),'Color',PSK2Color)
        plot(SNR,D(:,i,3),'Color',FSK2Color)
        plot(SNR,E(:,i,3),'Color',FSK4Color)
        plot(SNR,noise(:,i,3),'k')
        hold off
        title('Desvio padrão do valor absoluto da frequência')
        xlabel('SNR')
        ylabel('Ft. 3')
        legend('QAM4','QAM16','BPSK','FSK2','FSK4','Noise')
    end
end
%%
if(find(plotVector == 4))
    figure(4)
    for i = 1:length(A(1,:,1))
        hold on
        plot(SNR,A(:,i,4),'Color',QAM4Color)
        plot(SNR,B(:,i,4),'Color',QAM16Color)
        plot(SNR,C(:,i,4),'Color',PSK2Color)
        plot(SNR,D(:,i,4),'Color',FSK2Color)
        plot(SNR,E(:,i,4),'Color',FSK4Color)
        plot(SNR,noise(:,i,4),'k')
        hold off
        title('Desvio padrão do valor direto da frequência')
        xlabel('SNR')
        ylabel('Ft. 4')
        legend('QAM4','QAM16','BPSK','FSK2','FSK4','Noise')
    end
end
%%
if(find(plotVector == 5))
    figure(5)
    for i = 1:length(A(1,:,1))
        hold on
        plot(SNR,A(:,i,5),'Color',QAM4Color)
        plot(SNR,B(:,i,5),'Color',QAM16Color)
        plot(SNR,C(:,i,5),'Color',PSK2Color)
        plot(SNR,D(:,i,5),'Color',FSK2Color)
        plot(SNR,E(:,i,5),'Color',FSK4Color)
        plot(SNR,noise(:,i,5),'k')
        hold off
        title('Curtose')
        xlabel('SNR')
        ylabel('Ft. 5')
        legend('QAM4','QAM16','BPSK','FSK2','FSK4','Noise')
    end
end
%%
if(find(plotVector == 6))
    figure(6)
    for i = 1:length(A(1,:,1))
        hold on
        plot(SNR,A(:,i,6),'Color',QAM4Color)
        plot(SNR,B(:,i,6),'Color',QAM16Color)
        plot(SNR,C(:,i,6),'Color',PSK2Color)
        plot(SNR,D(:,i,6),'Color',FSK2Color)
        plot(SNR,E(:,i,6),'Color',FSK4Color)
        plot(SNR,noise(:,i,6),'k')
        hold off
        title('Valor máximo da DEP da amplitude NC')
        xlabel('SNR')
        ylabel('Ft. 6')
        legend('QAM4','QAM16','BPSK','FSK2','FSK4','Noise')
    end
end
%%
if(find(plotVector == 7))
    figure(7)
    for i = 1:length(A(1,:,1))
        hold on
        plot(SNR,A(:,i,7),'Color',QAM4Color)
        plot(SNR,B(:,i,7),'Color',QAM16Color)
        plot(SNR,C(:,i,7),'Color',PSK2Color)
        plot(SNR,D(:,i,7),'Color',FSK2Color)
        plot(SNR,E(:,i,7),'Color',FSK4Color)
        plot(SNR,noise(:,i,7),'k')
        hold off
        title('Média da amplitude NC ao quadrado')
        xlabel('SNR')
        ylabel('Ft. 7')
        legend('QAM4','QAM16','BPSK','FSK2','FSK4','Noise')
    end
end
%%
if(find(plotVector == 8))
    figure(8)
    for i = 1:length(A(1,:,1))
        hold on
        plot(SNR,A(:,i,8),'Color',QAM4Color)
        plot(SNR,B(:,i,8),'Color',QAM16Color)
        plot(SNR,C(:,i,8),'Color',PSK2Color)
        plot(SNR,D(:,i,8),'Color',FSK2Color)
        plot(SNR,E(:,i,8),'Color',FSK4Color)
        plot(SNR,noise(:,i,8),'k')
        hold off
        title('Desvio padrão do valor absoluto da amplitude NC')
        xlabel('SNR')
        ylabel('Ft. 8')
        legend('QAM4','QAM16','BPSK','FSK2','FSK4','Noise')
    end
end    
%%
if(find(plotVector == 9))
    figure(9)
    for i = 1:length(A(1,:,1))
        hold on
        plot(SNR,A(:,i,9),'Color',QAM4Color)
        plot(SNR,B(:,i,9),'Color',QAM16Color)
        plot(SNR,C(:,i,9),'Color',PSK2Color)
        plot(SNR,D(:,i,9),'Color',FSK2Color)
        plot(SNR,E(:,i,9),'Color',FSK4Color)
        plot(SNR,noise(:,i,9),'k')
        hold off
        title('Desvio padrão do valor direto da amplitude NC')
        xlabel('SNR')
        ylabel('Ft. 9')
        legend('QAM4','QAM16','BPSK','FSK2','FSK4','Noise')
    end
end
end