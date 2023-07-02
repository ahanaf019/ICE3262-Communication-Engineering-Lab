clc;
clear all;
close all;

x = [  0 1 0 1 1 0 0 1 0 1 0 ]
bitrate = 1;
V = 5;
F = 100;

## Modulation
t = 0 : 1/F : length(x)/bitrate;
mod = [];
index = 1;

for i=1:length(t)
  
  if t(i)*bitrate <= index - 0.5
    if x(index) == 1
      mod(i) = -V;
    else
      mod(i) = V;
    endif
    
  else
    if x(index) == 1
      mod(i) = V;
    else
      mod(i) = -V;
    endif
  endif

  if t(i)*bitrate >= index
    index += 1;
  endif
  
endfor


plot(t, mod);
xlabel('Time');
ylabel('Amplitude');
xlim([0, length(x)/bitrate])
ylim([-V-1, V+1])
grid on;
title('Modulation using Biphase Manchester')



## Demodulation
index = 1;
demod = [];

for i=1:length(t)
  
  if t(i)*bitrate < index - 0.5
    if mod(i) == V
      demod(index) = 0;
    else
      demod(index) = 1;
    endif
  endif
    
  if t(i)*bitrate >= index - 0.5 && index < length(x) 
    index += 1;
  endif
  
endfor


demod
