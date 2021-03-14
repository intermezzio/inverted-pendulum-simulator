
function [wn, l_eff] = gyroscope_parameters()

% GYROSCOPE TEST!!!
load("mats/gyrotest.mat");

% plot(t, angle_rad);

% find exponential points
[pks,locs] = findpeaks(angle_rad, t);

hold on;
plot(locs, pks, 'o');

% get natural frequency
mean_period = mean(diff(locs));
wn = 1/mean_period;

% length
l_eff = 9.81/(wn^2)
end