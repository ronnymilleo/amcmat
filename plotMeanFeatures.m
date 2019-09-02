function plotMeanFeatures(plotVector,SNR,meansA,meansB,meansC,meansD,meansE,meansNoise)
%% Ft. 1
if(find(plotVector == 1))
    figure(1)
    plot(SNR,meansA(:,1,1),'LineWidth',2)
    hold on
    plot(SNR,meansB(:,1,1),'LineWidth',2)
    plot(SNR,meansC(:,1,1),'LineWidth',2)
    plot(SNR,meansD(:,1,1),'LineWidth',2)
    plot(SNR,meansE(:,1,1),'LineWidth',2)
    plot(SNR,meansNoise(:,1,1),'LineWidth',2)
    hold off
    title('DP do valor abs. da fase instantanea')
    xlabel('SNR')
    ylabel('Ft. 1')
    legend('QAM4','QAM16','BPSK','FSK2','FSK4','Noise')
end
%% Ft. 2
if(find(plotVector == 2))
    figure(2)
    plot(SNR,meansA(:,1,2),'LineWidth',2)
    hold on
    plot(SNR,meansB(:,1,2),'LineWidth',2)
    plot(SNR,meansC(:,1,2),'LineWidth',2)
    plot(SNR,meansD(:,1,2),'LineWidth',2)
    plot(SNR,meansE(:,1,2),'LineWidth',2)
    plot(SNR,meansNoise(:,1,2),'LineWidth',2)
    hold off
    title('DP do valor direto da fase instantanea')
    xlabel('SNR')
    ylabel('Ft. 2')
    legend('QAM4','QAM16','BPSK','FSK2','FSK4','Noise')
end
%% Ft. 3
if(find(plotVector == 3))
    figure(3)
    plot(SNR,meansA(:,1,3),'LineWidth',2)
    hold on
    plot(SNR,meansB(:,1,3),'LineWidth',2)
    plot(SNR,meansC(:,1,3),'LineWidth',2)
    plot(SNR,meansD(:,1,3),'LineWidth',2)
    plot(SNR,meansE(:,1,3),'LineWidth',2)
    plot(SNR,meansNoise(:,1,4),'LineWidth',2)
    hold off
    title('DP do valor abs. da freq. instantanea')
    xlabel('SNR')
    ylabel('Ft. 3')
    legend('QAM4','QAM16','BPSK','FSK2','FSK4','Noise')
end
%% Ft. 4
if(find(plotVector == 4))
    figure(4)
    plot(SNR,meansA(:,1,4),'LineWidth',2)
    hold on
    plot(SNR,meansB(:,1,4),'LineWidth',2)
    plot(SNR,meansC(:,1,4),'LineWidth',2)
    plot(SNR,meansD(:,1,4),'LineWidth',2)
    plot(SNR,meansE(:,1,4),'LineWidth',2)
    plot(SNR,meansNoise(:,1,5),'LineWidth',2)
    hold off
    title('DP do valor direto da freq. instantanea')
    xlabel('SNR')
    ylabel('Ft. 4')
    legend('QAM4','QAM16','BPSK','FSK2','FSK4','Noise')
end
%% Ft. 5
if(find(plotVector == 5))
    figure(5)
    plot(SNR,meansA(:,1,5),'LineWidth',2)
    hold on
    plot(SNR,meansB(:,1,5),'LineWidth',2)
    plot(SNR,meansC(:,1,5),'LineWidth',2)
    plot(SNR,meansD(:,1,5),'LineWidth',2)
    plot(SNR,meansE(:,1,5),'LineWidth',2)
    plot(SNR,meansNoise(:,1,5),'LineWidth',2)
    hold off
    title('Curtose')
    xlabel('SNR')
    ylabel('Ft. 5')
    legend('QAM4','QAM16','BPSK','FSK2','FSK4','Noise')
end
%% Ft. 6
if(find(plotVector == 6))
    figure(6)
    plot(SNR,meansA(:,1,6),'LineWidth',2)
    hold on
    plot(SNR,meansB(:,1,6),'LineWidth',2)
    plot(SNR,meansC(:,1,6),'LineWidth',2)
    plot(SNR,meansD(:,1,6),'LineWidth',2)
    plot(SNR,meansE(:,1,6),'LineWidth',2)
    plot(SNR,meansNoise(:,1,6),'LineWidth',2)
    hold off
    title('Valor maximo da DEP da amplitude instantanea NC')
    xlabel('SNR')
    ylabel('Ft. 6')
    legend('QAM4','QAM16','BPSK','FSK2','FSK4','Noise')
end
%% Ft. 7
if(find(plotVector == 7))
    figure(7)
    plot(SNR,meansA(:,1,7),'LineWidth',2)
    hold on
    plot(SNR,meansB(:,1,7),'LineWidth',2)
    plot(SNR,meansC(:,1,7),'LineWidth',2)
    plot(SNR,meansD(:,1,7),'LineWidth',2)
    plot(SNR,meansE(:,1,7),'LineWidth',2)
    plot(SNR,meansNoise(:,1,6),'LineWidth',2)
    hold off
    title('Media da amplitude instantanea NC ao quadrado')
    xlabel('SNR')
    ylabel('Ft. 7')
    legend('QAM4','QAM16','BPSK','FSK2','FSK4','Noise')
end
%% Ft. 8
if(find(plotVector == 8))
    figure(8)
    plot(SNR,meansA(:,1,8),'LineWidth',2)
    hold on
    plot(SNR,meansB(:,1,8),'LineWidth',2)
    plot(SNR,meansC(:,1,8),'LineWidth',2)
    plot(SNR,meansD(:,1,8),'LineWidth',2)
    plot(SNR,meansE(:,1,8),'LineWidth',2)
    plot(SNR,meansNoise(:,1,8),'LineWidth',2)
    hold off
    title('DP do valor abs. da amplitude instantanea NC')
    xlabel('SNR')
    ylabel('Ft. 8')
    legend('QAM4','QAM16','BPSK','FSK2','FSK4','Noise')
end
%% Ft. 9
if(find(plotVector == 9))
    figure(9)
    plot(SNR,meansA(:,1,9),'LineWidth',2)
    hold on
    plot(SNR,meansB(:,1,9),'LineWidth',2)
    plot(SNR,meansC(:,1,9),'LineWidth',2)
    plot(SNR,meansD(:,1,9),'LineWidth',2)
    plot(SNR,meansE(:,1,9),'LineWidth',2)
    plot(SNR,meansNoise(:,1,9),'LineWidth',2)
    hold off
    title('DP do valor direto da amplitude instantanea NC')
    xlabel('SNR')
    ylabel('Ft. 9')
    legend('QAM4','QAM16','BPSK','FSK2','FSK4','Noise')
end
end