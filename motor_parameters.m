
function [K, tau] = motor_parameters()

% [gain150, omega150] = magnitudes("mats/sinetest150.mat")
% 
% [gain200, omega200] = magnitudes("mats/sinetest200.mat")

steppy = load("mats/steptest.mat");

custom_exp_fit = fittype(@(K, tau, x) K*(1-exp(-x/tau)));

good_xs = [steppy.t(steppy.t < 0.5); steppy.t(steppy.t < 0.5)];
good_ys = [steppy.outputL(steppy.t < 0.5); steppy.outputR(steppy.t < 0.5)];
fit_params = fit(good_xs, good_ys, custom_exp_fit, 'Start', [1,1]);

% syms K_sym tau_sym
% 
% eqns = [K_sym / (tau_sym^2 * omega150^2 + 1) == gain150,
%     K_sym / (tau_sym^2 * omega200^2 + 1) == gain200]
% 
% solns = solve(eqns, [K_sym, tau_sym])
% 
K = fit_params.K / mean(steppy.input);
tau = fit_params.tau;
end