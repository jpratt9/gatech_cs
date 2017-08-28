function [newimg,grays] = colorSplash(file,rgb)
img = double(imread(file));
color = img(:,:,1) == rgb(1) & img(:,:,2) == rgb(2) & img(:,:,3) == rgb(3);

%gray values will be average of RGB values
grays = uint8((img(:,:,1) + img(:,:,2) + img(:,:,3))./3);

red = img(:,:,1);
gre = img(:,:,2);
blu = img(:,:,3);

red(color) = grays(color);
gre(color) = grays(color);
blu(color) = grays(color);

newimg = uint8(cat(3, red, gre, blu));
end