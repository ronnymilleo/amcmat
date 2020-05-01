function [noise_signal] = generateWGNDataset(snrVector,frames,frameSize)
noise_signal = zeros(length(snrVector),frames,frameSize*8);
for i = 1:length(snrVector)
    fprintf('Computing WGN dataset to compare with SNR = %d dB\n',snrVector(i))
    for j = 1:frames
        noise_signal(i,j,:) = gaussianNoise(frameSize*8, 1);
    end
end
end