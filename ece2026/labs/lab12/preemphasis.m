clear; clc;
[catsdogs, fs] = audioread('catsdogs.wav');
ww = 0:1/fs:pi;
H = freqz([1, -1],1,ww);
plot(ww,abs(H));

soundsc(catsdogs);
catsdogsfixed = catsdogs
catsdogsfixed(2:end) = catsdogs(1:end-1) - catsdogs(2:end);