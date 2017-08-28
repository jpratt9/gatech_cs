lighthouse = imread('lighthouse.png');
imshow(lighthouse(1:2:end,1:2:end));
title('down-sampled lighthouse');
figure;
imshow(lighthouse);
title('normal lighthouse');

figure;
grass = imread('grass.png');
grass = (grass(:,:,1)+grass(:,:,2)+grass(:,:,3))/3;
imshow(grass(1:2:end,1:2:end));
title('down-sampled grass');
figure;
imshow(grass);
title('normal grass');