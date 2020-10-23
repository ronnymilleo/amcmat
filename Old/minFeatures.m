function [result] = minFeatures(featuresMatrix)
%% Mean of all features
result = zeros(length(featuresMatrix(:,1,1)),length(featuresMatrix(1,:,1)),1);

for i = 1:length(featuresMatrix(:,1,1))
    for j = 1:length(featuresMatrix(1,:,1))
        result(i,j,1) = min(featuresMatrix(i,j,:));
    end
end
end