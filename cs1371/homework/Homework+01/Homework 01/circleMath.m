function [ area, perim ] = circleMath( diameter )
%   Takes the diameter of a circle and outputs the area and circumference of
%   said circle.

%   Area of a circle is equal to the square of half of its diameter
%   multiplied by pi.
    area = (diameter/2)^2 * pi;

%   Perimeter (circumference) of a circle is equal to the product of its
%   diameter and pi.
    perim = diameter * pi;

end

