clear; clc;
syms z;
r = 0.9;
t = pi/3;
zero1 = solve(1-(r^-1)*(exp(j*-t))*(z^-1)==0,z)
pole1 = solve(1-(r)*(exp(j*-t))*(z^-1)==0,z)
B = simplify((1-(r^-1)*(exp(j*t))*(z^-1))*(1-(r^-1)*(exp(j*-t))*(z^-1)))
A = simplify((1-(r)*(exp(j*t))*(z^-1))*(1-(r)*(exp(j*-t))*(z^-1)))