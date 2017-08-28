fs=8000; tt=0:1/fs:0.5; yy=cos(1600*pi*tt); plotspec(yy,fs,1024); colorbar
figure;
plotspec(yy+j*1e-9,fs,1024); colorbar
figure;
plotspec(yy+j*1e-9,fs,128); colorbar
