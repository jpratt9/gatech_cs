function greenScreen(image1,image2,color)

img1 = imread(image1);
img1r = img1(:,:,1);
img1g = img1(:,:,2);
img1b = img1(:,:,3);

img2 = imread(image2);
img2r = img2(:,:,1);
img2g = img2(:,:,2);
img2b = img2(:,:,3);


mask = img1r == color(1) & img1g == color(2) & img1b == color(3);

img1r(mask) = img2r(mask);
img1g(mask) = img2g(mask);
img1b(mask) = img2b(mask);

imwrite(cat(3,img1r,img1g,img1b), [image1(1:end-4) '_new.png']);

end