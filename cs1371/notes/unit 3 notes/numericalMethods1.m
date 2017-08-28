clear
clc
close all

x = [0.4 0.9 1.6 3.3 3.8 4.6 5.9 7.3 8.1 9.6];
y = sin(x) + (rand(1, length(x)) - 0.5)/2;

plot(x,y,'k+')
hold on

plot(x,y)

%newy = interp1(xknown, yknown, newx)
newx = linspace(0,10,100);
newy = interp1(x, y, newx);
newy = interp1(x,y, newx, [], 'extrap'); 
%we can extrapolate with interp1 if we add extra params

plot(newx,newy,'g.-')

newys = spline(x,y, newx); %spline lets us extrapolate
plot(newx,newys, 'r:');

legend({'raw', 'implicit', 'interp1', 'spline'})

figure
hold on
color = 'rgbcmk';

% 0x^6 + 0x^5..... + 2x + 5
for degree = 1:6
    coeff = polyfit(x,y,degree);
    newyp = polyval(coeff, newx);
    plot(newx, newyp, [color(degree) '--']);
    pause(1);
end
legend({'1', '2', '3', '4', '5', '6'});
    


