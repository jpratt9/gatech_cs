clear
clc
[xx, fs, nbits] = audioread('threevotes.wav');
tt = 1:1/fs:length(xx)/fs;
1