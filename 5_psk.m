clc;
clear all;
close all;

x = [ 0 1 0 0 1 1 0 1 ]
bitrate = 1;
V = 5;
F = 1000;

## Modulation using Polar NRZ
mod = [];
t = 0 : 1/F : length(x)/bitrate;
index = 1;

for i=1:length(t)
  if x(index) == 1
    mod(i) = V;
  else 
    mod(i) = -V;
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
ylim([-V-1, V+1]);
title('Modulation using Polar NRZ');



## Modulation using PKS
fc = 4;
a = 1;
xc = a*sin(2*pi*fc*t);

subplot(3, 1, 2);
plot(t, xc);
xlabel('Time');
ylabel('Amplitude');
xlim([0, length(x)/bitrate]);
ylim([-a-1, a+1]);
title('Carrier Frequency');


mod1 = xc .* mod;
subplot(3, 1, 3);
plot(t, mod1);
xlabel('Time');
ylabel('Amplitude');
xlim([0, length(x)/bitrate]);
ylim([-V-1, V+1]);
title('PSK Modulation');


## Demodulation
index = 1;
demod = [];

for i=1:length(mod1)
  if mod1(i)/V == xc(i)
    demod(index) = 1;
  else
    demod(index) = 0;
  endif
  
  if t(i)*bitrate >= index
    index += 1;
  endif
endfor

demod
