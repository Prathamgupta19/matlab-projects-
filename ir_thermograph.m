% Load temperature data from Excel file
data = readtable('/MATLAB Drive/ir matlab.xlsx', 'PreserveVariableNames', true); % Preserve original variable names

% Extract temperature column from the table
temperatureData = str2double(strrep(data.TemperatureColumn, ' °C', ''));

% Create a time vector (using row indices as a proxy for time)
timeVector = 1:numel(temperatureData);

% Plot line graph of temperature values over time
figure;
subplot(3,1,1);
plot(timeVector, temperatureData, '-o');
title('Temperature Over Time (Proxy)');
xlabel('Time (Row Index)');
ylabel('Temperature (°C)');

% Thermal map
subplot(3,1,2);
scatter(timeVector, temperatureData, 50, temperatureData, 'filled');
colormap('jet');
colorbar;
title('Thermal Map Over Time (Proxy)');
xlabel('Time (Row Index)');
ylabel('Temperature (°C)');

% Temperature probability distribution graph
subplot(3,1,3);
histogram(temperatureData, 'BinWidth', 1);
title('Temperature Probability Distribution');
xlabel('Temperature (°C)');
ylabel('Frequency');

% Adjust the layout for better visualization
sgtitle('Temperature Analysis');
