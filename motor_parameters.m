
function [K, tau] = motor_parameters()

% GYROSCOPE TEST!!!
data = load("mats/sinetest150.mat");

data.omega
% plot(data.t, data.input/100, 'DisplayName', 'input')
% hold on
% plot(data.t, data.outputL, 'DisplayName', 'outputL')
% plot(data.t, data.outputR, 'DisplayName', 'outputR')
% legend

% fitfunc = @(a, b, c, x) a*sin(b*x-c)
coeffs = fit([data.t; data.t], [data.outputL; data.outputR], 'sin1')

[input_pks,not_] = findpeaks(data.input, data.t);
input_height = mean(input_pks);

output_height = coeffs.a1;

K = output_height / input_height;

tau = coeffs.b1;
end