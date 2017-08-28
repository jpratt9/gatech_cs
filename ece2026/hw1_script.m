clear
clc

A = 110;
f = 60;

tt = linspace(0,1/60,1000);
xx1 = A*cos(2*pi*f*tt);
xx2 = A*cos(2*pi*f*(tt-1/f/3));
xx3 = A*cos(2*pi*f*(tt-2/f/3));


plot(tt,xx1,'r-',tt,xx2,'g-',tt,xx3,'b-'),grid
legend('PHASE 1', 'PHASE 2', 'PHASE 3');
axis([0,1/60,-110,110]);

title('2.4a:  PLOT OF VOLTAGE OVER ONE PERIOD FOR THREE-PHASE POWER SYSTEM');
xlabel('TIME - phi/(2pi*f) (ms)');
ylabel('VOLTAGE (V)');