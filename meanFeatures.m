function [result] = meanFeatures(SNR,featuresMatrix)
%% Mean of all features
% meanFt1 = zeros(1,length(SNR));
% meanFt2 = zeros(1,length(SNR));
% meanFt3 = zeros(1,length(SNR));
% meanFt4 = zeros(1,length(SNR));
% meanFt5 = zeros(1,length(SNR));
% meanFt6 = zeros(1,length(SNR));
% meanFt7 = zeros(1,length(SNR));
% meanFt8 = zeros(1,length(SNR));
% meanFt9 = zeros(1,length(SNR));

result = zeros(length(SNR),9,1);

for i = 1:length(SNR)
     %meanFt1(i) = mean(featuresMatrix(i,1,:));
     result(i,1,1) = mean(featuresMatrix(i,1,:));
     %meanFt2(i) = mean(featuresMatrix(i,2,:));
     result(i,2,1) = mean(featuresMatrix(i,2,:));
     %meanFt3(i) = mean(featuresMatrix(i,3,:));
     result(i,3,1) = mean(featuresMatrix(i,3,:));
     %meanFt4(i) = mean(featuresMatrix(i,4,:));
     result(i,4,1) = mean(featuresMatrix(i,4,:));
     %meanFt5(i) = mean(featuresMatrix(i,5,:));
     result(i,5,1) = mean(featuresMatrix(i,5,:));
     %meanFt6(i) = mean(featuresMatrix(i,6,:));
     result(i,6,1) = mean(featuresMatrix(i,6,:));
     %meanFt7(i) = mean(featuresMatrix(i,7,:));
     result(i,7,1) = mean(featuresMatrix(i,7,:));
     %meanFt8(i) = mean(featuresMatrix(i,8,:));
     result(i,8,1) = mean(featuresMatrix(i,8,:));
     %meanFt9(i) = mean(featuresMatrix(i,9,:));
     result(i,9,1) = mean(featuresMatrix(i,9,:));
end
%result = cat(3,meanFt1',meanFt2',meanFt3',meanFt4',meanFt5',meanFt6',meanFt7',meanFt8',meanFt9');
end