
function [K, tau] = motor_parameters()

[gain150, omega150] = magnitudes("mats/sinetest150.mat")

[gain200, omega200] = magnitudes("mats/sinetest200.mat")

syms K_sym tau_sym

eqns = [K_sym / (tau_sym^2 * omega150^2 + 1) == gain150,
    K_sym / (tau_sym^2 * omega200^2 + 1) == gain200]

solns = solve(eqns, [K_sym, tau_sym])

end