clc;
clear all;
close all;

x = [ 1 0 1 0 1 1 0 0 1 ]

bitrate = 2;
V = 5;
F = 100;

t = 0 : 1/F: length(x)/bitrate;

## Modulation
mod = [];
index = 1;
for i = 1:length(t)
  if x(index) == 1
    mod(i) = V;   
  else
    mod(i) = 0;
  endif
  
  if bitrate*t(i) >= index
    index += 1;
  endif
endfor

## Plot Modulated Signal
plot(t, mod)
xlabel('Time')
ylabel('Amplitude')
title('Unipolar NRZ Modulated Signal')
##axes(0, length(t), -1, 6)
xlim([0, length(x)/bitrate])
ylim([-1, V+1])




## Demodulation
index = 1;
demod = [];

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
