function [outputStruct] = instantaneousValues(inputVector)
instPhase = angle(inputVector);
instFreq = 1/(2*pi)*diff(unwrap(instPhase));
instAbs = abs(inputVector);
instCNAbs = instAbs/mean(instAbs) - 1;
outputStruct = struct('instPhase',instPhase,'instFreq',instFreq,'instAbs',instAbs,'instCNAbs',instCNAbs);
end