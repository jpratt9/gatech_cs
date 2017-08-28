function him = plotspecDB(xx,fsamp,Lsect,DBrange)
%PLOTSPECDB plot a Spectrogram as an image
% (display magnitude in decibels)
% usage: him = plotspecDB(xx,fsamp,Lsect,DBrange)
% him = handle to the image object
% xx = input signal
% fsamp = sampling rate
% Lsect = section length (integer, power of 2 is a good choice)
% amount of data to Fourier analyze at one time
% DBrange = defines the minimum dB value; max is always 0 dB
dB = 20*log10(xx+10^(-1*DBrange/20));
him = plotspec(dB,fsamp,Lsect);
end