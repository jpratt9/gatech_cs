close all
clear
clc

x = [1 3];
y = [2 6];
%plot(x,y) gives us a basic (blue) line 
%default:
% b     blue          .     point              -     solid

plot(x,y,'rh:'); %red hexaram dotted-line

hold on
x2 = [4 7];
y2 = [8 10];
plot(x2,y2, 'gx-'); %green x-mark solid-line

%figure %clears current plot and formatting


x3 = [6 10 19];
y3 = [11 16 25];

plot(x3,y3) %blue point solid-line