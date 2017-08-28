function [xx, tt] = fullWaveRectifiedSinusoid(amp,T,fs,tStop)
%{
fs = 1000;
T = 1;
amp = 1;
tStop = 5;
%}

tt=0:(1/fs):tStop;
xx=amp*abs(sin(2*pi*tt/T));

plotspec(xx+1j*1e-13,fs,fs*5);

end