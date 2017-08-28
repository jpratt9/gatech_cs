clear; clc;
fs = 8000;
tt = 0:1/fs:4.1;
%silence
silence = 0*(0:1/fs:0.1);
xx = [];
%begin notes
for n = [0,2,4,5,7,9,11,12]
   [x, ~] = key2sinus(40+n, 1, 0, fs, 0.4);
   xx = [xx, silence, x(2:end-1)];
end
%final silence
xx = [xx, silence];
plotspec(xx,fs); 
colormap gray 
figure;
plot(tt,xx);
sound = audioplayer(xx,fs);
play(sound);