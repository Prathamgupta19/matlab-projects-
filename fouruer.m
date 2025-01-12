clc
T = 2;
Wo = 2*pi/T;
k = 0 : 1/10 : 10;
y = square(Wo*k,50);
figure
plot(k.y);
syms t
N = 5;
n = 1:N;
a0 = (2/T)*(int(1,t,0,1)+int(-1,t,1,2));
an = (2/T)*(int(1*cos(n*Wo*t),t,0,1)+int(-1*cos(n*Wo*t),t,1,2));
bn = (2/T)*(int(1*sin(n*Wo*t),t,0,1)+int(-1*sin(n*Wo*t),t,1,2));
F = a0/2;
for i=1:5
    F = F + an(i)*cos(i*Wo*k) + bn(i)*sin(i*Wo*k);
end
figure
plot(k,F);
grid on
