clc
close all
clear all

% Generate a sinusoid
fm = 100;
Fs = 1000;
Ts = 1/Fs;
t = 0:Ts:(1-Ts);

x = sin(2*pi*fm*t);   % Sine wave of freq. fm offset to avoid -ve values

figure;
subplot(2,1,1),plot(t,x);
xlabel('Time','FontSize',16);
ylabel('Amplitude','FontSize',16);
title('Sinusoid with fm = 100 Hz','FontSize',16);

% Compute Fourier Transform
y = fft(x);
N = length(x);
freq = (1:N)*Fs/N - 1;  % Calculate frequency axis; resolution in frequency is Fs/N

% Plot absolute values of spectrum from -Fs/2 to Fs/2
subplot(2,1,2),plot(freq-Fs/2,fftshift(abs(y)));
xlabel('Frequency','FontSize',16);
ylabel('Amplitude','FontSize',16);
title('Spectrum of Sinusoid with fm = 100 Hz','FontSize',16);
