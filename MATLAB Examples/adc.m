clc
close all
clear all

% Generate a sinusoid
fm = 2;
Fs = 1000;
Ts = 1/Fs;
t = 0:Ts:(1-Ts);

x = 1 + sin(2*pi*fm*t);   % Sine wave of freq. fm offset to avoid -ve values

figure;
subplot(2,1,1),plot(t,x);
xlabel('Time','FontSize',16);
ylabel('Amplitude','FontSize',16);
title('Sinusoid with fm = 2 Hz','FontSize',16);

% ADC
qlevels = 2^8;     % Simulate a 12-bit ADC
quants = 0:(1/qlevels):(2-1/qlevels);  % Define quantization levels; can also do non-uniform quantization
xquant = x;
D = 10;             % Decimation factor
for i = 1:D:length(x)
    ind = find(quants > x(i), 1, 'first') - 1;   % Find the quantization bin
    if (isempty(ind))
        ind = length(quants);  % Quantize to max. value if x(i) larger than largest qvalue
    end
    xquant(1,i:(i+D-1)) = repmat(quants(ind),1,D);  % Copy quantized value D times
end

subplot(2,1,2),plot(t,xquant);
xlabel('Time','FontSize',16);
ylabel('Amplitude','FontSize',16);
title('Effect of ADC: Downsample by 10 and Quantize to 2^{12} Values','FontSize',16);
