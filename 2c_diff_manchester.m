clc;
clear all;
close all;

x = [ 1 0 1 0 1 0 0 1 1 0 ]
bitrate = 3;
V = 5;
F = 100;


## Modulation
t = 0 : 1/F : length(x)/bitrate;
mod = [];
index = 1;
v = V;

if x(1) == 0
  v = -v;
endif


for i=1:length(t)
  if t(i)*bitrate < index - 0.5
  # First Half
    mod(i) = v;
  else
  #Second Half
    mod(i) = -v;
  endif

  if t(i)*bitrate >= index && index < length(x)
    index += 1;
    v = -v;
    if x(index) == 0
      v = -v;
    endif
  endif
  
endfor


plot(t, mod);
xlabel('Time');
ylabel('Amplitude');
xlim([0, length(x)/bitrate])
ylim([-V-1, V+1])
grid on;
title('Modulation using Biphase Differential Manchester')



## Demodulation
index = 1;
demod = [];
v = V;

for i=1:length(t)
  if t(i)*bitrate < index - 0.5
    if mod(i) == v
      demod(index) = 1;
    else
      demod(index) = 0;
    
    endif
    
  endif
  
  if t(i)*bitrate >= index && index < length(x)
    index += 1;
    v = -v;
    
    if demod(index-1) == 0
      v = -v;
    endif
    
    
  endif
  
endfor

demod