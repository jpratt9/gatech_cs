tt = 0:1/4000:2;
xx = 2*cos(2*pi*800*tt + 1000*cos(2*pi*1.5*tt + 0));
plotspec(xx+j*1e-12,4000,128);