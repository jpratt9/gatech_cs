clear;
clc;

[xx, fs, nbits] = wavread('threevotes.wav');
totaltime = length(xx)/fs;
tt = 0:1/fs:totaltime;

plotting_tt = tt(tt>=0.25 & tt<=0.5);
plotting_xx = xx(tt>=0.25 & tt<=0.5)';

plot(plotting_tt,plotting_xx)

xh = 0.5 .* xx;
Lxh = length(xh);
xhReversed = xh(Lxh:-1:1); % figure out how to fill in those ??s
wavwrite(xhReversed , fs , 'ECE2026lab01outRev.wav');
