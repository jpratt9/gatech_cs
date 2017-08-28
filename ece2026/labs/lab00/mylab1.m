tt = -5 : 0.01 : 10;
xx = cos( 0.5*pi*tt );
zz = 0.6*exp(-j*pi/4)*exp(j*0.5*pi*tt);
%
%<-- plot the real part, which is a sinusoid
plot( tt, xx, 'b-', tt, real(zz), 'r--' ), grid on
title('Test Plot of a TWO sinusoids')
xlabel('Time (sec)')

%The plot of real(zz) is a sinusoid because it evaluates the  real part of
%zz, which gives complex numbers which can be translated to the form 
% cos(t) + j*sin(t), so it extracts the real part (cosine)
% A = 0.6
% phi = 
