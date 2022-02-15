%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Universidade Federal do Parana
% Programa de Pos-Graduacao em Engenharia Eletrica
% Ronny Milléo
% Adenilson Castro
% Updated 15/02/2022
% This plot script will show only the higher SNR signals
% It is recommended to simulate just one frame to keep the graphics clean
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% BPSK
figure(1)
plot(real(signal_bpsk(16,1:250)), 'Color', '#0066FF', 'LineWidth', 1)
axis([0 250 -3 3])
hold on
plot(imag(signal_bpsk(16,1:250)), 'Color', '#FF3300', 'LineWidth', 1)
hold off
ax = gca;
ax.FontSize = 12;
legend('In-Phase', 'Quadrature', 'FontSize', 12)
xlabel('Samples')
ylabel('Amplitude')
f = gcf;
exportgraphics(f,'bpsk_time.png','Resolution',300)

scatter(real(signal_bpsk(16,1:8:end)), imag(signal_bpsk(16,1:8:end)), 10, [0 0.4 1], 'filled');
hold on;
d = (0:1)';
s = pskmod(d,2);
scatter(real(s), imag(s), 50, [1 0.2 0], '*');
axis([-2 2 -2 2])
hold off;
xlabel('In-Phase')
ylabel('Quadrature')
legend('Filtered symbols', 'Ideal symbol', 'FontSize', 12)

ax = gca;
ax.FontSize = 12;
f = gcf;
exportgraphics(f,'bpsk_scatter.png','Resolution',300)
%% QPSK
figure(1)
plot(real(signal_qpsk(16,1:250)), 'Color', '#0066FF', 'LineWidth', 1)
axis([0 250 -3 3])
hold on
plot(imag(signal_qpsk(16,1:250)), 'Color', '#FF3300', 'LineWidth', 1)
hold off
ax = gca;
ax.FontSize = 12;
legend('In-Phase', 'Quadrature', 'FontSize', 12)
xlabel('Samples')
ylabel('Amplitude')
f = gcf;
exportgraphics(f,'qpsk_time.png','Resolution',300)

scatter(real(signal_qpsk(16,1:8:end)), imag(signal_qpsk(16,1:8:end)), 10, [0 0.4 1], 'filled');
hold on;
d = (0:3)';
s = pskmod(d,4);
scatter(real(s), imag(s), 50, [1 0.2 0], '*');
axis([-2 2 -2 2])
hold off;
xlabel('In-Phase')
ylabel('Quadrature')
legend('Filtered symbols', 'Ideal symbol', 'FontSize', 12)

ax = gca;
ax.FontSize = 12;
f = gcf;
exportgraphics(f,'qpsk_scatter.png','Resolution',300)
%% 8PSK
figure(1)
Fs = 10000;
plot(real(signal_8psk(16,1:250)), 'Color', '#0066FF', 'LineWidth', 1)
axis([0 250 -3 3])
hold on
plot(imag(signal_8psk(16,1:250)), 'Color', '#FF3300', 'LineWidth', 1)
hold off
ax = gca;
ax.FontSize = 12;
legend('In-Phase', 'Quadrature', 'FontSize', 12)
xlabel('Samples')
ylabel('Amplitude')
f = gcf;
exportgraphics(f,'psk8_time.png','Resolution',300)

scatter(real(signal_8psk(16,1:8:end)), imag(signal_8psk(16,1:8:end)), 10, [0 0.4 1], 'filled');
hold on;
d = (0:7)';
s = pskmod(d,8);
scatter(real(s), imag(s), 50, [1 0.2 0], '*');
axis([-2 2 -2 2])
hold off;
xlabel('In-Phase')
ylabel('Quadrature')
legend('Filtered symbols', 'Ideal symbol', 'FontSize', 12)

ax = gca;
ax.FontSize = 12;
f = gcf;
exportgraphics(f,'psk8_scatter.png','Resolution',300)
%% 16QAM
figure(1)
plot(real(signal_qam16(16,1:250)), 'Color', '#0066FF', 'LineWidth', 1)
axis([0 250 -3 3])
hold on
plot(imag(signal_qam16(16,1:250)), 'Color', '#FF3300', 'LineWidth', 1)
hold off
ax = gca;
ax.FontSize = 12;
legend('In-Phase', 'Quadrature', 'FontSize', 12)
xlabel('Samples')
ylabel('Amplitude')
f = gcf;
exportgraphics(f,'qam16_time.png','Resolution',300)

scatter(real(signal_qam16(16,1:8:end)), imag(signal_qam16(16,1:8:end)), 10, [0 0.4 1], 'filled');
hold on;
d = (0:15)';
s = qammod(d,16,'UnitAveragePower',true);
scatter(real(s), imag(s), 50, [1 0.2 0], '*');
axis([-2 2 -2 2])
hold off;
xlabel('In-Phase')
ylabel('Quadrature')
legend('Filtered symbols', 'Ideal symbol', 'FontSize', 12)

title('')
ax = gca;
ax.FontSize = 12;
f = gcf;
exportgraphics(f,'qam16_scatter.png','Resolution',300)
%% 64QAM
figure(1)
plot(real(signal_qam64(16,1:250)), 'Color', '#0066FF', 'LineWidth', 1)
axis([0 250 -3 3])
hold on
plot(imag(signal_qam64(16,1:250)), 'Color', '#FF3300', 'LineWidth', 1)
hold off
ax = gca;
ax.FontSize = 12;
legend('In-Phase', 'Quadrature', 'FontSize', 12)
xlabel('Samples')
ylabel('Amplitude')
f = gcf;
exportgraphics(f,'qam64_time.png','Resolution',300)

scatter(real(signal_qam64(16,1:8:end)), imag(signal_qam64(16,1:8:end)), 10, [0 0.4 1], 'filled');
hold on;
d = (0:63)';
s = qammod(d,64,'UnitAveragePower',true);
scatter(real(s), imag(s), 50, [1 0.2 0], '*');
axis([-2 2 -2 2])
hold off;
xlabel('In-Phase')
ylabel('Quadrature')
legend('Filtered symbols', 'Ideal symbol', 'FontSize', 12)

title('')
ax = gca;
ax.FontSize = 12;
f = gcf;
exportgraphics(f,'qam64_scatter.png','Resolution',300)
%% Noise
figure(1)
plot(real(signal_noise(16,1:250)), 'Color', '#0066FF', 'LineWidth', 1)
axis([0 250 -3 3])
hold on
plot(imag(signal_noise(16,1:250)), 'Color', '#FF3300', 'LineWidth', 1)
hold off
ax = gca;
ax.FontSize = 12;
legend('In-Phase', 'Quadrature', 'FontSize', 12)
xlabel('Samples')
ylabel('Amplitude')
f = gcf;
exportgraphics(f,'noise_time.png','Resolution',300)

scatter(real(signal_noise(16,1:8:end)), imag(signal_noise(16,1:8:end)), 10, [0 0.4 1], 'filled');
axis([-2 2 -2 2])
xlabel('In-Phase')
ylabel('Quadrature')

title('')
ax = gca;
ax.FontSize = 12;
f = gcf;
exportgraphics(f,'noise_scatter.png','Resolution',300)