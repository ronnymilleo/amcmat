function [qam16_signal, qam64_signal] = generateQAMDataset(snrVector,frames,frameSize,symbolRate,numSamplesPerSymbol,s,modParameters)
qam16_signal = zeros(length(snrVector),frames,frameSize*8);
qam64_signal = qam16_signal;
for i = 1:length(snrVector)
    fprintf('Computing QAM (16, 64 and 256) dataset for SNR = %d dB\n',snrVector(i))
    for j = 1:frames
        qam16_signal(i,j,:) = QAM(16,frameSize+1,symbolRate,numSamplesPerSymbol,snrVector(i),s,modParameters);
        qam64_signal(i,j,:) = QAM(64,frameSize+1,symbolRate,numSamplesPerSymbol,snrVector(i),s,modParameters);
    end
end
end