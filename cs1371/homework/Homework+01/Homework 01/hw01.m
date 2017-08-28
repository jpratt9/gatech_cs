%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name         : John Pratt
% GT Username  : jpratt9@gatech.edu
% Section      : B05
% Homework     : HW01
%
% Collaboration: <place here one of the following:
%                 "I worked on the homework assignment alone, using
%                  only course materials."
%                 OR
%                 "I worked on this homework with <give the names of the
%                  people you worked with>, used solutions or partial
%                  solutions provided by <name the people or other
%                  sources>, and referred to <cite any texts, web sites, or
%                  other materials not provided as course materials for CS
%                  1371.>"
%
%
% Files provided with this homework:
%   - hw01.m
%   - CS 1371 HW Guide.pdf
%   - ABCs_HomeworkOverview.m
%   - ABCs_pretest_HomeworkOverview.p
%   - circleMath_soln.p
%   - hypotenuse_soln.p
%
% Files to Submit:
%   - hw01.m
%   - ABCs_HomeworkOverview.m
%   - circleMath.m
%   - hypotenuse.m
%
% Instructions:
%   1) Follow the directions for each problem very carefully or you will
%   lose points.
%   2) Make sure you name variables exactly as described in the problems or
%   you will not receive credit.
%   3) Read the announcements! Any clarifications and/or updates will be
%   announced on T-Square. Check the T-Square announcements at least once
%   a day.
%   4) You should not use any of the following commands in files that 
%   will be graded:
%       a) clear
%       b) clc
%       c) solve
%		d) input  
%
%  If you want to use this file for testing your work, remove the comment
%  characters from the clear and clc lines below
%
%==========================================================================
% PART 1.  ABC Problems
%--------------------------------------------------------------------------
%
% Part of this homework is a m-file called ABCs_homework00.m. Open this
% file in MATLAB and complete it according to the directions contained
% within.
%
% Once you are done, you can test your ABC file by running 
% ABCs_pretest_hw01() in the command window. Alternatively, you can 
% right-click the file in the Current Directory window and click 
% "Run File".  You cannot run or open the file by double clicking it.
%
% Files to Complete: 
%       - ABCs_HomeworkOverview.m
% ABCs File Testing:
%       - Run ABCs_pretest_HomeworkOverview.p by calling:
%               ABCs_pretest_HomeworkOverview()
%
%==========================================================================
% PART 2.  Drill Problems
%--------------------------------------------------------------------------
%
% The drill problems cover the following major topic:
%   1. Functions
%
% Follow the directions carefully and make sure files names as well as
% function headers are written exactly as described in the problem text. If
% your function headers are not written as specified, then you will receive
% an automatic zero for the problem.
%
% In this assignment, the drill problems will consist of simple 
% math/logic problems. All calculations should be done using MATLAB code.
% Do not compute any answer outside of MATLAB and then manually set the
% variable to the solution value. 
%
% Solution codes are provided for all drill problems. These files will be
% named as such: "<name of your code>_soln.p". They can be used just like
% any .m file that is written in matlab, except you are not able to open
% them. You may these files in conjunction with the test cases provided for
% each problem to check your work.
%
%
%==========================================================================
% Problem 1.  It's the circle of life
%==========================================================================
%
% Function Name: circleMath
%
% Inputs (1):  - (double) The diameter of a circle
%
% Outputs (2): - (double) The area of the circle
%              - (double) The perimeter of the circle
%
% Function Description:
%   Write a function, circleMath, that takes in the diameter of a circle
%   and outputs the area and the perimeter.
%
% Test Cases:
%   [area1, perim1] = circleMath(6)
%       area1 => 28.2743
%       perim1 => 18.8496
%
%   [area2, perim2] = circleMath(2)
%       area2 => 3.1416
%       perim2 => 6.2832
%
%==========================================================================
% Problem 2.  Triangle Math
%==========================================================================
%
% Function Name: hypotenuse 
%
% Inputs (2):  - (double) A side of a triangle
%              - (double) A side of a triangle
%
% Outputs (1): - (double) The hypotenuse of a triangle
%
% Function Description:
%   Write a function named, pythagorean, that takes in two sides of a
%   triangle and ouputs hypotenuse.  Remember, the pythagorean theorem is:
%
%          (sideA.^2) +(sideB.^2) = (hypotenuseC.^2)
%
%   A visual of the triangle is given below:
%
%            |\
%            | \
%   sideA    |  \   hypotenuseC
%            |   \
%            |    \
%            |_____\
%      
%             sideB
%
% Test Cases:
%
%   hyp1 = hypotenuse(3,4)
%       hyp1 => 5
%
%   hyp2 = hypotenuse(5,12)
%       hyp2 => 13
%