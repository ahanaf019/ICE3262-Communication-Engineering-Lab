clc;
clear all;
close all;

x = [ 0 1 0 0 1 1 0 1 ]
bitrate = 1;
V = 5;
F = 1000;

## Modulation using Unipolar NRZ
mod = [];
t = 0 : 1/F : length(x)/bitrate;
index = 1;

for i=1:length(t)
  if x(index) == 1
    mod(i) = V;
  else 
    mod(i) = 0;
  endif
  
  if t(i)*bitrate >= index
    index += 1;
  endif
endfor

subplot(3, 1, 1);
plot(t, mod);
xlabel('Time');
ylabel('Amplitude');
xlim([0, length(x)/bitrate]);
ylim([-1, V+1]);
title('Modulation using Unipolar NRZ');


## Modulation using ASK
Fc = 10;
a = 1;
xc = a * sin(2*pi*Fc*t);

subplot(3, 1, 2);
plot(t, xc);
xlabel('Time');
ylabel('Amplitude');
xlim([0, length(x)/bitrate]);
ylim([-2, +2]);
title('Carrier Signal');


mod1 = mod .* xc;
subplot(3, 1, 3);
plot(t, mod1);
xlabel('Time');
ylabel('Amplitude');
xlim([0, length(x)/bitrate]);
ylim([-V-1, V+1]);
title('ASK Modulation');


## Demodulation
index = 1;
demod = [];

for i=1:length(mod)
  if mod(i) != 0
    demod(index) = 1;
  else
    demod(index) = 0;
  endif
  
  if t(i)*bitrate >= index
    index += 1;
  endif
endfor

demod