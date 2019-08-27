%% Mean plot
SNR = [-10 -5 0 5 10 15 20];
frames = 10;
frameSize = 4096;
randomInitPhaseFlag = 0;
plotFlag = 0;
A = features(SNR,frames,frameSize,'QAM4',randomInitPhaseFlag,plotFlag);
B = features(SNR,frames,frameSize,'QAM16',randomInitPhaseFlag,plotFlag);
C = features(SNR,frames,frameSize,'PSK2',randomInitPhaseFlag,plotFlag);
%% Ft. 1
figure(1)
plot(SNR,[mean(A(1,:,1)), mean(A(2,:,1)), mean(A(3,:,1)), mean(A(4,:,1)), mean(A(5,:,1)), mean(A(6,:,1)), mean(A(7,:,1))],'LineWidth',2)
hold on
plot(SNR,[mean(B(1,:,1)), mean(B(2,:,1)), mean(B(3,:,1)), mean(B(4,:,1)), mean(B(5,:,1)), mean(B(6,:,1)), mean(B(7,:,1))],'LineWidth',2)
plot(SNR,[mean(C(1,:,1)), mean(C(2,:,1)), mean(C(3,:,1)), mean(C(4,:,1)), mean(C(5,:,1)), mean(C(6,:,1)), mean(C(7,:,1))],'LineWidth',2)
hold off
title('DP do valor abs. da fase instantanea')
xlabel('SNR')
ylabel('Ft. 1')
legend('QAM4','QAM16','BPSK')
%% Ft. 2
figure(2)
plot(SNR,[mean(A(1,:,2)), mean(A(2,:,2)), mean(A(3,:,2)), mean(A(4,:,2)), mean(A(5,:,2)), mean(A(6,:,2)), mean(A(7,:,2))],'LineWidth',2)
hold on
plot(SNR,[mean(B(1,:,2)), mean(B(2,:,2)), mean(B(3,:,2)), mean(B(4,:,2)), mean(B(5,:,2)), mean(B(6,:,2)), mean(B(7,:,2))],'LineWidth',2)
plot(SNR,[mean(C(1,:,2)), mean(C(2,:,2)), mean(C(3,:,2)), mean(C(4,:,2)), mean(C(5,:,2)), mean(C(6,:,2)), mean(C(7,:,2))],'LineWidth',2)
hold off
title('DP do valor direto da fase instantanea')
xlabel('SNR')
ylabel('Ft. 2')
legend('QAM4','QAM16','BPSK')
%% Ft. 3
figure(3)
plot(SNR,[mean(A(1,:,3)), mean(A(2,:,3)), mean(A(3,:,3)), mean(A(4,:,3)), mean(A(5,:,3)), mean(A(6,:,3)), mean(A(7,:,3))],'LineWidth',2)
hold on
plot(SNR,[mean(B(1,:,3)), mean(B(2,:,3)), mean(B(3,:,3)), mean(B(4,:,3)), mean(B(5,:,3)), mean(B(6,:,3)), mean(B(7,:,3))],'LineWidth',2)
plot(SNR,[mean(C(1,:,3)), mean(C(2,:,3)), mean(C(3,:,3)), mean(C(4,:,3)), mean(C(5,:,3)), mean(C(6,:,3)), mean(C(7,:,3))],'LineWidth',2)
hold off
title('DP do valor abs. da freq. instantanea')
xlabel('SNR')
ylabel('Ft. 3')
legend('QAM4','QAM16','BPSK')
%% Ft. 4
figure(4)
plot(SNR,[mean(A(1,:,4)), mean(A(2,:,4)), mean(A(3,:,4)), mean(A(4,:,4)), mean(A(5,:,4)), mean(A(6,:,4)), mean(A(7,:,4))],'LineWidth',2)
hold on
plot(SNR,[mean(B(1,:,4)), mean(B(2,:,4)), mean(B(3,:,4)), mean(B(4,:,4)), mean(B(5,:,4)), mean(B(6,:,4)), mean(B(7,:,4))],'LineWidth',2)
plot(SNR,[mean(C(1,:,4)), mean(C(2,:,4)), mean(C(3,:,4)), mean(C(4,:,4)), mean(C(5,:,4)), mean(C(6,:,4)), mean(C(7,:,4))],'LineWidth',2)
hold off
title('DP do valor direto da freq. instantanea')
xlabel('SNR')
ylabel('Ft. 4')
legend('QAM4','QAM16','BPSK')
%% Ft. 5
figure(5)
plot(SNR,[mean(A(1,:,5)), mean(A(2,:,5)), mean(A(3,:,5)), mean(A(4,:,5)), mean(A(5,:,5)), mean(A(6,:,5)), mean(A(7,:,5))],'LineWidth',2)
hold on
plot(SNR,[mean(B(1,:,5)), mean(B(2,:,5)), mean(B(3,:,5)), mean(B(4,:,5)), mean(B(5,:,5)), mean(B(6,:,5)), mean(B(7,:,5))],'LineWidth',2)
plot(SNR,[mean(C(1,:,5)), mean(C(2,:,5)), mean(C(3,:,5)), mean(C(4,:,5)), mean(C(5,:,5)), mean(C(6,:,5)), mean(C(7,:,5))],'LineWidth',2)
hold off
title('Curtose')
xlabel('SNR')
ylabel('Ft. 5')
legend('QAM4','QAM16','BPSK')
%% Ft. 6
figure(6)
plot(SNR,[mean(A(1,:,6)), mean(A(2,:,6)), mean(A(3,:,6)), mean(A(4,:,6)), mean(A(5,:,6)), mean(A(6,:,6)), mean(A(7,:,6))],'LineWidth',2)
hold on
plot(SNR,[mean(B(1,:,6)), mean(B(2,:,6)), mean(B(3,:,6)), mean(B(4,:,6)), mean(B(5,:,6)), mean(B(6,:,6)), mean(B(7,:,6))],'LineWidth',2)
plot(SNR,[mean(C(1,:,6)), mean(C(2,:,6)), mean(C(3,:,6)), mean(C(4,:,6)), mean(C(5,:,6)), mean(C(6,:,6)), mean(C(7,:,6))],'LineWidth',2)
hold off
title('Valor maximo da DEP da amplitude instantanea NC')
xlabel('SNR')
ylabel('Ft. 6')
legend('QAM4','QAM16','BPSK')
%% Ft. 7
figure(7)
plot(SNR,[mean(A(1,:,7)), mean(A(2,:,7)), mean(A(3,:,7)), mean(A(4,:,7)), mean(A(5,:,7)), mean(A(6,:,7)), mean(A(7,:,7))],'LineWidth',2)
hold on
plot(SNR,[mean(B(1,:,7)), mean(B(2,:,7)), mean(B(3,:,7)), mean(B(4,:,7)), mean(B(5,:,7)), mean(B(6,:,7)), mean(B(7,:,7))],'LineWidth',2)
plot(SNR,[mean(C(1,:,7)), mean(C(2,:,7)), mean(C(3,:,7)), mean(C(4,:,7)), mean(C(5,:,7)), mean(C(6,:,7)), mean(C(7,:,7))],'LineWidth',2)
hold off
title('Media da amplitude instantanea NC ao quadrado')
xlabel('SNR')
ylabel('Ft. 7')
legend('QAM4','QAM16','BPSK')
%% Ft. 8
figure(8)
plot(SNR,[mean(A(1,:,8)), mean(A(2,:,8)), mean(A(3,:,8)), mean(A(4,:,8)), mean(A(5,:,8)), mean(A(6,:,8)), mean(A(7,:,8))],'LineWidth',2)
hold on
plot(SNR,[mean(B(1,:,8)), mean(B(2,:,8)), mean(B(3,:,8)), mean(B(4,:,8)), mean(B(5,:,8)), mean(B(6,:,8)), mean(B(7,:,8))],'LineWidth',2)
plot(SNR,[mean(C(1,:,8)), mean(C(2,:,8)), mean(C(3,:,8)), mean(C(4,:,8)), mean(C(5,:,8)), mean(C(6,:,8)), mean(C(7,:,8))],'LineWidth',2)
hold off
title('DP do valor abs. da amplitude instantanea NC')
xlabel('SNR')
ylabel('Ft. 8')
legend('QAM4','QAM16','BPSK')
%% Ft. 9
figure(9)
plot(SNR,[mean(A(1,:,9)), mean(A(2,:,9)), mean(A(3,:,9)), mean(A(4,:,9)), mean(A(5,:,9)), mean(A(6,:,9)), mean(A(7,:,9))],'LineWidth',2)
hold on
plot(SNR,[mean(B(1,:,9)), mean(B(2,:,9)), mean(B(3,:,9)), mean(B(4,:,9)), mean(B(5,:,9)), mean(B(6,:,9)), mean(B(7,:,9))],'LineWidth',2)
plot(SNR,[mean(C(1,:,9)), mean(C(2,:,9)), mean(C(3,:,9)), mean(C(4,:,9)), mean(C(5,:,9)), mean(C(6,:,9)), mean(C(7,:,9))],'LineWidth',2)
hold off
title('DP do valor direto da amplitude instantanea NC')
xlabel('SNR')
ylabel('Ft. 9')
legend('QAM4','QAM16','BPSK')