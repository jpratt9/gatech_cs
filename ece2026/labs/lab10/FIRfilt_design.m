clear;
clc;

Fs = 1/(0.3e-3);
xx = DTMFdial('159D*86A',Fs);

%F = [697 770-6  770+6 852]
%F = [1082 1203 1215 1336]
F = [1477 1627];
A = [0 1];
DEV = [0.01 0.02];
[M,Fo,Ao,W] = firpmord(F,A,DEV,Fs);
bk = firpm(76,Fo,Ao,W);

ww = 0:1/Fs:pi;
HH = freqz(bk,1,ww);
plot(ww,abs(HH));
axis([0 pi 0 1.05])
grid on
transwidth1 = 2*(770-6-697)/Fs;
transwidth2 = 2*(852-770-6)/Fs;
figure;
spectrogram(xx);

figure;
spectrogram(conv(xx,bk));