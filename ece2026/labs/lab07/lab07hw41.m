%%Lab07 HW 1
%John Pratt

clear; clc;
nn = 1:159;
xn = 255*(rem(nn,30)>19);
yn = conv(xn,[1,-1]);
subplot(2,1,1);
stem(nn,xn);
title('Plot of x[n]')
xlabel('n');
ylabel('x[n]');
subplot(2,1,2);
stem(1:length(yn),yn);
title('Plot of y[n]')
xlabel('n');
ylabel('y[n]');

dn = zeros(1,length(yn));
dn(abs(yn) > 200) = 1;
figure;
stem(1:length(dn),dn);
title('Stem plot of edges of d[n]');
ylabel('Edges of d[n]');
xlabel('n');