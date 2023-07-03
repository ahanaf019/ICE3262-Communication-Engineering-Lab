clc;
clear all;
close all;


## Message Signal
fm = 4;
a = 5;
t = 0 : 0.0001 : 1;

xm = sin(2*pi*fm*t);

subplot(3,1,1)
plot(t, a * xm)
title('Message Signal')

## Carrier Signal
fc = 100;
xc = sin(2*pi*fc*t);

subplot(3,1,2)
plot(t, xc)
title('Carrier Signal')


## Modulation
k = abs(fm - fc) / fm;
k = 10;

mod = a * sin(2*pi*fc*t .+ k*xm);

subplot(3,1,3)
plot(t, mod)
title('FM Modulated Signal')


##  The equation for frequency modulation (FM) can be expressed as:
##
##  x(t) = Ac*cos(2*π*fc*t+β*sin(2*π*fm*t))
##
##  where:
##    x(t) -- is the instantaneous value of the modulated signal at time t.
##    Ac -- is the amplitude of the carrier signal.
##      
##    fc -- is the frequency of the carrier signal.
##
##    β -- is the modulation index, which determines the extent of frequency deviation 
##          caused by the modulating signal.
##    fm -- is the frequency of the modulating signal.
##
##    In this equation, the modulating signal (often an audio signal) is used to vary 
##    the frequency of the carrier signal. The modulation index (β) determines how much
##    the carrier frequency deviates from its original frequency as a result of the 
##    modulating signal.
##
##    It's important to note that this equation assumes a simplified form of FM known 
##    as narrowband FM, where the modulation index is small (β≪1). For wideband FM, a 
##    more complex mathematical representation is required.