clear; clc;
Ts = 0.3e-3; %- Sampling period = 3 msec
fsamp = 1/Ts; %- Sampling rate
tt = 0:1/fsamp:0.3;
DTMFsig = cos(2*pi*770*tt+rand(1)) + cos(2*pi*1336*tt+rand(1)); %- Use random phases
xx = zeros(1,round(2/Ts)); %- pre-allocate vector to hold DTMF signals
n1 = round(0.6/Ts); n2 = n1+length(DTMFsig)-1;
xx(n1:n2) = xx(n1:n2) + DTMFsig;
soundsc(xx,fsamp); %- Optional: Listen to a single DTMF signal
s(xx,fsamp); grid on %- View its spectrogram
