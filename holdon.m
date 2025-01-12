clc 
t = -1:0.001:1;
f = 1 ;
x = sin(2*pi*f*t);
y = cos(2*pi*f*t);
subplot(3,1,1);
plot(t,x);
title('sin wave');
subplot(3,1,2);
plot(t,y);
title('cos wave');
subplot(3,1,3);
plot(t,x);
hold on 
plot(t,y);
title('both together');



