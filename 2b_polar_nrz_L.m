clc;
clear all; 
close all;

x = [ 1 0 1 0 1 1 0 0 1 ]
bitrate = 3;
V = 5;
F = 100;

## Modulation
index = 1;
mod = [];
t = 0 : 1/F: length(x)/bitrate;

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

plot(t, mod);
xlim([0, length(x)/bitrate]);
ylim([-V-1, V+1]);
xlabel('Time');
ylabel('Amplitude');
title('Polar NRZ\_L Modulated Signal')


## Demodulation
demod = [];
index = 1;

for i=1:length(t)
  if mod(i) == V
    demod(index) = 1;
  else
    demod(index) = 0;
  endif
  
  if t(i)*bitrate >= index
    index += 1;
  endif
endfor

demod