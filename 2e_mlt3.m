clc;
clear all;
close all;

x = [ 0 0 1 0 0 1 0 1 1 0 1 1 0 1 ]
bitrate = 1;
V = 5;
F = 100;
prev = -1;

## Modulation
t = 0 : 1/F : length(x)/bitrate;
mod = [];
index = 1;
v = 0;

if x(1) == 1
  v = V;
  prev = 1;
endif

  


for i=1:length(t)
  mod(i) = v;

  if t(i)*bitrate >= index && index < length(x)
    index += 1;
    if x(index) == 1
      if v != 0
        v = 0;   
      else
      # v == 0
      if prev == -1
        v = V;
        prev = 1;
      else
        v = -V;
        prev = -1;
      endif   
      endif    
    endif
  endif
  
endfor


plot(t, mod);
xlabel('Time');
ylabel('Amplitude');
xlim([0, length(x)/bitrate])
ylim([-V-1, V+1])
grid on;
title('Modulation using Multitransition MLT-3')



## Demodulation
demod = [];
index = 1;
v = 0;
prev = -1;

if mod(1) == V
  demod(1) = 1;
else
  demod(1) = 0;
endif


for i=1:length(t)
  
  if t(i)*bitrate > index
    index += 1;
    if mod(i) == mod(i-1)
      demod(index) = 0;
    else
      demod(index) = 1;
    endif
  endif
  
endfor

demod