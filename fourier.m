clc
T = 2;
fs = 1000;
w0 = 2*pi/T;
k = 0 : 1/fs : 5-1/fs;
y = square(w0*k,50);
figure
plot(k,y);
syms t
N = 5;
n = 1:N;
a0 = (2/T)*(int(1,t,0,1)+int(-1,t,1,2));
an = (2/T)*(int(1*cos(n*w0*t),t,0,1)+int(-1*cos(n*w0*t),t,1,2));
bn = (2/T)*(int(1*sin(n*w0*t),t,0,1)+int(-1*sin(n*w0*t),t,1,2));
F = a0/2;
for i=1:5
    F = F + an(i)*cos(i*w0*k) + bn(i)*sin(i*w0*k);
end
figure
plot(k,F);
grid on
