%% Plot figures
figure(1)
plot(real(signal_bpsk(16,1:256)), 'Color', '#0066FF', 'LineWidth', 1)
axis([0 256 -2 2])
hold on
plot(imag(signal_bpsk(16,1:256)), 'Color', '#FF3300', 'LineWidth', 1)
hold off
ax = gca;
ax.FontSize = 12;
legend('In-Phase', 'Quadrature', 'FontSize', 12)
xlabel('Samples')
ylabel('Amplitude')
f = gcf;
exportgraphics(f,'bpsk_time.png','Resolution',300)

scatterplot(signal_bpsk(16,:), 8)
title('')
ax = gca;
ax.FontSize = 12;
f = gcf;
exportgraphics(f,'bpsk_scatter.png','Resolution',300)
%%
figure(1)
plot(real(signal_qpsk(16,1:256)), 'Color', '#0066FF', 'LineWidth', 1)
axis([0 256 -2 2])
hold on
plot(imag(signal_qpsk(16,1:256)), 'Color', '#FF3300', 'LineWidth', 1)
hold off
ax = gca;
ax.FontSize = 12;
legend('In-Phase', 'Quadrature', 'FontSize', 12)
xlabel('Samples')
ylabel('Amplitude')
f = gcf;
exportgraphics(f,'qpsk_time.png','Resolution',300)

scatterplot(signal_qpsk(16,:), 8)
title('')
ax = gca;
ax.FontSize = 12;
f = gcf;
exportgraphics(f,'qpsk_scatter.png','Resolution',300)
%%
figure(1)
Fs = 10000;
plot(real(signal_8psk(16,1:256)), 'Color', '#0066FF', 'LineWidth', 1)
axis([0 256 -2 2])
hold on
plot(imag(signal_8psk(16,1:256)), 'Color', '#FF3300', 'LineWidth', 1)
hold off
ax = gca;
ax.FontSize = 12;
legend('In-Phase', 'Quadrature', 'FontSize', 12)
xlabel('Samples')
ylabel('Amplitude')
f = gcf;
exportgraphics(f,'psk8_time.png','Resolution',300)

scatterplot(signal_8psk(16,:), 8)
title('')
ax = gca;
ax.FontSize = 12;
f = gcf;
exportgraphics(f,'psk8_scatter.png','Resolution',300)
%%
figure(1)
plot(real(signal_qam16(16,1:256)), 'Color', '#0066FF', 'LineWidth', 1)
axis([0 256 -2 2])
hold on
plot(imag(signal_qam16(16,1:256)), 'Color', '#FF3300', 'LineWidth', 1)
hold off
ax = gca;
ax.FontSize = 12;
legend('In-Phase', 'Quadrature', 'FontSize', 12)
xlabel('Samples')
ylabel('Amplitude')
f = gcf;
exportgraphics(f,'qam16_time.png','Resolution',300)

scatterplot(signal_qam16(16,:), 8)
title('')
ax = gca;
ax.FontSize = 12;
f = gcf;
exportgraphics(f,'qam16_scatter.png','Resolution',300)
%%
figure(1)
plot(real(signal_qam64(16,1:256)), 'Color', '#0066FF', 'LineWidth', 1)
axis([0 256 -2 2])
hold on
plot(imag(signal_qam64(16,1:256)), 'Color', '#FF3300', 'LineWidth', 1)
hold off
ax = gca;
ax.FontSize = 12;
legend('In-Phase', 'Quadrature', 'FontSize', 12)
xlabel('Samples')
ylabel('Amplitude')
f = gcf;
exportgraphics(f,'qam64_time.png','Resolution',300)

scatterplot(signal_qam64(16,:), 8)
title('')
ax = gca;
ax.FontSize = 12;
f = gcf;
exportgraphics(f,'qam64_scatter.png','Resolution',300)
%%
figure(1)
plot(real(signal_noise(16,1:256)), 'Color', '#0066FF', 'LineWidth', 1)
axis([0 256 -2 2])
hold on
plot(imag(signal_noise(16,1:256)), 'Color', '#FF3300', 'LineWidth', 1)
hold off
ax = gca;
ax.FontSize = 12;
legend('In-Phase', 'Quadrature', 'FontSize', 12)
xlabel('Samples')
ylabel('Amplitude')
f = gcf;
exportgraphics(f,'noise_time.png','Resolution',300)

scatterplot(signal_noise(16,:), 8)
title('')
ax = gca;
ax.FontSize = 12;
f = gcf;
exportgraphics(f,'noise_scatter.png','Resolution',300)