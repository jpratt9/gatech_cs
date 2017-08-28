function [ result ] = barrelShiftArray(array, numshift)
%BARRELSHIFTARRAY Shifts a given ARRAY by NUMSHIFT indices
%   All we really have to do is turn ARRAY into a column vector, shift
%   that, then turn the shifted column vector back into an array of the
%   same dimensions as ARRAY.
columnVector = array(:);
%how to shift was really the only hard part.  we need to take into account
%that sometimes NUMSHIFT will be greater than the length of COLUMNVECTOR.
numshift = mod(numshift, length(columnVector));
columnVector = [columnVector(end-numshift+1:end); columnVector(1:end - numshift)];
result = reshape(columnVector,size(array));
end

