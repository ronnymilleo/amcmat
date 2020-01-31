function [psk2_signal, psk4_signal, psk8_signal] = generatePSKDataset(snrVector,frames,frameSize,symbolRate,numSamplesPerSymbol,modParameters)
psk2_signal = zeros(length(snrVector),frames,frameSize-numSamplesPerSymbol);
psk4_signal = psk2_signal;
psk8_signal = psk2_signal;
for i = 1:length(snrVector)
    fprintf('Computing PSK (2, 4 and 8) dataset for SNR = %d dB\n',snrVector(i))
    for j = 1:frames
        psk2_signal(i,j,:) = PSK(4,frameSize,symbolRate,numSamplesPerSymbol,snrVector(i),modParameters);
        psk4_signal(i,j,:) = PSK(2,frameSize,symbolRate,numSamplesPerSymbol,snrVector(i),modParameters);
        psk8_signal(i,j,:) = PSK(8,frameSize,symbolRate,numSamplesPerSymbol,snrVector(i),modParameters);
    end
end
end