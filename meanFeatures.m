function [result] = meanFeatures(SNR,featuresMatrix)
%% Mean of all features
result = zeros(length(SNR),9,1);

for i = 1:length(SNR)
     result(i,1,1) = mean(featuresMatrix(i,1,:));
     result(i,2,1) = mean(featuresMatrix(i,2,:));
     result(i,3,1) = mean(featuresMatrix(i,3,:));
     result(i,4,1) = mean(featuresMatrix(i,4,:));
     result(i,5,1) = mean(featuresMatrix(i,5,:));
     result(i,6,1) = mean(featuresMatrix(i,6,:));
     result(i,7,1) = mean(featuresMatrix(i,7,:));
     result(i,8,1) = mean(featuresMatrix(i,8,:));
     result(i,9,1) = mean(featuresMatrix(i,9,:));
     result(i,10,1) = mean(featuresMatrix(i,10,:));
end
end