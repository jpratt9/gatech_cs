function [ positive_root, negative_root ] = findZeroVelocity( A, B, C, D )
%FINDZEROVELOCITY Finds the roots of the derivative quadratic function 
%associated with the inputted coefficients of a cubic.

%   The coefficients of the derivative of a cubic with coefficients 
%   A, B, C, & D are 3A, 2B, and C.  Therefore, we can use these as the
%   parameters of the previously created QUAD function to get the roots cof
%   such a cubic's derivative.
 
[positive_root, negative_root] = quad(3*A, 2*B, C);

end

