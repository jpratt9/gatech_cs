function [x, v, a] = topGearAnalyst(vCoeffs, t)
% Evaluates position, velocity, and acceleration at a given time T with
% coefficients to the velocity polynomial VCOEFFS

% Method:
% For position, do polyval with coeffs being vCoeffs of length N divided by
% n
% For velocity, do polyval with vCoeffs
% For acceleration, do polyval with coeffs being vCoeffs multiplied by n up
% to second to last vCoeff

x = polyval(vCoeffs ./ ((length(vCoeffs)):-1:1) ,t)*t;
v = polyval(vCoeffs,t);
a = polyval((length(vCoeffs)-1:-1:1) .* vCoeffs(1:end-1),t);
end