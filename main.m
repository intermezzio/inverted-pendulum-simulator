clc
close all
clear all
format compact

[wn, l_eff] = gyroscope_parameters();
[K_motor, tau] = motor_parameters();

g = 9.81;
[Kp, Ki] = control_parameters(K_motor, tau, wn, l_eff)
% Kp = -Kp
% Ki = -Ki

% avg_vel = control_system