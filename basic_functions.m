clc 
clear 
x = -5:0.001:5;
y = x==0;
subplot(2,2,1);
plot(x,y,'red');
title('impulse');
xlabel('input');
ylabel('output');
z = -5:5;
s = z==0;
subplot(2,2,2);
stem(z,s,'blue');
title('impulse');
xlabel('input');
ylabel('output');
p = z>0; 
subplot(2,2,3);
stem(z,p,'green');
title('unit step');
xlabel('input');
ylabel('output');
w = z.*p;
subplot(2,2,4);
stem(z,w,'green');
title('ramp');
xlabel('input');
ylabel('output');
