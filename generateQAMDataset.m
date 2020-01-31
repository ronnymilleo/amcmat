function [qam16_signal, qam64_signal, qam256_signal] = generateQAMDataset(snrVector,frames,frameSize,symbolRate,numSamplesPerSymbol,modParameters)
qam16_signal = zeros(length(snrVector),frames,frameSize);
qam64_signal = qam16_signal;
qam256_signal = qam16_signal;
for i = 1:length(snrVector)
    fprintf('Computing QAM (16, 64 and 256) dataset for SNR = %d dB\n',snrVector(i))
    for j = 1:frames
        qam16_signal(i,j,:) = QAM(16,frameSize+1,symbolRate,numSamplesPerSymbol,snrVector(i),modParameters);
        qam64_signal(i,j,:) = QAM(64,frameSize+1,symbolRate,numSamplesPerSymbol,snrVector(i),modParameters);
        qam256_signal(i,j,:) = QAM(256,frameSize+1,symbolRate,numSamplesPerSymbol,snrVector(i),modParameters);
    end
end
end