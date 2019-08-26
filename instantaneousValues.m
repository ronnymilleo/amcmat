function [outputStruct] = instantaneousValues(inputVector, symbolRate, numSamplesPerSymbol)
instAngle = angle(inputVector);
instFreq = diff(instAngle)./(2*pi).*(symbolRate*numSamplesPerSymbol);
instAbs = abs(inputVector);
centNormAbs = instAbs/mean(instAbs) - 1;
outputStruct = struct('instAngle',instAngle,'instFreq',instFreq,'instAbsValue',instAbs,'centNormAbs',centNormAbs);
end