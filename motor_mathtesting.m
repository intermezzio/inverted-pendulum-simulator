clear all
close all
syms s K tau omega t
Hs = (K/tau)/(s+(1/tau)) %Hs = Vs/Ms
Ms = (omega)/(s^2+omega^2)
Vs = Ms*Hs
Vt = ilaplace(Vs)
% pretty(Vt)
Vt_steady = (K/(omega^2*tau^2+1))*(sin(omega*t)-omega*tau*cos(omega*t))
pretty(Vt_steady)
pretty(Vs)
Vtsubs = subs(Vt, [K, omega, tau], [1/400, 4.19, 1/14])
ezplot(Vtsubs, 0, 20)
hold on
Vtsubs_steady = subs(Vt_steady, [K, omega, tau], [1/400, 4.19, 1/14])
ezplot(Vtsubs_steady, 0, 20)