function extremum = estimateExtremum(x,y)
% Outputs (xmax,ymax) interpolated given (x,y) data

% Method:
%   Find secant line slopes (derivative estimates) and associated x-values
%       (x-midpoints)
%   Interpolate (dy/dx,midpoint-x) points for a dy/dx value of 0 to get the
%       corresponding x-value.
%   Interpolate (x,y) data for the x-value found above for corresponding
%       y-value.
% end

dy = diff(y) ./ diff(x);
xmid = x(1:end-1) + diff(x)./2;
extremum(1) = interp1(dy,xmid,0);
extremum(2) = interp1(x,y,extremum(1));
% Word of warning:  this file and the solution file only work given that dy/dx
% is strictly increasing with increased x, but the code below works even if
% this is not the case.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% IGNORE EVERYTHING THAT FOLLOW THIS LINE
% I wrote this code before I realized you could just use interp1 to
% get the correct x-value.

% Method:
% Find dy/dx for mid-point x's
% Find mid-point x's
% Run through the dy/dx vector
%   If it changes sign, we have a zero
%       The proportion of the difference between dy/dx = 0 and current
%       dy/dx to the difference between next dy/dx and current dy/dx is
%       equal to same ratio but with the dy/dx = 0 being the associated
%       x-value and all other dy/dx's switched with associated x's
%       The y-value associated with this x-value is just the interp1 of the
%       data set given the x-value we found
%   end
% end

%{
for i = 1:length(dy)-1
   if sign(dy(i)) ~= sign(dy(i+1))
       extremum(1) = ((-dy(i))/(dy(i+1)-dy(i)))*(xmid(i+1)-xmid(i))+xmid(i);
       extremum(2) = interp1(x,y,extremum(1));
   end    
end
%}
end
