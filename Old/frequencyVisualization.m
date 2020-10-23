qam4 = QAM4(4096,8,15,0);
qam16 = QAM16(4096,8,15,0);
psk2 = PSK2(4096,8,15,0);
fsk2 = FSK2(4096,8,15,0);
fsk4 = FSK4(4096,8,15,0);
%% QAM4
N = length(qam4);
xdft = fft(qam4);
psdqam4 = (1/(2*pi*N)) * abs(xdft).^2;
freq = 0:(2*pi)/N:2*pi-(2*pi)/N;
figure(1)
plot(freq/pi,10*log10(psdqam4))
grid on
title('Periodogram Using FFT')
xlabel('Normalized Frequency (\times\pi rad/sample)') 
ylabel('Power/Frequency (dB/rad/sample)')
%% QAM16
N = length(qam16);
xdft = fft(qam16);
psdqam16 = (1/(2*pi*N)) * abs(xdft).^2;
freq = 0:(2*pi)/N:2*pi-(2*pi)/N;
figure(2)
plot(freq/pi,10*log10(psdqam16))
grid on
title('Periodogram Using FFT')
xlabel('Normalized Frequency (\times\pi rad/sample)') 
ylabel('Power/Frequency (dB/rad/sample)')
%% PSK2
N = length(psk2);
xdft = fft(psk2);
psdpsk2 = (1/(2*pi*N)) * abs(xdft).^2;
freq = 0:(2*pi)/N:2*pi-(2*pi)/N;
figure(3)
plot(freq/pi,10*log10(psdpsk2))
grid on
title('Periodogram Using FFT')
xlabel('Normalized Frequency (\times\pi rad/sample)') 
ylabel('Power/Frequency (dB/rad/sample)')
%% FSK2
N = length(fsk2);
xdft = fft(fsk2);
psdfsk2 = (1/(2*pi*N)) * abs(xdft).^2;
freq = 0:(2*pi)/N:2*pi-(2*pi)/N;
figure(4)
plot(freq/pi,10*log10(psdfsk2))
grid on
title('Periodogram Using FFT')
xlabel('Normalized Frequency (\times\pi rad/sample)') 
ylabel('Power/Frequency (dB/rad/sample)')
%% FSK4
N = length(fsk4);
xdft = fft(fsk4);
psdfsk4 = (1/(2*pi*N)) * abs(xdft).^2;
freq = 0:(2*pi)/N:2*pi-(2*pi)/N;
figure(5)
plot(freq/pi,10*log10(psdfsk4))
grid on
title('Periodogram Using FFT')
xlabel('Normalized Frequency (\times\pi rad/sample)') 
ylabel('Power/Frequency (dB/rad/sample)')
%%
figure(6)
plot(freq/pi,10*log10(psdpsk2),freq/pi,10*log10(psdqam4),freq/pi,10*log10(psdqam16))
grid on
title('Periodogram Using FFT')
xlabel('Normalized Frequency (\times\pi rad/sample)') 
ylabel('Power/Frequency (dB/rad/sample)')
legend('BPSK','QAM4','QAM16')