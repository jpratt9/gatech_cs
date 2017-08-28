function [ positive_root, negative_root] = quad( A, B, C )
% QUAD returns the roots of a quadratic function 

% The discriminant of a quadratic function is the radical of the sum
% of the square of the second coefficient and product of -4 and the first
% and third coefficients of the function.
discriminant  = sqrt(B^2 - 4*A*C);

% The positive root of a quadratic function is equal to the sum of the
% opposite of the second coefficient and the discriminant divided by twice
% the second coefficient.

positive_root = (-B + discriminant)/(2*A);

% The negative root of a quadratic function is equal to the sum of the
% opposite of the second coefficient and the opposite of the discriminant 
% divided by twice the second coefficient.
negative_root = (-B - discriminant)/(2*A);

end

