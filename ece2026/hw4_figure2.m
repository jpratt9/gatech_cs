clear; clc;
hold off;
hold on;
axis([-50,50,-0.1,0.5]);

tt1 = [-40.5, -40.5];
tt2 = [40.5, 40.5];
tt3 = [-13.5, -13.5];
tt4 = [13.5, 13.5];

xx1 = [0, 1/8];
xx2 = [0, 1/8];
xx3 = [0, 3/8];
xx4 = [0, 3/8];

X1 = plot(tt1,xx1,'r-');
X2 = plot(tt2,xx2,'g-');
X3 = plot(tt3,xx3,'b-');
X4 = plot(tt4,xx4,'y-');

xlabel('f (Hz)');
legend('1/8','1/8','3/8','3/8');
title('Spectrogram of x(t) = (cos(27*pi*t))^3');

plot([-90,90],[0,0],'k-')
plot([0,0],[-0.1,0.5],'k-')