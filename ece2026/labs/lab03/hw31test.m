clear; clc;
fs = 8000;
tt = 0:1/fs:2;
xx = cos(2*pi*560*tt)+cos(2*pi*580*tt);
spectrogram(xx,2048*4,[],[],fs,'yaxis'); 
colorbar %spectogram
soundsc(xx,fs); %sound