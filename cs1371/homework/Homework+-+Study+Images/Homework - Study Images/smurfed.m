function [] = smurfed(in)
[~, out] = strtok(in(end:-1:1),'.');
out = [out(end:-1:2) '_smurf.png'];
img = imread(in);
white = img(:,:,1) == 255 & img(:,:,1) == img(:,:,2) & img(:,:,1) == img(:,:,3);

[r, c, ~] = size(img);

newr = zeros(r, c);
oldr = img(:,:,1);
newr(white) = oldr(white);
newr(~white) = oldr(~white) ./ 3;

newg = zeros(r, c);
oldg = img(:,:,2);
newg(white) = oldg(white);
newg(~white) = oldg(~white) ./ 3;
img = cat(3, newr, newg, img(:,:,3));
imwrite(img,out);

end