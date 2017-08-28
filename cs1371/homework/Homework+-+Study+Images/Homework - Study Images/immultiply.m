function out = immultiply(fn)
img = imread(fn);
[r, c, layer] = size(img);
new_cind = round(linspace(1,c,round(c / 2)));
new_rind = round(linspace(1,r,round(r / 2)));
out = img(new_rind,new_cind, :);
out = [out out; out out];

end