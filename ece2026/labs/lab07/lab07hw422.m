%%OFFv3
%John Pratt

clear; clc;
I = imread('OFF v3.png');
imshow(I);
xn = I(floor(end/2),:);

figure;
yn = firfilt([1,-1],double(xn));
subplot(2,1,1);
stem(1:length(xn),xn);
title('Plot of x[n]');
xlabel('n');
ylabel('x[n]');
subplot(2,1,2);
stem(1:length(yn),yn);
title('Plot of y[n]');
xlabel('n');
ylabel('y[n]');

threshold = 200;
dn = zeros(1,length(yn));
dn(abs(yn) > threshold) = 1;
ln = find(dn);
figure;
subplot(2,1,1);
stem(1:length(ln),ln);
title('Plot of location signal, l[n]');
xlabel('n');
ylabel('l[n]');

delta = firfilt([1,-1],double(ln));
%ignores the black suiggly lines at the beginning and end of the image 
%(since they're meaningless)
delta = delta(5:end-4);
subplot(2,1,2);
stem(1:length(delta),delta);
title('Plot of delta[n]');
xlabel('n');
ylabel('delta[n]');

theta_1 = sum(delta)/95;
scaledDelta = round(delta/theta_1);
figure;
stem(1:length(scaledDelta),scaledDelta);
title('Plot of location signal, roundedDelta[n]');
xlabel('n');
ylabel('roundedDelta[n]');

decoded2 = decodeUPC(scaledDelta);