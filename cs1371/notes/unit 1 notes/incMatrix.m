%{
1  2  3  4  5
6  7  8  9  10
11 12 13 14 15
%}

function [ M ] = incMatrix( rows, cols )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
value = 1;
for r = 1:rows
    for c = 1:cols
        M(r,c) = value;
        value = value + 1;
    end
end
end