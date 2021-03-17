function [gain, omega] = magnitudes(read_file)
% GYROSCOPE TEST!!!
data = load(read_file);

omega = data.omega
% plot(data.t, data.input/100, 'DisplayName', 'input')
% hold on
% plot(data.t, data.outputL, 'DisplayName', 'outputL')
% plot(data.t, data.outputR, 'DisplayName', 'outputR')
% legend

% fitfunc = @(a, b, c, x) a*sin(b*x-c)
coeffs = fit([data.t; data.t], [data.outputL; data.outputR], 'sin1')

[input_pks, not_] = findpeaks(data.input, data.t);
input_height = mean(input_pks);

output_height = coeffs.a1;

gain = output_height / input_height;

% K / (omega^2 * tau^2 + 1) = out / in 

end