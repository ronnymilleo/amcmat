function [result] = features(SNR_vector,Nframes,frameSize,numSamplesPerSymbol,modulation,randomPhaseFlag,noiseFlag,plotFlag)
%% Features
% Matrix allocation
result = zeros(length(SNR_vector),9,length(Nframes));

Rs = 1/8; % Symbol Rate

for i = 1:length(SNR_vector)
    for j = 1:Nframes
        if(strcmp(modulation,'QAM4'))
            inputModulationSignal = QAM4(frameSize,numSamplesPerSymbol,SNR_vector(i),randomPhaseFlag,noiseFlag,plotFlag);
        elseif(strcmp(modulation,'QAM16'))
            inputModulationSignal = QAM16(frameSize,numSamplesPerSymbol,SNR_vector(i),randomPhaseFlag,noiseFlag,plotFlag);
        elseif(strcmp(modulation,'PSK2'))
            inputModulationSignal = PSK2(frameSize,numSamplesPerSymbol,SNR_vector(i),randomPhaseFlag,noiseFlag,plotFlag);
        elseif(strcmp(modulation,'FSK2'))
            inputModulationSignal = FSK2(frameSize,numSamplesPerSymbol,SNR_vector(i),randomPhaseFlag,noiseFlag);
        elseif(strcmp(modulation,'FSK4'))
            inputModulationSignal = FSK4(frameSize,numSamplesPerSymbol,SNR_vector(i),randomPhaseFlag,noiseFlag);
        else
            inputModulationSignal = gaussianNoise(frameSize,0); % Noise power = 0 dB
        end

        instValuesStruct = instantaneousValues(inputModulationSignal,Rs,8);
        
        %Desvio padrao do valor absoluto da componente nao-linear da fase instantanea
        result(i,1,j) = standardDeviation(abs(instValuesStruct.instPhase));

        %Desvio padrao da componente nao-linear da fase instantanea
        result(i,2,j) = standardDeviation(instValuesStruct.instPhase);

        %Desvio padrao do valor absoluto da componente nao-linear da frequência instantanea
        result(i,3,j) = standardDeviation(abs(instValuesStruct.instFreq));

        %Desvio padrao da componente nao-linear da frequência instantanea
        result(i,4,j) = standardDeviation(instValuesStruct.instFreq);

        %Curtose
        result(i,5,j) = Kurt(instValuesStruct.instAbs);

        %Valor maximo da densidade espectral de potencia da amplitude instantanea normalizada e centralizada
        result(i,6,j) = Gmax(instValuesStruct.instCNAbs);

        %Media da amplitude instantanea normalizada centralizada ao quadrado
        result(i,7,j) = meanSquared(instValuesStruct.instCNAbs);

        %Desvio padrao do valor absoluto da amplitude instantanea normalizada e centralizada
        result(i,8,j) = standardDeviation(abs(instValuesStruct.instCNAbs));

        %Desvio padrao da amplitude instantanea normalizada e centralizada
        result(i,9,j) = standardDeviation(instValuesStruct.instCNAbs);
        
        %SNR linear
        result(i,10,j) = 10^(SNR_vector(i)/10);
    end
end