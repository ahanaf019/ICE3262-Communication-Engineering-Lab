clc;
clear all;
close all;

x = [ 1 0 1 0 1 0 0 1 1 ]
bitrate = 1;
V = 5;
F = 100;


## Modulation
t = 0 : 1/F : length(x)/bitrate;
mod = [];
index = 1;
v = V;


for i=1:length(t)
  if x(index) == 0
    mod(i) = 0;
  else
    mod(i) = v;
  endif
  

  if t(i)*bitrate >= index && index < length(x)
    index += 1;
    if x(index) == 1
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
title('Modulation using Biphase AMI')


## Demodulation
index = 1;
demod = [];
v = V;

for i=1:length(t)
  if mod(i) == 0
    demod(index) = 0;
  else
    demod(index) = 1;
  endif
  
  if t(i)*bitrate >= index
    index += 1;  
  endif

endfor


demod
