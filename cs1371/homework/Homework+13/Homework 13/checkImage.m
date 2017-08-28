function [comparison] = checkImage(image1,image2)
img1 = imread(image1);
img2 = imread(image2);
[r, c, ~] = size(img1);
if any(size(img1) ~= size(img2))
    comparison = 'The images have different dimensions.';
else
    same = img1(:,:,1) == img2(:,:,1) & img1(:,:,2) == img2(:,:,2) & img1(:,:,3) == img2(:,:,3);
    if all(all(same))
        comparison = 'The images are the same.';
    else
        fn = [image1(1:end-4) '_vs_' image2];
        diffs = zeros(r,c);
        diffs(same) = 255;
        diffs = uint8(cat(3,diffs,diffs,diffs));
        imwrite(diffs,fn);
        comparison = sprintf('The RBG values are different: see %s.',fn);
    end
end
end