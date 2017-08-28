jkl = 0 : 6
nnn = 2 : 4 : 17
mmm = 99 : -1 : 88
ttt = 2 : (1/9) : 4 %<--- How many elements in the ttt vector? ANS: 18+1=19
tpi = pi * [ 0:0.1:2 ];


xx = [ zeros(1,3), linspace(0,1,5), ones(1,4) ]
xx(4:6) %returns a vector of elements in index 4-6 of xx (in this case, [2 3 4])
size(xx) %returns the dimensions of xx (in this case, [1 13])
length(xx) %returns the number of elements in xx (13 here)
xx(2:2:length(xx)) %returns all elements in even-numbered indices of xx

yy = xx;
yy(4:6) = exp(1)*(1:3)
xx(2:2:length(xx)) = pi .^ exp(1);  %replace elements in even indices with pi^e

AA = [ 1, 2; 3, 4; 5, 6; 7, 8]
BB = [ 1, 2, 3; 4, 5, 6]
CC = AA * BB
%DD = BB * AA BB * AA fails because BB has a different number of columns
%(3) than AA has rows (4)

nn = 1:9;
qq1 = 7*cos(0.1*pi*nn-pi/2);
qq2 = cos(pi*nn);
qq = qq1 .* qq2
%zz = qq1 * qq2 fails because qq1 has a different number of columns (9)
%than qq2 has rows (1)

xk = cos( pi*(0:11)/4 ); %<---comment: compute cosines
% There are 12 values stored in xk.
% xk(1) is cos(0)=1.
% xk(0) is undefined because indexing starts at 1 in MATLAB.

cc = [ ]; %<--- initialize the cc vector to be empty
for k=-50:50
cc(k+51) = cos( pi*k/30 );
end
plot(cc)
%cc(k+51) must be used because MATLAB indexing starts at 1.
%cc(k) throws an out of bounds error in MATLAB.
%The labels on the x-axis of the plot represent the k-values plus 51,
%ranging from 1 to 101.

clear
clc

k = -50:50;
cc(k+51) = cos(pi.*k./30);