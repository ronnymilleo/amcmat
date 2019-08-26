%% Plot
SNR = [-10 -5 0 5 10 15 20];
frames = 100;
A = features(SNR,frames,'QAM4');
B = features(SNR,frames,'QAM16');
figure(1)
for i = 1:length(A(1,:,1))
    hold on
    plot(SNR,A(:,i,1),SNR,B(:,i,1))
    xlabel('SNR')
    ylabel('Ft. 1')
end

figure(2)
for i = 1:length(A(1,:,1))
    hold on
    plot(SNR,A(:,i,2),SNR,B(:,i,2))
    xlabel('SNR')
    ylabel('Ft. 2')
end

figure(3)
for i = 1:length(A(1,:,1))
    hold on
    plot(SNR,A(:,i,3),SNR,B(:,i,3))
    xlabel('SNR')
    ylabel('Ft. 3')
end

figure(4)
for i = 1:length(A(1,:,1))
    hold on
    plot(SNR,A(:,i,4),SNR,B(:,i,4))
    xlabel('SNR')
    ylabel('Ft. 4')
end

figure(5)
for i = 1:length(A(1,:,1))
    hold on
    plot(SNR,A(:,i,5),SNR,B(:,i,5))
    xlabel('SNR')
    ylabel('Ft. 5')
end

figure(6)
for i = 1:length(A(1,:,1))
    hold on
    plot(SNR,A(:,i,6),SNR,B(:,i,6))
    xlabel('SNR')
    ylabel('Ft. 6')
end

figure(7)
for i = 1:length(A(1,:,1))
    hold on
    plot(SNR,A(:,i,7),SNR,B(:,i,7))
    xlabel('SNR')
    ylabel('Ft. 7')
end

figure(8)
for i = 1:length(A(1,:,1))
    hold on
    plot(SNR,A(:,i,8),SNR,B(:,i,8))
    xlabel('SNR')
    ylabel('Ft. 8')
end

figure(9)
for i = 1:length(A(1,:,1))
    hold on
    plot(SNR,A(:,i,9),SNR,B(:,i,9))
    xlabel('SNR')
    ylabel('Ft. 9')
end