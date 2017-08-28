myLFMsig.f1 = 200;
myLFMsig.t1 = 0; myLFMsig.t2 = 1.5;
myLFMsig.slope = 1800;
myLFMsig.complexAmp = 10*exp(1j*0.3*pi);
dt = 1/8000; % 8000 samples per sec is the sample rate
outLFMsig = makeLFMvals(myLFMsig,dt);
%- Plot the values in outLFMsig
%- Make a spectrogram for outLFMsig to see the linear frequency change

plotspec(outLFMsig.values+j*1e-12,1/dt,256); grid on;shg
soundsc(outLFMsig.values,8000);