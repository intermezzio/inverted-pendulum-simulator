
function [wn, l_eff] = gyroscope_parameters(varargin)

% GYROSCOPE TEST!!!
load("mats/gyrotest.mat");

% find exponential points
[pks,locs] = findpeaks(angle_rad, t);

% get natural frequency
% as difference between peaks
mean_period = mean(diff(locs));
wn = 2*pi/mean_period;

% length as a function of frequency
l_eff = 9.81/(wn^2);

if nargin == 1
    % plot
    hold off
    plot(t, angle_rad, 'DisplayName', 'Angle');
    hold on;
    plot(locs, pks, 'o', 'DisplayName', 'Peaks');
    xlabel("Time (s)");
    ylabel("Angle (rad)");
    title("Angle over Time for an Oscillating Rocky");
    legend;
    savefig("figs/gyroscope_params.fig");
    saveas(gcf, "figs/gyroscope_params.png");
end

end