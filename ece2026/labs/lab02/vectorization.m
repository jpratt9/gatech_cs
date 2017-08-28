clear
clc

%--- make a plot of sum of cosines
dt = 1/800;
XX = rand(1,3).*exp(2i*pi*rand(1,3)); %--Random amplitude and phases
freq = 9;
ccsum = zeros(1,500);
for kx = 1:length(XX)
    kt = 1:500;
    tt = kt*dt;
    Ak = abs(XX(kx));
    phik = angle(XX(kx));
    ccsum(kt) = ccsum(kt) + Ak*cos(2*pi*freq*tt + phik);
end
plot(tt,ccsum) %-- Plot the sum sinusoid
grid on, zoom on, shg

