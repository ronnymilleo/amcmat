function [output] = applyChannel(modulatedSignal, SNR, rayleighSettings)
    noisySignal = awgn(modulatedSignal,SNR,'measured');
    
    if(rayleighSettings.activate)
        rayChan = comm.RayleighChannel( ...
        'SampleRate',          rayleighSettings.Fs, ...
        'PathDelays',          rayleighSettings.pathDelays, ...
        'AveragePathGains',    rayleighSettings.avgPathGains, ...
        'maxDopplerShift',     maxDopplerShift);
        output = rayChan(noisySignal);
    else
        output = noisySignal;
    end
end