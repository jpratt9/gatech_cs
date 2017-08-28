tt = 0:1/1000:2;
xx = 4*cos(-5*pi*tt+3*pi/4)+6*cos(13*pi*tt-pi/2);
B = -1*min(xx);
plot(tt,xx);
title('4.2: Plot of y(t)=x(t)-B');
xlabel('t (sec)');
ylabel('y(t)');