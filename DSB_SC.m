fc = 30;          % frequency of carrier signal
fm = 5;           % frequency of message signal
Am = 1;             % amplitude of message signal
Ac = 1;             % amplitude of carrier signal
t = 0 : 0.001 : 1;  % time vector

message_signal = Am*sin(2*pi*fm*t);
carrier_signal = Ac*sin(2*pi*fc*t);

signal_upper_band = message_signal.*cos(2*pi*(fc + fm)*t) - message_signal.*sin(2*pi*(fc+fm)*t);
signal_lower_band = message_signal.*cos(2*pi*(fc - fm)*t) - carrier_signal.*sin(2*pi*(fc-fm)*t);

subplot(2,2,1);
plot(t,message_signal);
title('Message Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(2,2,2);
plot(t, carrier_signal);
title('Carrier Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(2,2,3);
plot(t, signal_lower_band);
title('Lower Sideband Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(2,2,4);
plot(t, signal_upper_band);
title('Upper Sideband Signal');
xlabel('Time (s)');
ylabel('Amplitude');
