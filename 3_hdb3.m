clc;
clear all;
close all;

x = [ 1 1 0 0 0 0 1 0 0 0 0 0 0 0 0 ]
bitrate = 1;
V = 5;

count0 = 0;
count1 = 0;

for i = 1: length(x)
  if x(i) == 0
    count0 += 1;
  else
    count1 += 1;
  endif
  
  if count0 == 4
    count0 = 0;
    if mod(count1, 2) == 1
      x(i) = -1;
    else
      x(i) = -1;
      x(i-3) = 1;
    endif
    count1 = 0;
  endif
  
endfor

##x

F = 1000;
t = 0: 1/F: length(x)/bitrate;

mod = [];
index = 1;

v = -V;
if x(1) == 1
  v = -v;
endif

for i=1:length(t)
  
  if x(index) == 0
    mod(i) = 0;
  else
    mod(i) = v;
  endif

  
  if bitrate*t(i) >= index && index < length(x)
    index += 1;
    
    if x(index) == 1
      v = -v;
    endif
    
  endif
endfor

plot(t, mod);
xlim([0, length(x)/bitrate]);
ylim([-V-1, V+1]);

#### Demodulation
demod = [];
index = 1;

v = -V;
viol = 0;

for i=1:length(t)

  if bitrate*t(i) >= index
    index += 1;
    index;
    
      if mod(i) == 0
        demod(index-1) = 0;
    
      elseif mod(i) == -v
        demod(index-1) = 1;
        v = -v;
  
      else
        demod(index-1) = 0;  
        demod(index-4) = 0;     
      endif
     
      
      
  endif
  
endfor


demod
