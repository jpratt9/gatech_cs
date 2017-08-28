mySig.freq = 2; %-- (in hertz)
mySig.complexAmp = 5*exp(1j*pi/4);
dur = 2;
start = -1;
dt = 1/(32*mySig.freq);
mySigWithVals = makeCosVals(mySig,dur,start,dt);
plot(mySigWithVals.times, mySigWithVals.values);