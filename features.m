%% Features
% Serve pra qualquer modulação, fazer loop pra testar em modulações
% diferentes
Rs = 10e3; % Taxa de símbolos
modulationSNR = 20; % Fazer loop pra testar SNR diferente
modulationFrame = 1; % Fazer loop pra testar vários frames
inputModulationSignal = [-1 2 -3 4 -5 2 1 3 -2 0]; % Teste
instValuesStruct = instantaneousValues(inputModulationSignal,Rs,1);
feature1(1,modulationFrame) = standardDeviation(abs(instValuesStruct.instAngle));
feature2(1,modulationFrame) = standardDeviation(instValuesStruct.instAngle);
feature3(1,modulationFrame) = standardDeviation(abs(instValuesStruct.instFreq));
feature4(1,modulationFrame) = standardDeviation(instValuesStruct.instFreq);
feature5(1,modulationFrame) = kurtosis(instValuesStruct.instAbsValue); % MATLAB function
feature6(1,modulationFrame) = Gmax(instValuesStruct.centNormAverage);
feature7(1,modulationFrame) = meanSquared(instValuesStruct.centNormAverage);
feature8(1,modulationFrame) = standardDeviation(abs(instValuesStruct.centNormAverage));
feature9(1,modulationFrame) = standardDeviation(instValuesStruct.centNormAverage);