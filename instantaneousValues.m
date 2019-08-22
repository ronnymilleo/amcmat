function [outputStruct] = instantaneousValues(inputVector, symbolRate, numSamplesPerSymbol)
instAngle = angle(inputVector);
instFreq = diff(instAngle)./(2*pi).*(symbolRate*numSamplesPerSymbol);
instAbs = abs(inputVector);
centNormAverage = instAbs/mean(instAbs);
outputStruct = struct('instAngle',instAngle,'instFreq',instFreq,'instAbsValue',instAbs,'centNormAverage',centNormAverage);
end