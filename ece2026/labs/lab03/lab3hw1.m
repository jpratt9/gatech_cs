clear; clc

testingBeat.fc = 900;
testingBeat.fDelt = 40;
testingBeat.phic = 0;
testingBeat.phiDelt = pi/4;
testingBeat.Amp = 66;
testingBeat.t1 = 0;
testingBeat.t2 = 4.04;

testingBeat = sum2BeatStruct(testingBeat);
fs = 4000;

tt = testingBeat.times;
xx = testingBeat.values;
plot(tt,xx);
axis([0,0.025,-66,66]);
xlabel('t (sec)');
ylabel('b(t)');
title('4.1a: Plot of b(t) over approximately one period');

figure;
plotspec(testingBeat.values+j*1e-12,fs,256); grid on, shg