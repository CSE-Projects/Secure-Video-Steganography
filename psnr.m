%=== Get both messages ===%
r_message = logical(imread('r_message.png'));
message = imread('message.png');

%=== Calculate squared error ===%
squared_error = 0;
for i = 1:140
    for j = 1:200
        % difference in pixel squared
        squared_error = squared_error + (message(i, j) - r_message(i, j))^2;
    end
end

% calculate mean squared error
mean_squared_error = squared_error / (140*200);

% Get PSNR value
psnr_val = -10*(log10(mean_squared_error))