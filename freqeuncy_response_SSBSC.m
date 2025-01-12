fc = 30;          % frequency of carrier signal
fm = 5;           % frequency of message signal
Am = 1;             % amplitude of message signal
Ac = 1;             % amplitude of carrier signal
t = 0 : 0.001 : 1;  % time vector
fs = 100;
message_signal = Am*sin(2*pi*fm*t);
carrier_signal = Ac*sin(2*pi*fc*t);

signal_upper_band = message_signal.*cos(2*pi*(fc + fm)*t) - message_signal.*sin(2*pi*(fc+fm)*t);
signal_lower_band = message_signal.*cos(2*pi*(fc - fm)*t) - carrier_signal.*sin(2*pi*(fc-fm)*t);
z = fft(signal_upper_band);
g = (0:length(z)-1)*fs/length(z);
y = fft(signal_lower_band);
f = (0:length(y)-1)*fs/length(y);
subplot(3,3,1)
plot(g , abs(z));
title('frequency response of upper band');
xlabel('frequency');
ylabel('upper signal');

subplot(3,3,2)
plot(fc , abs(y));
title('frequency response of lower band');
xlabel('frequency');
ylabel('lower signal');


subplot(3,3,3);
plot(t,message_signal);
title('Message Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(3,3,4);
plot(t, carrier_signal);
title('Carrier Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(3,3,5);
plot(t, signal_lower_band);
title('Lower Sideband Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(3,3,6);
plot(t, signal_upper_band);
title('Upper Sideband Signal');
xlabel('Time (s)');
ylabel('Amplitude');
