clc;
close all;
clear all;

x = [ 1 1 0 1 0 0 0 1 1 1 0 ]
bitrate = 1;
V = 5;
F = 100;
## Modulation
t = 0: 1/F: length(x)/bitrate;

index = 1;
mod = [];
v = V;

if x(1) == 1
  v = -v;
endif

for i=1:length(t)
  
  mod(i) = v;
  
  if t(i)*bitrate >= index && index != length(x)
    index += 1;
    if x(index) == 1
      v = -v;
    endif
  endif
  
endfor


plot(t, mod)
xlabel('Time')
ylabel('Amplitude')
title('Modulation using Polar NRZ\_I')
xlim([0, length(x)/bitrate])
ylim([-V-1, V+1])


## Demodulation
v = V;
demod = [];
index = 1;

for i=1:length(t) - 1
  if mod(i) == v
    demod(index) = 0;
  else
    demod(index) = 1;
  endif
  
  if t(i)*bitrate >= index
    index += 1; 
    v = mod(i);
  endif
  
endfor


demod
