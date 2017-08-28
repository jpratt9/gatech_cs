th = linspace(0,2*pi,100);
r = 4;
x = r .* cos(th);
y = r .* sin(th);
z = th;
plot3(x,y,z);
axis([-10 10 -10 10 -10 10]);