function [result] = features(SNR_vector,Nframes,frameSize,modulation,randomInitPhaseFlag,noiseFlag,plotFlag)
%% Features
% Serve pra qualquer modulação, fazer loop pra testar em modulações
% diferentes
% Alocação de matriz
feature1 = zeros(length(SNR_vector),length(Nframes));
feature2 = zeros(length(SNR_vector),length(Nframes));
feature3 = zeros(length(SNR_vector),length(Nframes));
feature4 = zeros(length(SNR_vector),length(Nframes));
feature5 = zeros(length(SNR_vector),length(Nframes));
feature6 = zeros(length(SNR_vector),length(Nframes));
feature7 = zeros(length(SNR_vector),length(Nframes));
feature8 = zeros(length(SNR_vector),length(Nframes));
feature9 = zeros(length(SNR_vector),length(Nframes));

Rs = 10e3; % Taxa de símbolos
modulationSNR = SNR_vector; % Fazer loop pra testar SNR diferente

for i = 1:length(modulationSNR)
    for j = 1:Nframes
        if(strcmp(modulation,'QAM4'))
            inputModulationSignal = QAM4(frameSize,modulationSNR(i),randomInitPhaseFlag,noiseFlag,plotFlag);
        elseif(strcmp(modulation,'QAM16'))
            inputModulationSignal = QAM16(frameSize,modulationSNR(i),randomInitPhaseFlag,noiseFlag,plotFlag);
        elseif(strcmp(modulation,'PSK2'))
            inputModulationSignal = PSK2(frameSize,modulationSNR(i),randomInitPhaseFlag,noiseFlag,plotFlag);
        elseif(strcmp(modulation,'FSK2'))
            inputModulationSignal = FSK2(frameSize,modulationSNR(i),randomInitPhaseFlag,noiseFlag);
        elseif(strcmp(modulation,'FSK4'))
            inputModulationSignal = FSK4(frameSize,modulationSNR(i),randomInitPhaseFlag,noiseFlag);
        end

        instValuesStruct = instantaneousValues(inputModulationSignal,Rs,8);
        
        %Desvio padrao do valor absoluto da componente nao-linear da fase instantanea
        feature1(i,j) = standardDeviation(abs(instValuesStruct.instAngle));

        %Desvio padrao da componente nao-linear da fase instantanea
        feature2(i,j) = standardDeviation(instValuesStruct.instAngle);

        %Desvio padrao do valor absoluto da componente nao-linear da frequência instantanea
        feature3(i,j) = standardDeviation(abs(instValuesStruct.instFreq));

        %Desvio padrao da componente nao-linear da frequência instantanea
        feature4(i,j) = standardDeviation(instValuesStruct.instFreq);

        %Curtose
        feature5(i,j) = Kurt(instValuesStruct.instAbsValue);

        %Valor maximo da densidade espectral de potencia da amplitude instantanea normalizada e centralizada
        feature6(i,j) = Gmax(instValuesStruct.centNormAbs);

        %Media da amplitude instantanea normalizada centralizada ao quadrado
        feature7(i,j) = meanSquared(instValuesStruct.centNormAbs);

        %Desvio padrao do valor absoluto da amplitude instantanea normalizada e centralizada
        feature8(i,j) = standardDeviation(abs(instValuesStruct.centNormAbs));

        %Desvio padrao da amplitude instantanea normalizada e centralizada
        feature9(i,j) = standardDeviation(instValuesStruct.centNormAbs);
    end
end
result = cat(3,feature1,feature2,feature3,feature4,feature5,feature6,feature7,feature8,feature9);