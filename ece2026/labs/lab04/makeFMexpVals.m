function [xx, tt] = makeFMexpVals( sigFMexp, dt )
%{
sigFMexp.Amp; %-- Amplitude
sigFMexp.fc %-- center frequency
sigFMexp.beta %-- FM parameter
sigFMexp.gamma %-- FM parameter
sigFMexp.t1 %-- starting time
sigFMexp.t2 %-- ending time
%}

tt = sigFMexp.t1:dt:sigFMexp.t2;
A = sigFMexp.Amp;
B = sigFMexp.beta;
g = sigFMexp.gamma;
freqc = sigFMexp.fc;
xx = A*cos(2*pi*freqc*tt+(g/B)*exp(B*tt));
end
