clear; clc;
[ecgsig,fs,fint] = ECGmakeSig15('jpratt9',15);
syms z;
syms z;
r = 0.95;
t = 2*pi*fint/fs;
zero1 = solve(1-(exp(1j*t))*(z^-1)==0,z);
pole1 = solve(1-(r)*(exp(1j*t))*(z^-1)==0,z);
B = simplify((1-(exp(1j*t))*(z^-1))*(1-(exp(1j*-t))*(z^-1)))
A = simplify((1-(r)*(exp(1j*t))*(z^-1))*(1-(r)*(exp(1j*-t))*(z^-1)))

w = 0:2*pi/fs:pi;

B_act = (1-(exp(1j*(t-w)))) .* (1-(exp(1j*(-t-w))));
A_act = (1-(r)*(exp(1j*(t-w)))) .* (1-(r)*(exp(1j*(-t-w))));

figure;
plot(w*fs/(2*pi), abs(B_act ./ A_act));
title('Magnitude of Frequency Response');
ylabel('Magnitude');
xlabel('Analog frequency, f');

figure;
reals_0 = double( real([zero1, conj(zero1)]) );
ims_0 = double( imag([zero1, conj(zero1)]) );
reals_p = double( real([pole1, conj(pole1)]) );
ims_p = double( imag([pole1, conj(pole1)]) );

hold on;
plot(reals_p,ims_p,'bx');
plot(reals_0,ims_0,'go');
plot(cos(0:1/100:2*pi),sin(0:1/100:2*pi),'k')
axis(1.1.*[-1,1,-1,1]);

bcoeffs = [81129638414606681695789005144064 -135552877978140481942229121761280 81129638414606685530551180385625]/81129638414606681695789005144064;
acoeffs = [81129638414606681695789005144064 -128775234079233453341518038302720 73219498669182530117091693391549]/81129638414606681695789005144064;

for n = 1:length(ecgsig)
   if n == 1
       ecgsig_new(n) = -ecgsig(n);
   elseif n == 2
       ecgsig_new(n) = -ecgsig(n)+1.5873*ecgsig_new(n-1);
   else
       ecgsig_new(n) = 1.5873*ecgsig_new(n-1)-0.9025*ecgsig_new(n-2)-ecgsig(n)+1.6708*ecgsig(n-1)-ecgsig(n-2);
   end
end
figure;
subplot(2,1,1);
plot(0:2000,ecgsig(1:2001));
subplot(2,1,2);
plot(0:2000,ecgsig_new(1:2001));

figure;
spectrogram(ecgsig);
title('Unfiltered ECG Signal');
figure;
spectrogram(ecgsig_new);
title('Filtered ECG Signal');