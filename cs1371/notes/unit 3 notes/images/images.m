clear
clc
close all

%{
r g b
0 0 0 (black)
255 255 255 (white)
128 128 128 (gray)
%}

cimg = imread('ncstate.png');
caged = cimg;
imshow(cimg)

[r c layer] = size(cimg)

%{
figure;
%put the wp in a cage
for x = 1:c
    if mod(x, 15) == 0  %display a bar every 15 pixels. 
        caged(:,x:x+4, :) = 255;  %set all layers to white
    end
end
imshow(caged)

%stretching and shrinking (must know)
%basic formula: new_ind = round(linspace(1,N,N* scalefactor));

new_cind = round(linspace(1,c,c * 3));
new_rind = round(linspace(1,r,r * 3));
stretchedx3 = cimg(new_rind,new_cind, :);
figure
imshow(stretchedx3)

new_cind = round(linspace(1,c,c / 3));
new_rind = round(linspace(1,r,r / 3));
shrinkx3 = cimg(new_rind,new_cind, :);
figure
imshow(shrinkx3)

%rotate the image - use transpose
%you can't transpose the whole thing at once
%do layers individually
%transpose_img(:,:,1) = img(:,:,1)';
%transpose_img(:,:,2) = img(:,:,2)';
%transpose_img(:,:,3) = img(:,:,3)';
% can't do this as well b/c other layers are not uniform: 
%cimg(:,:,1) = cimg(:,:,1)';
%}
figure;
rotated = cimg;
%{
for loop = 1:50
    clearvars cmgT
    cmgT(:,:,1) = rotated(:,:,1)';
    cmgT(:,:,2) = rotated(:,:,2)';
    cmgT(:,:,3) = rotated(:,:,3)';
    rotated = cmgT;
    rotated = rotated(:, end:-1:1, :);
    imshow(rotated)
    
    
    
    [r c l] = size(rotated);
    new_cind = round(linspace(1,c,c/1.2));
    new_rind = round(linspace(1,r,r/1.2));   
    rotated = rotated(new_rind, new_cind, :);
    pause(0.2)
end
%}

%{
recoloring by swapping layers
swapped = cimg(:,:,[3 2 1]);
imshow(swapped);
%}


%making a negative image
swapped = 255 - cimg(:,:,:);
imshow(swapped);

warhol = [cimg, swapped]; %concat images horizontally
imshow(warhol);

warhol2 = [cimg; swapped]; %concat images vertically
imshow(warhol2);

imwrite(warhol,'wptwin.jpg');

newimg = imread('underwater.jpg');

q1 = newimg(1:round(end/2),1:round(end/2),:);
q2 = newimg(1:round(end/2),round(end/2)+1:end,:);
q3 = newimg(round(end/2)+1:end,1:round(end/2),:);
q4 = newimg(round(end/2)+1:end,round(end/2)+1:end,:);
rearranged = [q4,q2;q3,q1];
imshow(rearranged);