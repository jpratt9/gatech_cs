%write explanation comments later - talk about 
function [ vortex_array ] = vectorVortex( n, m, vect )
%UNTITLED3 Creates a vector vortex (VORTEX_ARRAY) of given dimensions NxM
%given a vector of numbers, VECT.  It is assumed that the NxM matrix will
%be large enough to encompass all elements in VECT.

%   Start by creating an array of zeros of dimensions NxM, since all
%   'unused' slots in VORTEX_ARRAY should have a value of zero.
vortex_array = zeros(n,m);

%Outer portion
%There isn't a very easy way to explain the logic that went behind this
%other than thinking about it in terms of a rectangle divided up into square
%quadrants of equal areas. If we take the squares on the exterior of this
%rectangle, we see that the top part of said rectangle will be lined with m
%squares, so we go from elements 1 to m in VECT to achieve this.
vortex_array(1, 1:m)        =   vect(1:m);

%Continuing, we simply move from the second to top row of the squares down
%to the bottom row to create the right side, then the second to last
%collumn to the first collumn in the last row to create the bottom row.
vortex_array(2:n, m)        =   vect(m+1:(m+n-1));
vortex_array(n, m-1:-1:1)   =   vect(m+n:2*m+n-2);

%Finally, we move from the second to last row to the second row to create
%the left collumn.
vortex_array(n-1:-1:2, 1)   =   vect(2*m+n-1:2*m+2*n-4);

%Inner portion
%Use the same logic, but shifted 'inwards' by 2 squares to create the inner
%vortex of VORTEX_ARRAY
vortex_array(3, 3:m-2)      =   vect(2*m+2*n-3:3*m+2*n-8);
vortex_array(4:n-2, m-2)    =   vect(3*m+2*n-7:3*m+3*n-13);
vortex_array(n-2, m-3:-1:3) =   vect(3*m+3*n-12:4*m+3*n-18);
vortex_array(n-3:-1:4, 3)   =   vect(4*m+3*n-17:end);
end