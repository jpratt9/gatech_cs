function [ logicals ] = encoded( vect, num )
%ENCODED Returns a vector of logicals, LOGICALS, pertaining to a number NUM and a
%vector of numbers, VECT.
%   The logical in the first index of LOGICALS is whether or not NUM is
%   actually contained inside VECT.
%   The logical in the second index of LOGICALS is whether or not NUM is
%   the distance between all adjacent elements in VECT.
%   The logical in the third index of LOGICALS is whether or not NUM is
%   the sum of all elements of VECT.
%   The logical in the third index of LOGICALS is whether or not NUM is
%   the sum of all elements of VECT.
logicals = [any(vect == num), all((vect(2:end) - vect(1:end-1)) == num), sum(vect) == num, all(mod(vect, num) == 0)];
end