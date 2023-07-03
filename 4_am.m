clc;
clear all;
close all;

fm = 5;
am = 2;
t = 0 : 0.001 : 1;

xm = am * sin(2*pi*fm*t);

subplot(3,1,1)
plot(t, xm)
title('Message Signal')


fc = 50;
ac = 6;
xc = ac * sin(2*pi*fc*t);

subplot(3,1,2)
plot(t, xc)
title('Message Signal')

## Modulation
k = am/ac;
mod = ac*(1 + k*xm) .* xc;

subplot(3,1,3)
plot(t, mod)
title('AM Modulated Signal')