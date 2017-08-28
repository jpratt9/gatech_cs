function sigOut = makeCosVals( sigIn, dur, tstart, dt )
freq = sigIn.freq;
X = sigIn.complexAmp;
phi = angle(X);
A = abs(X);
tt = tstart: dt : tstart+dur; %-- Create the vector of times
xx = A*cos(2*pi*freq*tt + phi); %-- Vectorize the cosine evaluation
sigOut.times = tt; %-- Put vector of times into the output structure
sigOut.values = xx;%-- Put values into the output structure
end