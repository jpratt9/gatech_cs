function area = shoelace(xcoords, ycoords)
%SHOELACE Computes the area of a polygon bounded by the inputted x and y
%coordinates
%   Uses the shoelace theorem to compute such an area.

%   First we must 'wrap' the coordinates so that the function actually
%   evaluates the area of the polygon whose vertices are points described
%   by xcoords and ycoords.
xcoords = [xcoords xcoords(1)];
ycoords = [ycoords ycoords(1)];

%   sum1 is the summation of the product of each x term with each 
%   subsequent y term (i.e., x1*y1, x2*y3, etc) going from first x 
%   to second to last x, and second y to last y.

%   Because we are working with vectors, we can simply use a dot product
%   of these portions of the coordinate vectors to get this first sum.
sum1 = dot(xcoords(1:end-1), ycoords(2:end));

%   sum2 is the summation of the product of each x term with each
%   subsequent y term (i.e., x1*y1, x2*y3, etc) going from second x 
%   to last x, and first y to second to last y.
sum2 = dot(xcoords(2:end), ycoords(1:end-1));

%   Finally, the actual area is half of the difference between these two
%   sums.
area = abs((sum1 - sum2))/2;
end