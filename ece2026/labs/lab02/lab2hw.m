clear;clc;
freq = 30e6;
fs=freq*1000;
dt=100;
dr=40;

t1 = (1/(3e8))*dt;
t2 = (1/(3e8))*(dr+sqrt(dt^2+(-dr)^2));
t = 0:1/fs:3/freq;
s = cos(2*pi*freq*(t-t1)) + cos(2*pi*freq*(t-t2));
plot(t,s); grid on