function [ out_vect ] = evenOrOddlyLengthed( in_vect )
%EVENORODDLYLENGTHED Returns a vector of elements in the even indices of
%IN_VECT if IN_VECT is of even length, or a vector of elements in the odd
%indices if said vector is of odd length.
%Because logical false = 0, we can do this with one line which checks
%whether or not the length is even, then adds one to that logical (0 or 1)
even = mod(length(in_vect),2) == 0;
out_vect = in_vect(even+1:2:end);
end