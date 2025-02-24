clc 
t = 0:0.001:1;
fc = 10;
fm = 1;
Am = 5;
Ac =10;
kp= pi/3;
C =  Ac.*cos(2.*pi.*fc.*t);
M = Am.*cos(2.*pi.*fm*t);
PM = Ac.*cos((2.*pi.*fc+(M.*kp)).*t);
subplot(3,1,1);
plot(t,M);
title("modulating signal");
xlabel("time");
ylabel("amplitude");
subplot(3,1,2);
plot(t,C);
title("Carrier signal");
xlabel("time");
ylabel("amplitude");
subplot(3,1,3);
plot(t,PM);
title("phase modulation");
xlabrl("time");
ylabrl("amplitude");