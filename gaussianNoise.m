function [noise] = gaussianNoise(frameSize,power)
noise = wgn(frameSize,1,power,1,'dBW','complex');
end