n=4;
xpix = ones(256,1)*cos(2*pi*(0:255)/32);
show_img(xpix);
figure;
wd = 2*pi*2/32; xpix2 = ones(256,1)*cos(wd*(0:255));
show_img(xpix2);
figure;
wd = 2*pi*14/32; xpix14 = ones(256,1)*cos(wd*(0:255));
show_img(xpix14);

figure;
subplot(2,2,1);
imshow(xpix2);
subplot(2,2,2);
imshow(xpix14);
subplot(2,2,3);
imshow(xpix2(1:2:end,1:2:end));
subplot(2,2,4);
imshow(xpix14(1:2:end,1:2:end));