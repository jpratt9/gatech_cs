function [ innocent ] = matlock( chars, logicals, start )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
[row col] = [start(1) start(2)];
lowers = chars(isletter(chars) && strcmp(lower(chars),chars));
uppers = chars(isletter(chars) && strcmp(upper(chars),chars));
nums = chars(double(chars) >= double('0') && double(chars) <= double('9'));
numLowers = sum(sum(lowers));
numUppers = sum(sum(uppers));
numNums = sum(sum(nums));
[M N] = size(chars);
numOthers = (M .* N) - sum([numLowers numUppers numNums]);
[row col] = [row col] - [numNums-numOthers numLowers-numUppers];
innocent = logcials(row,col);
end