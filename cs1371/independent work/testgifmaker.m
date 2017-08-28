figure(1)
filename = 'implying.gif';
A = imread('testimage.png');
for n = 0:5:360
    imshow(imrotate(A,n));
    drawnow
    frame = getframe(1);
    im = frame2im(frame);
    [imind,cm] = rgb2ind(im,256);
    if n == 0;
        imwrite(imind,cm,filename,'gif', 'Loopcount',inf);
    else
        imwrite(imind,cm,filename,'gif','WriteMode','append');
    end
end