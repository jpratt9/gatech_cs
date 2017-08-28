clear;
clc;

check1 = checkImage('apples.png', 'oranges.png');
check2 = checkImage('flower1.png', 'flower2.png');
check3 = checkImage('oranges.png', 'tangerines.png');
check1soln = checkImage_soln('apples.png', 'oranges.png');
check2soln = checkImage_soln('flower1.png', 'flower2.png');
check3soln = checkImage_soln('oranges.png', 'tangerines.png');
checkworks1 = strcmp(check1,check1soln)
checkworks2 = strcmp(check2,check2soln)
checkworks3 = strcmp(check3,check3soln)

dragonrend('Unknown - Object on the Grass.png');
dragonrend('Raphael - Madonna del Prato.png');
dragonrend_soln('Unknown - Object on the Grass.png');
dragonrend_soln('Raphael - Madonna del Prato.png');
dragon1 = imread('Raphael - Madonna del Prato_dragonrended.png');
dragon2 = imread('Unknown - Object on the Grass_dragonrended.png');
dragon1soln = imread('Raphael - Madonna del Prato_dragonrended_fromSolnFile.png');
dragon2soln = imread('Unknown - Object on the Grass_dragonrended_fromSolnFile.png');
dragonworks1 = all(all(dragon1(:,:,1) == dragon1soln(:,:,1) & dragon1(:,:,2) == dragon1soln(:,:,2) & dragon1(:,:,3) == dragon1soln(:,:,3)))
dragonworks2 = all(all(dragon2(:,:,1) == dragon2soln(:,:,1) & dragon2(:,:,2) == dragon2soln(:,:,2) & dragon2(:,:,3) == dragon2soln(:,:,3)))



kal1 = kaleidoscope('kaleidoscope_test1.png', 'instructions1.txt');
kal2 = kaleidoscope('kaleidoscope_test2.png', 'instructions2.txt');
kal3 = kaleidoscope('kaleidoscope_test3.png', 'instructions3.txt');
kal1soln = kaleidoscope_soln('kaleidoscope_test1.png', 'instructions1.txt');
kal2soln = kaleidoscope_soln('kaleidoscope_test2.png', 'instructions2.txt');
kal3soln = kaleidoscope_soln('kaleidoscope_test3.png', 'instructions3.txt');
kalworks1 = all(all(kal1(:,:,1) == kal1soln(:,:,1) & kal1(:,:,2) == kal1soln(:,:,2) & kal1(:,:,3) == kal1soln(:,:,3)))
kalworks2 = all(all(kal2(:,:,1) == kal2soln(:,:,1) & kal2(:,:,2) == kal2soln(:,:,2) & kal2(:,:,3) == kal2soln(:,:,3)))
kalworks3 = all(all(kal3(:,:,1) == kal3soln(:,:,1) & kal3(:,:,2) == kal3soln(:,:,2) & kal3(:,:,3) == kal3soln(:,:,3)))