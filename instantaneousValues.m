function [outputStruct] = instantaneousValues(inputVector, symbolRate, numSamplesPerSymbol)
instPhase = angle(inputVector);
instFreq = diff(instPhase)./(2*pi).*(symbolRate*numSamplesPerSymbol);
instAbs = abs(inputVector);
instCNAbs = instAbs/mean(instAbs) - 1;
outputStruct = struct('instPhase',instPhase,'instFreq',instFreq,'instAbs',instAbs,'instCNAbs',instCNAbs);
end