clear; clc;
amps = ones(1,7);
%for frequencies, it's easiest to simply express them relative to the
%frequency of middle A4 - 440 Hz
%use anonymous function instead of writing a seperate one:
freqKey = @(keynum) 440*2.^((keynum-49)/12); 
freqs = freqKey([45, 49, 52, 57, 52, 49, 45]);
phases = zeros(1,7);
fs = 4000;
tStart = 0.25*(0:6);
durs = [[0.2 0.2 0.2] 2.4-tStart(4:7)];

%all of the following code is copied directly from sinusoid_adding.m
maxTime = max(tStart+durs) + 0.1; %-- Add time to show signal ending
durLengthEstimate = ceil(maxTime*fs);
tt = (0:durLengthEstimate)*(1/fs); %-- be conservative (add one)
xx = 0*tt; %--make a vector of zeros to hold the total signal
for kk = 1:length(amps)
    nStart = tStart(kk)*fs+1; %-- add one to avoid zero index
    xNew = shortSinus(amps(kk), freqs(kk), phases(kk), fs, durs(kk));
    Lnew = length(xNew);
    nStop = (tStart(kk)+durs(kk))*fs+1; %<========= Add code
    xx(nStart:nStop) = xx(nStart:nStop) + xNew;
end
plotspec(xx,fs,256); grid on