clc
clear 
t = -1:0.001:1 ;
f = 1 ;
x = sin(2*pi*f*t);
plot(t,x);
tittle('sin wave');