clc
close all
clear all
format compact

[wn, l_eff] = gyroscope_parameters()
[K, tau] = motor_parameters()

% avg_vel = control_system