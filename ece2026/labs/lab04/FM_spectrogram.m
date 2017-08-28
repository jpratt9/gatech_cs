clear; clc;
sigFMexp.Amp =  7.5;
sigFMexp.fc = 500;
sigFMexp.beta = 2.05;
sigFMexp.gamma = 3;
sigFMexp.t1 = 0;
sigFMexp.t2 = 3.04;
fs = 4000;
[xx, tt] = makeFMexpVals(sigFMexp, 1/fs);
plotspec(xx,fs,256); grid on