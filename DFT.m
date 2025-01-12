% Input signal
x = [1, 2, 3, 4];

% Number of samples
N = length(x);

% Initialize the output DFT vector
X = zeros(1, N);

% Calculate the DFT
for k = 1:N
    for n = 1:N
        X(k) = X(k) + x(n) * exp(-1i * 2 * pi * (k - 1) * (n - 1) / N);
    end
end

% Plot the magnitude and phase spectra
subplot(2, 1, 1);
stem(abs(X));
title('Magnitude Spectrum');
xlabel('Frequency (k)');
ylabel('|X[k]|');

subplot(2, 1, 2);
stem(angle(X));
title('Phase Spectrum');
xlabel('Frequency (k)');
ylabel('Phase (radians)');
