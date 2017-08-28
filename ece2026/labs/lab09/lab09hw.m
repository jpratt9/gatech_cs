%%%John Pratt
%%%Lab HW #9
%%%Section L05
%%%Rec: Prof. Zhang
%%%Lecture: 11 AM
%%%02-Apr-2015
%%%HW Grader: K. Xu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% a) 
clear;
clc;
Fs = 10000;
F = [0.6*pi 0.64*pi]/(2*pi)*Fs;
A = [1 0];
DEV = [0.05 0.01];
[M,Fo,Ao,W] = firpmord(F,A,DEV,Fs);
bk = firpm(M+2,Fo,Ao,W);

ww = 0:1/Fs:pi;
HH = freqz(bk,1,ww);
stem(0:M+2,bk);
grid on;
title('Impulse response');
xlabel('Samples');
ylabel('Amplitude');

figure;
plot(ww,abs(HH));
grid on;
axis([0,pi,0 1.1]);

figure;
plot(ww, abs(HH));
grid on;
axis([0, 0.6*pi,0.95,1.05]);

figure;
plot(ww, abs(HH));
grid on;
axis([0.64*pi,pi,0,0.01]);

figure;
plot(ww,angle(HH));
grid on;
axis([0 0.17 -pi pi]);
slope = (-pi - pi)/(0.085 - -0.085);