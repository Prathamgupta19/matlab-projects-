clc 
t = -1:0.001:1;
f = 1 ;
x = sin(2*pi*f*t);
y = cos(2*pi*f*t);
subplot(3,1,1);
plot(t,x);
tittle('sin wave');
subplot(3,1,3);
plot(t,y);
tittle('cos wave');
subplot(3,1,3);
plot(t,x);
hold on 
plot(t,y);
tittle('both together');



