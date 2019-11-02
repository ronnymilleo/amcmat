function [result] = features(snrVector,nFrames,frameSize,featuresVector,numSamplesPerSymbol,modulation,VIP,VIA,CN,isPlot)
%% Features
% Matrix allocation
result = zeros(length(snrVector),length(featuresVector),length(nFrames));

Rs = 1; % Symbol Rate

% Default settings
switch nargin
    case 6
        VIP = 1; % Variable initial phase
        VIA = 0; % Variable initial amplitude
        CN = 1; % Channel noise
        isPlot = 0; % Modulation plot
    case 7
        VIA = 0;
        CN = 1;
        isPlot = 0;
    case 8
        CN = 1;
        isPlot = 0;
    case 9
        isPlot = 0;
end

for i = 1:length(snrVector)
    for j = 1:nFrames
        if(strcmp(modulation,'QPSK'))
            inputModulationSignal = QPSK(frameSize,numSamplesPerSymbol,snrVector(i),VIP,VIA,CN,isPlot);
        elseif(strcmp(modulation,'QAM16'))
            inputModulationSignal = QAM16(frameSize,numSamplesPerSymbol,snrVector(i),VIP,VIA,CN,isPlot);
        elseif(strcmp(modulation,'BPSK'))
            inputModulationSignal = BPSK(frameSize,numSamplesPerSymbol,snrVector(i),VIP,VIA,CN,isPlot);
        elseif(strcmp(modulation,'FSK2'))
            inputModulationSignal = FSK2(frameSize,numSamplesPerSymbol,snrVector(i),VIA,CN);
        elseif(strcmp(modulation,'FSK4'))
            inputModulationSignal = FSK4(frameSize,numSamplesPerSymbol,snrVector(i),VIA,CN);
        else
            inputModulationSignal = gaussianNoise(frameSize,0); % Noise power = 0 dB
        end

        instValuesStruct = instantaneousValues(inputModulationSignal,Rs,8);
        
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
            %result(i,x,j) = 10^(snrVector(i)/10);
            % Skewness
            result(i,x,j) = Skew(instValuesStruct.instAbs);
        end
    end
end