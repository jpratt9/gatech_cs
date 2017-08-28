function dragonrend(image)
img = imread(image);
red = img(:,:,1);
blu = img(:,:,2);
gre = img(:,:,3);
dragon = red == 200 & blu == 200 & gre == 200;
skycolor = [img(2,2,1), img(2,2,2), img(2,2,3)];

red(dragon) = skycolor(1);
blu(dragon) = skycolor(2);
gre(dragon) = skycolor(3);

img = cat(3,red,blu,gre);
imwrite(img,[image(1:end-4) '_dragonrended.png']);

end