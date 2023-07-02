clc;
clear all;
close all;

x = [ 1 0 1 1 0 0 1 0 ]
bitrate = 2;
V = 5;
F = 100;

## Modulation
t = 0: 1/F: length(x)/bitrate;
index = 1;
mod = zeros(1, length(t));

for i=1:length(t)
  
  if t(i)* bitrate <= index - 0.5
  
    if x(index) == 1
      mod(i) = V;
    else
      mod(i) = -V;
    endif
   endif
  
  if t(i)*bitrate >= index && index < length(x)
    index += 1;
  endif
  
endfor

plot(t, mod)
xlabel('Time')
ylabel('Amplitude')
title('Modulation using Polar RZ')
xlim([0, length(x)/bitrate])
ylim([-V-1, V+1])


## Demodulation
demod = [];
index = 1;

for i=1:length(t)
  
  if mod(i) == V
    demod(index) = 1;
  elseif mod(i) == -V
    demod(index) = 0; 
  endif
  
  if t(i)*bitrate >= index
    index += 1;
  endif
endfor

demod
