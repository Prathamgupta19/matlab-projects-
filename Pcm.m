clc;
close all;

% Parameters
am = 5;           % Amplitude of the message signal
fm = 2;           % Frequency of the message signal
fs = 1000;        % Sampling frequency
t = 1;            % Duration of the signal

% Time vector
n = 0 : 1/fs : t;

% Message signal
m = am .* sin(2 * pi * fm * n);
ms = m + am;

% Quantization
L = 10; % Number of quantization levels
sig_pmax = max(ms);
sig_nmax = min(ms);
d = (sig_pmax - sig_nmax) / (L - 1); % Quantization step size
q_level = sig_nmax : d : sig_pmax;

% Normalize the message signal
sigp = (ms - sig_nmax) / (sig_pmax - sig_nmax) * (L - 1) + 1;
q_ind = round(sigp); % Quantization indices

% Quantized output signal
q_out = q_level(q_ind);

% Quantization error
qe = q_out - ms;

% Bit encoding
q_int = floor(q_out); % Convert to integer
num_bits = ceil(log2(L)); % Number of bits required
b = zeros(length(q_int), num_bits);

% Manual binary conversion
for i = 1:length(q_int)
    b(i, :) = dec2bin_custom(q_int(i), num_bits); % Binary conversion
end

% Encode bits
enc = reshape(b', 1, []); % Flatten binary matrix into a single row vector

% Custom function to convert decimal to binary
function b = dec2bin_custom(d, num_bits)
    % Convert decimal number d to a binary vector of length num_bits
    b = zeros(1, num_bits);
    for k = num_bits:-1:1
        b(num_bits - k + 1) = mod(d, 2);
        d = floor(d / 2);
    end
end

% Plotting
figure;

% Message signal
subplot(5,1,1);
plot(n, m); 
ylim([-6 6]);
grid on;
xlabel('Time'); 
ylabel('m(t)');
title('Message Signal');

% PCM Quantized Signal
subplot(5,1,2);
plot(n, q_out); 
ylim([-6 6]);
grid on;
xlabel('Time'); 
ylabel('p(t)');
title('PCM Quantized Signal');

% Quantization Error
subplot(5,1,3);
plot(n, qe);
ylim([-1 1]);
grid on;
xlabel('Time');
ylabel('qe(t)');
title('Quantization Error Signal');

% All Signals
subplot(5,1,4);
plot(n, m, n, q_out, n, qe);
ylim([-6 6]);
grid on;
xlabel('Time');
ylabel('Signals');
title('All Signals');
legend('Message Signal', 'Quantized Signal', 'Quantization Error');

% Encoded Signal
subplot(5,1,5);
plot(enc); 
ylim([-0.5 1.5]);
grid on;
xlabel('Sample Number'); 
ylabel('e(t)');
title('Encoded Signal');
