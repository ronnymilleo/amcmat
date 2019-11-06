function [outputStruct] = instantaneousValues(inputVector, Fs)
h = hilbert(inputVector,length(inputVector));
instPhase = angle(h);
instFreq = (Fs)/(2*pi)*diff(unwrap(angle(h)));
instFreq = (instFreq - mean(instFreq))/Fs;
instAbs = abs(inputVector);
instCNAbs = instAbs/mean(instAbs) - 1;
outputStruct = struct('instPhase',instPhase,'instFreq',instFreq,'instAbs',instAbs,'instCNAbs',instCNAbs);
end