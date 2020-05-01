function [psk2_signal, psk4_signal, psk8_signal] = generatePSKDataset(snrVector,frames,frameSize,symbolRate,numSamplesPerSymbol,s,modParameters)
psk2_signal = zeros(length(snrVector),frames,frameSize*8);
psk4_signal = psk2_signal;
psk8_signal = psk2_signal;
for i = 1:length(snrVector)
    fprintf('Computing PSK (2, 4 and 8) dataset for SNR = %d dB\n',snrVector(i))
    for j = 1:frames
        psk2_signal(i,j,:) = PSK(2,frameSize+1,symbolRate,numSamplesPerSymbol,snrVector(i),s,modParameters);
        psk4_signal(i,j,:) = PSK(4,frameSize+1,symbolRate,numSamplesPerSymbol,snrVector(i),s,modParameters);
        psk8_signal(i,j,:) = PSK(8,frameSize+1,symbolRate,numSamplesPerSymbol,snrVector(i),s,modParameters);
    end
end
end