function [] = redApple(in,out)
img = imread(in);
img = img(:,:,[2 1 3]);
imwrite(img,out);
end