ss(1).freq = 15; ss(1).complexAmp = exp(1j*pi/4);
ss(2).freq = 12; ss(2).complexAmp = 2i;
ss(3).freq = 9; ss(3).complexAmp = -4;
%
dur = 1;
tstart = -0.5;
dt = 1/(15*32); %-- use the highest frequency to define delta_t
%
ssOut = addCosVals( ss, dur, tstart, dt );
%
plot( ssOut.times, ssOut.values )
