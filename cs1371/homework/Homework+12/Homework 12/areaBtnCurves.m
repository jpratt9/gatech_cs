function [sampArea, numPoints] = areaBtnCurves(coeff1, coeff2, actualArea, interval)
% Outputs the number of points needed to get 2% or less error for the
% difference in the integrals of polynomials whose coefficients are COEFF1
% and COEFF2 over range given by INTERVAL knowing the actual value,
% ACTUALAREA

% Method:
% Create a new window, number of points currently used to estimate
% integral, and empty vector of sample errors
% Until the final sample error is <=2%,
%   add another point to the sample
%   create a vetor of that many x-values evenly spaced in x-interval
%   evaluate each polynomial at these points and store result
%   compute estimated difference in integral using trapz and store result
%   compute error in this integral given what the actual value should be
% end
% plot the (number of points, sample error) data
% give the graph the appropriate title, axes labels, and axes ranges

figure;
numPoints = 1;
sampError = [];
while numPoints < 2 || sampError(end) > 2
    numPoints = numPoints + 1;
    x = linspace(interval(1),interval(end),numPoints);
    y = [polyval(coeff1,x); polyval(coeff2,x)];
    sampArea = trapz(x,y(1,:)) - trapz(x,y(2,:));
    sampError = [sampError 100 * abs((sampArea - actualArea) / actualArea)];
end
plot(2:numPoints, sampError);
title('Accuracy vs. Samples');
xlabel('Number of Samples');
ylabel('Percent Error');
axis([2 numPoints+1 0 sampError(1)]);

end