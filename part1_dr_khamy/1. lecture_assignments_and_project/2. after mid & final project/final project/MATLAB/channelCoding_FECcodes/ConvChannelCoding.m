%--------------FINAL PROJECT
%----------WIRELESS COMMUNICATIONS
%--------Prof. Dr. Said E. El-Khamy
%----Communication & Electronics department
%--Student Name:
% Asmaa Gamal Abdel-Halem Mabrouk Nagy %أسماء جمال عبد الحليم مبروك ناجي
%--Student ID: 15010473  

%--Student Name:
% Khloud Mousad Mohamed %خلود مسعد الطايفي 
%Student ID: 18010614
 
%--Title:Channel Coding using Convolutional codes in OFDM Vehicular Car-to-Car Wireless Communication Systems
%% The MATLAB Code: 
% CDMA2000 1x example script for network quality vs. number of users

% Define the number of users to simulate and the signal length
num_users = 64;
signal_length = 1024;

% Generate random data for each user
data = randi([0 1], num_users, signal_length);

% Find the smallest power of 2 greater than or equal to the number of users
pow2_num_users = 2^nextpow2(num_users);

% Generate Walsh codes for the smaller power of 2
walsh_codes_small = hadamard(pow2_num_users);

% Use Kronecker product to generate Walsh codes for the actual number of users
walsh_codes = kron(eye(num_users), walsh_codes_small(1:num_users, 1:num_users));

% Define the range of number of users to simulate
num_users_range = 1:num_users;

% Define the range of signal-to-noise ratios (SNRs) to simulate
snr_range = -10:2:20;

% Initialize the bit error rate (BER) matrix
ber_matrix = zeros(length(num_users_range), length(snr_range));

% Loop over the number of users and SNRs to calculate the BER for each combination
for i = 1:length(num_users_range)
    for j = 1:length(snr_range)
        % Calculate the index of the current SNR in the snr_range
        snr_index = j;
        
        % Get the number of users to simulate for the current iteration
        num_users_current = num_users_range(i);
        
        % Generate the subset of Walsh codes and data for the current number of users
        walsh_codes_current = walsh_codes(1:num_users_current, 1:num_users_current);
        data_current = data(1:num_users_current, :);
        
        % Spread the data for each user using their assigned Walsh code
        spread_data = walsh_codes_current * data_current;

        % Add Gaussian noise to the spread data to simulate the channel
        noise_power = 10^(-snr_range(snr_index) / 10);
        noise = sqrt(noise_power) * randn(size(spread_data));
        noisy_data = spread_data + noise;
        
        % Despread the received data using the assigned Walsh codes
        despread_data = walsh_codes_current' * noisy_data;

        % Decode the data for each user and calculate the BER
        decoded_data = (despread_data > 0.5);
        errors = sum(xor(decoded_data, data_current), 2);
        ber = errors / signal_length;

        % Store the BER for the current number of users and SNR
        ber_matrix(i, j) = mean(ber);
    end
end

% Plot the BER vs. the number of users for each SNR
figure
semilogy(num_users_range, ber_matrix, '-o')
xlabel('Number of users')
ylabel('Bit error rate')
title('Network quality vs. number of users')
leg = legend(string(snr_range), 'Location', 'best');
title(leg, 'SNR Value')
grid on

legend_title = title('SNR Value');
set(legend_title, 'String', 'SNR Value');