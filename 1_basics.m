clc;
close all;
clear all;

t = 0 : 0.001 : 1;

## Simple Sine Wave
a1 = 1;
del1 = 0;
f1 = 5;
T1 = 1/f1;

x1 = a1 * sin(2*pi*f1*t + del1);


## Simple Sine Wave
a2 = 1;
del2 = 0;
f2 = 10;
T2 = 1/f2;

x2 = a2 * sin(2*pi*f2*t + del2);


subplot(2,1,1)
hold on;
plot(t, x1);
plot(t, x2);
xlabel('Time');
ylabel('Amplitude');
legend('wave1 f1=5hz', 'wave2 f2=10hz');
title('Simple Sine Waves');


## Composite Sine Wave
x = x1 + x2;
subplot(2,1,2);
plot(t, x);
xlabel('Time');
ylabel('Amplitude');
title('Composite Sine Wave');


## Sampling
fs = 50;
Ts = 1/fs;
ts = 0 : Ts : 1;
xs = a1*sin(2*pi*f1*ts + del1) + a2*sin(2*pi*f2*ts + del2)

hold on;
plot(ts, xs, 'x-')
legend('Composite Wave', 'Sampled Composite Wave')


