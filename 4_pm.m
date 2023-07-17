clc;
clear all;
close all;


## Message Signal
fm = 4;
am = 5;
t = 0 : 0.0001 : 1;

xm = am * cos(2*pi*fm*t);

subplot(3,1,1)
plot(t, xm)
title('Message Signal')

## Carrier Signal
ac = 5;
fc = 100;
xc = ac * cos(2*pi*fc*t);

subplot(3,1,2)
plot(t, xc)
title('Carrier Signal')


## Modulation
k = 10;
beta = k * am;

mod = ac * cos(2*pi*fc*t .+ k* cos(2*pi*fm*t));

subplot(3,1,3)
plot(t, mod)
title('FM Modulated Signal')

