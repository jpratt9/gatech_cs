clear; clc
fs = 4000;
tt = 0:1/fs:5.04;

aa = cos(1000*pi*tt)+cos(3000*pi*tt);
bb = cos(2*pi*(125*tt.^2+250*tt));
cc = cos( 2*pi*(1000/(3*pi) * sin(3/2*pi*tt+pi/2) + 1000*tt) );
cc1 = cos( sin(2*pi*tt) + 100*pi*tt.^2 + 800*pi*tt );
dd = cos( 2*pi*250*(2/(log(2)))*2.^(0.5*tt) );
ee = cos( 2*pi*(-250*tt.^2 + 1000*tt) );
funcs = [aa; bb; cc; dd; ee];
titles(1).title = 'beat note';
titles(2).title = 'linear-FM';
titles(3).title = 'exponential-FM';
titles(4).title = 'sinusoidal-FM';
titles(5).title = 'aliased linear-FM';

for n = 1:5
    figure;
    plotspec(funcs(n,:)+ 1j*1e-12, fs, 256);
    grid on;
    xlabel('TIME [s]');
    ylabel('FREQUENCY [Hz]');
    title(['Spectrogram of ', titles(n).title, ' sinusoid']);
    colorbar;
end