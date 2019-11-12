function [result] = features(modulation,snrVector,featuresVector,frames,frameSize,symbolRate,numSamplesPerSymbol,modParameters,rayleighSettings)
%% Features
% Matrix allocation
result = zeros(length(snrVector),length(featuresVector),length(frames));

for i = 1:length(snrVector)
    fprintf('Computing features for SNR = %d dB\n',snrVector(i))
    for j = 1:frames
        if(strcmp(modulation,'QPSK'))
            inputModulationSignal = PSK(4,frameSize,symbolRate,numSamplesPerSymbol,snrVector(i),modParameters,rayleighSettings);
        elseif(strcmp(modulation,'QAM16'))
            inputModulationSignal = QAM(16,frameSize,symbolRate,numSamplesPerSymbol,snrVector(i),modParameters,rayleighSettings);
        elseif(strcmp(modulation,'BPSK'))
            inputModulationSignal = PSK(2,frameSize,symbolRate,numSamplesPerSymbol,snrVector(i),modParameters,rayleighSettings);
        elseif(strcmp(modulation,'FSK2'))
            inputModulationSignal = FSK(2,frameSize,symbolRate,numSamplesPerSymbol,snrVector(i),modParameters,rayleighSettings);
        elseif(strcmp(modulation,'FSK4'))
            inputModulationSignal = FSK(4,frameSize,symbolRate,numSamplesPerSymbol,snrVector(i),modParameters,rayleighSettings);
        else
            inputModulationSignal = gaussianNoise(frameSize,0); % Noise power = 0 dB
        end

        instValuesStruct = instantaneousValues(inputModulationSignal);
        
        x = 1;
        
        if(find(featuresVector == 1))
            %Desvio padrao do valor absoluto da componente nao-linear da fase instantanea
            result(i,x,j) = standardDeviation(abs(instValuesStruct.instPhase));
            x = x + 1;
        end
        if(find(featuresVector == 2))
            %Desvio padrao da componente nao-linear da fase instantanea
            result(i,x,j) = standardDeviation(instValuesStruct.instPhase);
            x = x + 1;
        end
        if(find(featuresVector == 3))
            %Desvio padrao do valor absoluto da componente nao-linear da frequência instantanea
            result(i,x,j) = standardDeviation(abs(instValuesStruct.instFreq));
            x = x + 1;
        end
        if(find(featuresVector == 4))
            %Desvio padrao da componente nao-linear da frequência instantanea
            result(i,x,j) = standardDeviation(instValuesStruct.instFreq);
            x = x + 1;
        end
        if(find(featuresVector == 5))
            %Curtose
            result(i,x,j) = Kurt(instValuesStruct.instAbs);
            x = x + 1;
        end
        if(find(featuresVector == 6))
            %Valor maximo da densidade espectral de potencia da amplitude instantanea normalizada e centralizada
            result(i,x,j) = Gmax(instValuesStruct.instCNAbs);
            x = x + 1;
        end
        if(find(featuresVector == 7))
            %Media da amplitude instantanea normalizada centralizada ao quadrado
            result(i,x,j) = meanSquared(instValuesStruct.instCNAbs);
            x = x + 1;
        end
        if(find(featuresVector == 8))
            %Desvio padrao do valor absoluto da amplitude instantanea normalizada e centralizada
            result(i,x,j) = standardDeviation(abs(instValuesStruct.instCNAbs));
            x = x + 1;
        end
        if(find(featuresVector == 9))
            %Desvio padrao da amplitude instantanea normalizada e centralizada
            result(i,x,j) = standardDeviation(instValuesStruct.instCNAbs);
            x = x + 1;
        end
        if(find(featuresVector == 10))
            %SNR linear
            result(i,x,j) = 10^(snrVector(i)/10);
            % Skewness
            %result(i,x,j) = Skew(instValuesStruct.instAbs);
        end
    end
end