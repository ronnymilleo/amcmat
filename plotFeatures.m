function plotFeatures(plotVector,SNR,A,B,C)
%%
if(find(plotVector == 1))
    figure(1)
    for i = 1:length(A(1,:,1))
        hold on
        plot(SNR,A(:,i,1),'r',SNR,B(:,i,1),'g',SNR,C(:,i,1),'b')
        title('DP do valor abs. da fase instantanea')
        xlabel('SNR')
        ylabel('Ft. 1')
        legend('QAM4','QAM16','BPSK')
    end
end
%%
if(find(plotVector == 2))
    figure(2)
    for i = 1:length(A(1,:,1))
        hold on
        plot(SNR,A(:,i,2),'r',SNR,B(:,i,2),'g',SNR,C(:,i,2),'b')
        title('DP do valor direto da fase instantanea')
        xlabel('SNR')
        ylabel('Ft. 2')
        legend('QAM4','QAM16','BPSK')
    end
end
%%
if(find(plotVector == 3))
    figure(3)
    for i = 1:length(A(1,:,1))
        hold on
        plot(SNR,A(:,i,3),'r',SNR,B(:,i,3),'g',SNR,C(:,i,3),'b')
        title('DP do valor abs. da freq. instantanea')
        xlabel('SNR')
        ylabel('Ft. 3')
        legend('QAM4','QAM16','BPSK')
    end
end
%%
if(find(plotVector == 4))
    figure(4)
    for i = 1:length(A(1,:,1))
        hold on
        plot(SNR,A(:,i,4),'r',SNR,B(:,i,4),'g',SNR,C(:,i,4),'b')
        title('DP do valor direto da freq. instantanea')
        xlabel('SNR')
        ylabel('Ft. 4')
        legend('QAM4','QAM16','BPSK')
    end
end
%%
if(find(plotVector == 5))
    figure(5)
    for i = 1:length(A(1,:,1))
        hold on
        plot(SNR,A(:,i,5),'r',SNR,B(:,i,5),'g',SNR,C(:,i,5),'b')
        title('Curtose')
        xlabel('SNR')
        ylabel('Ft. 5')
        legend('QAM4','QAM16','BPSK')
    end
end
%%
if(find(plotVector == 6))
    figure(6)
    for i = 1:length(A(1,:,1))
        hold on
        plot(SNR,A(:,i,6),'r',SNR,B(:,i,6),'g',SNR,C(:,i,6),'b')
        title('Valor maximo da DEP da amplitude instantanea NC')
        xlabel('SNR')
        ylabel('Ft. 6')
        legend('QAM4','QAM16','BPSK')
    end
end
%%
if(find(plotVector == 7))
    figure(7)
    for i = 1:length(A(1,:,1))
        hold on
        plot(SNR,A(:,i,7),'r',SNR,B(:,i,7),'g',SNR,C(:,i,7),'b')
        title('Media da amplitude instantanea NC ao quadrado')
        xlabel('SNR')
        ylabel('Ft. 7')
        legend('QAM4','QAM16','BPSK')
    end
end
%%
if(find(plotVector == 8))
    figure(8)
    for i = 1:length(A(1,:,1))
        hold on
        plot(SNR,A(:,i,8),'r',SNR,B(:,i,8),'g',SNR,C(:,i,8),'b')
        title('DP do valor abs. da amplitude instantanea NC')
        xlabel('SNR')
        ylabel('Ft. 8')
        legend('QAM4','QAM16','BPSK')
    end
end    
%%
if(find(plotVector == 9))
    figure(9)
    for i = 1:length(A(1,:,1))
        hold on
        plot(SNR,A(:,i,9),'r',SNR,B(:,i,9),'g',SNR,C(:,i,9),'b')
        title('DP do valor direto da amplitude instantanea NC')
        xlabel('SNR')
        ylabel('Ft. 9')
        legend('QAM4','QAM16','BPSK')
    end
end
end