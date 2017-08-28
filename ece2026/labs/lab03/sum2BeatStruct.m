function sigBeatSum = sum2BeatStruct( sigBeatIn )
%
%--- Assume the five basic fields are present, plus the starting and ending times
%--- Add the four fields for the parameters in Equation (4)
%
% sigBeatSum.f1, sigBeatSum.f2, sigBeatSum.X1, sigBeatSum.X2
sigBeatSum = sigBeatIn;

sigBeatSum.f1 = sigBeatIn.fc - sigBeatIn.fDelt;
sigBeatSum.f2 = sigBeatIn.fc + sigBeatIn.fDelt;
phi1 = sigBeatIn.phic + sigBeatIn.phiDelt;
phi2 = sigBeatIn.phic - sigBeatIn.phiDelt;
sigBeatSum.X1 = (sigBeatIn.Amp/2)*exp(1j*phi1);
sigBeatSum.X2 = (sigBeatIn.Amp/2)*exp(1j*phi2);

sigBeatSum.times = sigBeatSum.t1:1/4000:sigBeatSum.t2;
sigBeatSum.values = real((sigBeatSum.X1)*exp(2j*pi*sigBeatSum.f1* ... 
sigBeatSum.times)+(sigBeatSum.X2)*exp(2j*pi*sigBeatSum.f2*sigBeatSum.times));
end