close all;clear;clc; 
 
%% Declarations

ts = 0.001;
fs = 1/ts;
fc = 5;
t = 0:ts:2;
Wn = pi*fc/(2*fs);
n = 3;

%% Preparation

signal = cos(2*pi*fc*t);
noise = rand(1, length(signal)); % Generating Random Noise
noisySignal = signal + noise;

%% Filtering Stage

[b,a] = butter(n, Wn, 'low');
filteredSignal = filter(b, a, noisySignal);
filteredSignal = filteredSignal - mean(filteredSignal); % Subtracting the mean to block DC Component

%% Plotting

figure(1)
subplot(3,1,1)
plot(t, signal, 'linewidth', 1.5)
title('Signal')
ylim([-1.5 1.5])
grid minor

subplot(3,1,2)
plot(t, noise)
title('Noise')
ylim([-1.5 2])
grid minor

subplot(3,1,3)
plot(t, noisySignal)
title('Noisy Signal')
ylim([-1.5 1.5])
grid minor

figure(2)
plot(t, filteredSignal, 'r', 'linewidth', 1.5)
hold on
plot(t, signal, 'linewidth', 1.5)
hold off
legend('Filtered Signal', 'Original Signal')
grid minor
ylim([-1.5 1.5]) 
