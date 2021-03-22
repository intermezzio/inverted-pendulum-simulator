
function [K, tau] = motor_parameters(varargin)

% load stepper data
steppy = load("mats/steptest.mat");

% create custom exponential fit
custom_exp_func = @(K, tau, x) K*(1-exp(-x./tau));
custom_exp_fit = fittype(custom_exp_func);

% create an exponential line of best fit
good_xs = [steppy.t(steppy.t < 0.5); steppy.t(steppy.t < 0.5)];
good_ys = [steppy.outputL(steppy.t < 0.5); steppy.outputR(steppy.t < 0.5)];
fit_params = fit(good_xs, good_ys, custom_exp_fit, 'Start', [1,1]);

% extract K and tau
K = fit_params.K / mean(steppy.input);
disp(mean(steppy.input))
tau = fit_params.tau;

if nargin == 1
    % plot
    hold off
    plot(steppy.t(steppy.t < 0.5), steppy.outputL(steppy.t < 0.5), ...
        '*', 'DisplayName', 'Experimental Left Wheel Data')
    hold on
    plot(steppy.t(steppy.t < 0.5), steppy.outputR(steppy.t < 0.5), ...
        '*', 'DisplayName', 'Experimental Right Wheel Data')
    plot(steppy.t(steppy.t < 0.5), ...
        custom_exp_func(fit_params.K, tau, steppy.t(steppy.t < 0.5)), ...
        'DisplayName', 'Best Fit for Both Wheels Data')
    xlabel("Time (s)");
    ylabel("Velocity (m/s)");
    title("Velocity over Time with a Stepper Input");
    legend;
    savefig("figs/motor_params.fig");
    saveas(gcf, "figs/motor_params.png");
end

end