clear; clc;

% Parameters (audio)
sr = 44100;
filepath = '/MATLAB Drive/.Trash-1000600715/files/sample-12s.mp3';
n_fft = 4096;
hop_length = round(n_fft / 4 * 3);
overlap = n_fft - hop_length;
n_plot_tf = 80;
n_freqs = n_fft / 2 + 1;
f_max_idx = 480;
window = hamming(n_fft);

% Parameters (plot, video)
fps = 1.0;

% Initialize variables
amp = zeros(n_plot_tf, f_max_idx);
random_frequency_idx = randi([1, f_max_idx], 1, 5);
amp4 = cell(1, numel(random_frequency_idx));
vmax = 1.0;
vmin = 0.0;

% Create subplots
figure;
subplot(2, 2, 1);
image1 = imagesc(amp, [vmin, vmax]);
colorbar;
axis xy;

subplot(2, 2, 2);
image2 = imagesc(amp, [vmin, vmax]);
colorbar;
axis xy;

subplot(2, 2, 3);
image3 = imagesc(amp, [vmin, vmax]);
colorbar;
axis xy;

pretime = tic;

% Read and process audio frames
[y, fs] = audioread(filepath);
amp4 = cell(1, numel(random_frequency_idx));
amp_max = 1;

for index = 1:hop_length:(length(y) - n_fft)
    block = y(index:(index + n_fft - 1));
    
    % Compute the Short-Time Fourier Transform (STFT)
    stft_result = spectrogram(block, window, overlap, n_fft, fs);
    
    % Get the relevant frequencies (summing magnitudes of the STFT result)
    relevant_freqs = sum(abs(stft_result(1:f_max_idx, :)), 1);
    
    amp(end, :) = relevant_freqs;

    % Add random noise to selected frequencies
    amp2 = zeros(size(amp));
    for i = 1:numel(random_frequency_idx)
        noise_level = rand(1);
        amp2(:, random_frequency_idx(i)) = noise_level;
    end

    amp2 = amp2 * (vmax / max(amp2(:)));

    amp3 = amp + amp2;

    set(image1, 'CData', amp');
    set(image2, 'CData', amp2');
    set(image3, 'CData', amp3');

    time_diff = toc(pretime);
    fps = 1 / time_diff;
    pretime = tic;

    pause(0.001);

    amp(1:(end - 1), :) = amp(2:end, :);
    for i = 1:numel(random_frequency_idx)
        amp4{i} = [amp4{i}; amp2(:, random_frequency_idx(i))'];
        if max(amp4{i}(:)) > amp_max
            amp4{i} = amp4{i} * (amp_max / max(amp4{i}(:)));
        end
    end
end

% Display the final figure
figure;
imshow(amp4{1}, [vmin, amp_max]);
colorbar;
axis xy;
title('Random Noise 1');

figure;
imshow(amp4{2}, [vmin, amp_max]);
colorbar;
axis xy;
title('Random Noise 2');

% Generating random noise with a constant frequency
duration = length(amp) / sr;
frequency = 440.0;
t = linspace(0, duration, length(amp), 'endpoint', false);
noise = sin(2 * pi * frequency * t);

% Plotting the noise in the second subplot
subplot(2, 2, 4);
plot(t, noise);
title('Random Noise with Constant Frequency');
xlabel('Time (s)');
ylabel('Amplitude');

% Convert the STFT result 'amp3' back to the audio signal
istft_signal = istft(amp4{1}', hamming(n_fft), hop_length, n_fft);

% Save the audio signal to a file
output_filepath = 'output_audio.wav';
audiowrite(output_filepath, istft_signal, fs);

% Optionally, you can also play the audio
sound(istft_signal, fs);

