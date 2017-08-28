function out = kaleidoscope(image, instructions)
img = double(imread(image));
fh = fopen(instructions,'r');
line = ' ';
while ischar(line) && ~isempty(line)
    line = fgetl(fh);
    [first, rest] = strtok(line);
    switch first
        case 'Rotate'
            img = rotate(rest, img);
        case 'Swap'
            img = swap(rest, img);
        case 'Negate'
            img = negate(rest, img);
        case 'Grayscale'
            img = grayscale(rest, img);
        case 'Multiply'
            img = multiply(img);
    end
end
fclose(fh);
out = uint8(round(img));

end

function rotated = rotate(instructs, myimg)
q1 = myimg(1:end/2,1:end/2,:);
q2 = myimg(1:end/2,end/2+1:end,:);
q3 = myimg(end/2+1:end,1:end/2,:);
q4 = myimg(end/2+1:end,end/2+1:end,:);
len = length(instructs);
switch str2double(instructs(3)) %use composite reflections (transpose and flip) to do rotations
    case 1
        q1r = q1(:,:,1);
        q1g = q1(:,:,2);
        q1b = q1(:,:,3);
        switch len
            case 6 %cw
                q1r = q1r';
                q1g = q1g';
                q1b = q1b';
                q1r = q1r(:,end:-1:1);
                q1g = q1g(:,end:-1:1);
                q1b = q1b(:,end:-1:1);
            case 7 %ccw
                q1r = q1r(:,end:-1:1)';
                q1g = q1g(:,end:-1:1)';
                q1b = q1b(:,end:-1:1)';
        end
        q1 = cat(3,q1r,q1g,q1b);
    case 2
        q2r = q2(:,:,1);
        q2g = q2(:,:,2);
        q2b = q2(:,:,3);
        switch len
            case 6 %cw
                q2r = q2r';
                q2g = q2g';
                q2b = q2b';
                q2r = q2r(:,end:-1:1);
                q2g = q2g(:,end:-1:1);
                q2b = q2b(:,end:-1:1);
            case 7 %ccw
                q2r = q2r(:,end:-1:1)';
                q2g = q2g(:,end:-1:1)';
                q2b = q2b(:,end:-1:1)';
        end
        q2 = cat(3,q2r,q2g,q2b);
    case 3
        q3r = q3(:,:,1);
        q3g = q3(:,:,2);
        q3b = q3(:,:,3);
        switch len
            case 6 %cw
                q3r = q3r';
                q3g = q3g';
                q3b = q3b';
                q3r = q3r(:,end:-1:1);
                q3g = q3g(:,end:-1:1);
                q3b = q3b(:,end:-1:1);
            case 7 %ccw
                q3r = q3r(:,end:-1:1)';
                q3g = q3g(:,end:-1:1)';
                q3b = q3b(:,end:-1:1)';
        end
        q3 = cat(3,q3r,q3g,q3b);
    case 4
        q4r = q4(:,:,1);
        q4g = q4(:,:,2);
        q4b = q4(:,:,3);
        switch len
            case 6 %cw
                q4r = q4r';
                q4g = q4g';
                q4b = q4b';
                q4r = q4r(:,end:-1:1);
                q4g = q4g(:,end:-1:1);
                q4b = q4b(:,end:-1:1);
            case 7 %ccw
                q4r = q4r(:,end:-1:1)';
                q4g = q4g(:,end:-1:1)';
                q4b = q4b(:,end:-1:1)';
                
        end
        q4 = cat(3,q4r,q4g,q4b);
end
rotated = [q1, q2; q3, q4];
end

function swapped = swap(instructs, myimg)
q1 = myimg(1:end/2,1:end/2,:);
q2 = myimg(1:end/2,end/2+1:end,:);
q3 = myimg(end/2+1:end,1:end/2,:);
q4 = myimg(end/2+1:end,end/2+1:end,:);

switch str2double(instructs(end))
    case 1
        switch str2double(instructs(end-3))
            case 2
                myimg = [q2, q1; q3, q4];
            case 3
                myimg = [q3, q2; q1, q4];
            case 4
                myimg = [q4, q2; q3, q1];
        end
    case 2
        switch str2double(instructs(end-3))
            case 1
                myimg = [q2, q1; q3, q4];
            case 3
                myimg = [q1, q3; q2, q4];
            case 4
                myimg = [q1, q4; q3, q2];
        end
    case 3
        switch str2double(instructs(end-3))
            case 1
                myimg = [q3, q2; q1, q4];
            case 2
                myimg = [q1, q3; q2, q4];
            case 4
                myimg = [q1, q2; q4, q3];
        end
    case 4
        switch str2double(instructs(end-3))
            case 1
                myimg = [q4, q2; q3, q1];
            case 2
                myimg = [q1, q4; q3, q2];
            case 3
                myimg = [q1, q2; q4, q3];
        end
end
swapped = myimg;
end

function negative = negate(instructs, myimg)
switch str2double(instructs(end))
    case 1
        myimg(1:end/2,1:end/2,:) = 255 - myimg(1:end/2,1:end/2,:);
    case 2
        myimg(1:end/2,end/2+1:end,:) = 255 - myimg(1:end/2,end/2+1:end,:);
    case 3
        myimg(end/2+1:end,1:end/2,:) = 255 - myimg(end/2+1:end,1:end/2,:);
    case 4
        myimg(end/2+1:end,end/2+1:end,:) = 255 - myimg(end/2+1:end,end/2+1:end,:);
end
negative = myimg;
end

function grayscaled = grayscale(instructs, myimg)
grays = (myimg(:,:,1) + myimg(:,:,2) + myimg(:,:,3)) ./ 3;
grays = cat(3, grays, grays, grays);
switch str2double(instructs(end))
    case 1
        myimg(1:end/2,1:end/2,:) = grays(1:end/2,1:end/2,:);
    case 2
        myimg(1:end/2,end/2+1:end,:) = grays(1:end/2,end/2+1:end,:);
    case 3
        myimg(end/2+1:end,1:end/2,:) = grays(end/2+1:end,1:end/2,:);
    case 4
        myimg(end/2+1:end,end/2+1:end,:) = grays(end/2+1:end,end/2+1:end,:);
end
grayscaled = myimg;
end

function multiplied = multiply(myimg)
[r, c, ~] = size(myimg);
newrows = round(linspace(1,r,r/2));
newcols = round(linspace(1,c,c/2));
myimg = myimg(newrows,newcols,:);
multiplied = [myimg, myimg; myimg, myimg];
end