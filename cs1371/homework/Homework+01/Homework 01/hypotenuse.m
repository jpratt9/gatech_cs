function [ hypotenuseC ] = hypotenuse( sideA, sideB )
%   Returns the length of the hypotenuse of a right triangle with inputted
%   leg lengths

%   Hypotenuse length is equal to the radical of the sum of the squares of
%   the leg (shorter side) lengths
    hypotenuseC = sqrt(sideA^2 + sideB^2);
end

