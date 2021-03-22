clear all
main()
% syms g K_motor l_eff tau
syms s Kp Ki
% s=tf('s')
% Hs_d = [1 1/tau -g/l_eff ((-K_motor*Kp)/(tau*l_eff))+((-g)/(tau*l_eff)) ((-K_motor*Ki)/(tau*l_eff))]
Hs_n = s*(s^2 - (g/l_eff))*(s+(1/tau))
Hs_d = 1*s^4 + (1/tau)*s^3 + (-g/l_eff)*s^2 + ((-K_motor*Kp)/(tau*l_eff))+((-g)/(tau*l_eff))*s + ((-K_motor*Ki)/(tau*l_eff))
Hs = Hs_n/Hs_d
poles(Hs)