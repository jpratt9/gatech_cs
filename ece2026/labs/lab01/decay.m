clear;
clc;

xDecay = myDecayingSinusoi(3.817, 0.6, 2*pi*250, pi/4, 500, 0, 2);
ts = 0:1/500:2;
plot(ts,xDecay);
figure;

Lx = length(xDecay);
xDecayReversed = xDecay(Lx:-1:1);
plot(ts, xDecayReversed);