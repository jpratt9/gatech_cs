clear
clc
close all
 
t =[ 0.04 0.93 2.32 2.58 3.63 4.67 5.89 7.33 8.3 8.56 9.89 11.02 ...
	11.91 13.15 14.12 14.79 15.93 16.51 18.48 18.66 19.60 ];
v =[ 2.24 1.88 2.29 1.59 2.45 2.1 0.24 1.72 1.05 1.74 2.58 ...
	3.94 3.33 4.76 3.46 4.08 3.73 3.07 3.15 2.8 1.81 ];

plot(t, v, 'ro')
xlabel('time (sec)');
%ylabel('velocity');  removed after adding distance to the plot
title('Bat');
hold on

ts = linspace(t(1) - 0.5, t(end)+0.5, 500);
vi = interp1(t,v, ts);
plot(ts,vi, 'b');
vs = spline(t,v, ts);
plot(ts, vs, 'g--');

degree = 3;
coeff = polyfit(t,v, degree);
% -0.0040x^3 + 0.1170x^2 + -0.7682x + 2.793
vp = polyval(coeff, ts);
plot(ts, vp, 'm');

%get the distance travelled by ryan's bat
%that's just the area under the curve or the integral

d = cumtrapz(t,v)/10; %d = distance
plot(t,d, 'b--');

%acceleration
%two ways to do this based on what we have above
%use the real data (v,t) and compute dv/dt
%or use the polynomial (coefficients) from polyfit and take the derivative

acc = diff(v)./diff(t)
plot (t(2:end), acc, 'k');

coeff2 = (degree:-1:1) .* coeff(1:end-1);
acc2 = polyval(coeff2, ts);
plot(ts,acc2, 'r');

grid on
legend( {'raw data', ...
        'linear interp', ...
        'spline', ...
        'cubic fit', ...
        'displacement/10 (scaled)', ...
        'dv/dt (acceleration)', ...
        'derived accelaration', ...
        });
    title ('Fake Bat Data');
        




