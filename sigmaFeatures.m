function [result] = sigmaFeatures(SNR,featuresMatrix)
%% Mean of all features
stdFt1 = zeros(1,length(SNR));
stdFt2 = zeros(1,length(SNR));
stdFt3 = zeros(1,length(SNR));
stdFt4 = zeros(1,length(SNR));
stdFt5 = zeros(1,length(SNR));
stdFt6 = zeros(1,length(SNR));
stdFt7 = zeros(1,length(SNR));
stdFt8 = zeros(1,length(SNR));
stdFt9 = zeros(1,length(SNR));
% Ft. 1
for i = 1:length(SNR)
     stdFt1(i) = std(featuresMatrix(i,:,1));
     stdFt2(i) = std(featuresMatrix(i,:,2));
     stdFt3(i) = std(featuresMatrix(i,:,3));
     stdFt4(i) = std(featuresMatrix(i,:,4));
     stdFt5(i) = std(featuresMatrix(i,:,5));
     stdFt6(i) = std(featuresMatrix(i,:,6));
     stdFt7(i) = std(featuresMatrix(i,:,7));
     stdFt8(i) = std(featuresMatrix(i,:,8));
     stdFt9(i) = std(featuresMatrix(i,:,9));
end
result = cat(3,stdFt1',stdFt2',stdFt3',stdFt4',stdFt5',stdFt6',stdFt7',stdFt8',stdFt9');
end