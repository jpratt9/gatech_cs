load('echart.mat')
bdiffh = [1, -1];
m = 65;
yy1 = conv(echart(m,:), bdiffh);
subplot(2,1,1);
imshow(echart);
subplot(2,1,2);
imshow(yy1);
find(yy1 == 255)