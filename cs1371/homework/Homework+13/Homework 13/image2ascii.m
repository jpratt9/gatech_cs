function image2ascii(image, ascii)
%Converts an IMAGE to ascii art given corresponding ASCII characters to use
I = double(imread(image));

%split image into rgb components
Ir = I(:,:,1);
Ig = I(:,:,2);
Ib = I(:,:,3);

I = (Ir + Ig + Ib) ./ 3; %translates rgb values into intensities
r = size(I,1)/8;
c = size(I,2)/4;
I = mat2cell(I,8.*ones(1,r),4.*ones(1,c)); %turn array into cell array with 8x4 cells
fh = fopen([image(1:end-4) '.txt'],'w'); %create new text file
line = '';
for x = 1:r
    for y = 1:c
        %add 1 to average intensity of cell, round that, divide that by 32,
        %then ceil result to get corresponding character
        temp = ascii(  ceil((round(mean(mean(I{x,y})))+1)/32) ); 
        line = [line temp]; %append current character to 
    end
    line = [line '\n']; %reaching the end of the line means starting a new one
end
fprintf(fh,line);
fclose(fh);
end