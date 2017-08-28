clear
clc
close all

target = 100001;
ndx = 1;
increments = linspace(10,1000000,10);
for sizes = increments
space = randi(100000,1,sizes);
%make sure only one end and it's in the last spot
space = sort(space);
space(sizes) = target;

tic;s1_target(ndx) = seqSearch(space,target);toc;
tic;s3_target(ndx) = binSearch(space,target);toc;
ndx = ndx + 1;

end