close all;
t = 0:0.001:5;
Ac = 1;
Am = 1;
Fc = 10;
Fm = 1;
Kf = 5;
Fdel = Kf.*Am;
mu = Fdel./Fm;
m = Am.*cos(2.*pi.*Fm.*t);
c = Ac.*cos(2.*pi.*Fc.*t);
s = Ac * cos(2 * pi * Fc * t + mu * sin(2 * pi * Fm * t)); % FM modulation formula adjusted for wideband
subplot(2,2,1);
plot(t,m);
title("message signal");
xlabel("time");
ylabel("amplitude");
subplot(2,2,2);
plot(t,c);
title("carrier signal");
xlabel("tine");
ylabel("amplitude")
subplot(2,2,3);
plot(t,s);
title("modulated signal");
xlabel("timne");
ylabel("amplitude")
