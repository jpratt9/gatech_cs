%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name         : <John Pratt>
% GT Email     : <jpratt9@gatech.edu>
% Homework     : hw12
% Course       : CS1371
% TA's Name    : <Edward Foyle, Nick Fahrenkrog>
% Section      : <B05>
% Collaboration: <I worked on the homework assignment alone, using
%                  only course materials.>
%
% Files provided with this homework:
%   ABCs_hw12_pretest.p
%   ABCs_numerical_methods.m
%   areaBtnCurves_soln.p
%   areaBtwCurves_testCase1_plotSolution.png
%   areaBtwCurves_testCase2_plotSolution.png
%   areaBtwCurves_testCase3_plotSolution.png
%   estimateExtremum_soln.p
%   extrapCalc1.png
%   extrapCalc2.png
%   extrapCalc_soln.p
%   hw12.m
%   topGearAnalyst_soln.p
%   uniqueFit_soln.p
%   uniqueFit_testCase1_plotSolution.png
%   uniqueFit_testCase2_plotSolution.png
%   uniqueFit_testCase3_plotSolution.png
%
% Files to submit:
%   hw12.m
%	ABCs_numerical_methods.m
%	topGearAnalyst.m
%	uniqueFit.m
%	estimateExtremum.m
%	extrapCalc.m
%	areaBtnCurves.m
%
% Instructions:
%   1) Follow the directions for each problem very carefully or you will
%   lose points.
%   2) Make sure you name functions exactly as described in the problems or
%   you will not receive credit.
%   3) Read the announcements! Any clarifications and/or updates will be
%   announced on T-Square. Check the T-Square announcements at least once
%   a day.
%   4) You should not use any of the following functions in any file that 
%   you submit to T-Square:
%       a) clear
%       b) clc
%       c) solve
%       d) input
%       e) disp
%       f) close all
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%==========================================================================
% PART 1.  ABC Problems
%--------------------------------------------------------------------------
%
% Part of this homework is an m-file called "ABCs_numerical_methods". Open
% these files in MATLAB and complete it according to the directions
% contained within.
%
% Files to Complete: 
%       - ABCs_numerical_methods
% ABCs File Testing:
%  >> ABCs_hw12_pretest
%
%==========================================================================
% PART 2. Drill Problems
%--------------------------------------------------------------------------
%
% The drill problems cover the following major topic(s):
%	Numerical Methods
%
% Follow the directions carefully and make sure files names as well as
% function headers are written exactly as described in the problem text. If
% your function headers are not written as specified, then you will recieve
% an automatic zero for the problem.
%
% All drill problems must be functions (i.e. contain valid function
% headers).  Any scripts turned in will be given a 0 automatically.
%
%===========================================================================
% PROBLEM 1.  All we know is...
%---------------------------------------------------------------------------
% 
% Function Name: topGearAnalyst
%
% Inputs  (2): - (double) A vector of coefficients of a car's velocity
%                         function.
%              - (double) A time, t, to evaluate position, velocity, and
%                         acceleration at.
%
% Outputs (3): - (double) The car's position at the inputted time.
%              - (double) The car's velocity at the inputted time.
%              - (double) The car's acceleration at the inputted time.
% 
% Function Description:
%   So The Stig needs someone to do his analyzing for him, and since
%   Jeremy, James, and Richard are always too busy pulling pranks on each
%   other to actually hire somebody, it's your job to do this for them.
%
%   Write a matlab function that takes in a vector of coefficients
%   representing a polynomial of a car's velocity, and a time. Your
%   function should calculate the coefficients for the car's acceleration
%   and position, and then output the position, velocity, and acceleration
%   evaluated at the inputted time.
%
%   Remember from calculus that Acceleration is simply the derivative of
%   Velocity, and that Position is the integral of Velocity. Also remember 
%   that you always need an integration constant when you integrate, you 
%   should just use 0 for this value.
%
%   For your reference, here are the rules of how to integrate and derive a
%   single term of a polynomial:
%
%       Integral of f(t): (1/n)*t^(n+1) % t raised to the n+1 power, and divided by n
%
%       f(t) = t^n  % t raised to the n-th power.
%
%       f'(t) = n*t^(n-1) % Derivative: n multipled by t raised to the (n-1) power.
% 
% Notes: 
%   - Use 0 for the constant of integration.
% 
% Test Cases:
%
%       [P1, V1, A1] = topGearAnalyst([1 3 4], 10)
%           => P1 = 523.3333
%              V1 = 134
%              A1 = 23
%
%        
%           => P2 = 132
%              V2 = 166
%              A2 = 72
%
%
%==========================================================================
% PROBLEM 2.   If The Data Fits...
%--------------------------------------------------------------------------
%
% Function Name: uniqueFit
%
% Inputs  (2): - (double) x-data
%              - (double) y-data 
%
% Outputs (0): - None
%
% Output Plots (1): Plot of the different subplots leading to a unique fit
%
% Function Description:
%   Write a function called "uniqueFit" that takes in x and y data and
%   creates a plot of all of the polynomial curve fits up to and including
%   the "unique" fit. Each fit will be its own subplot, with two
%   subplots per row. The "unique" fit is when the order of the fit is
%   one less than the number of points you are fitting the polynomial to.
%
% Specifics:
%   - Plot all the original points in each subplot with red "x"s.
%   - Plot all polynomial fits as black lines.
%   - Use 100 linearly spaced points between the smallest and largest x 
%     value for new x values when you are plotting the polynomial fit
%     curves.
%   - The title of the fitted plots should read 'Order __ Fit', where the
%     blank is the ordinal number of the fit. Example, a first order fit
%     should read 'Order 1 Fit', while second order fit will read 'Order 2
%     Fit' and so on.
%   - x-values are not guaranteed to be in any particular order, but the
%     1st x-value will correspond to the 1st y-value and so on.
%   - Use "axis square" for your axes. If your plots' data is all the same
%     as that pictured in the solution image, and you did "axis square",
%     then you will receive credit for your plot even if it looks slightly
%     different than the solution image.
%
% Notes:
%   - You may assume that you are to begin with a 1st order fit, i.e. that
%     the input vector is a length of at least 2. Note that even though
%     only one plot will exist when the input vector is of length 2, you
%     must still adhere to the rule that there are to be enough space for
%     two subplots per row.
%   - You may assume that the input vectors are the same size.
%   - If your plot looks different than the solution plot image, try
%     resizing the figure window. Matlab will automatically adjust your
%     plot when you resize the figure window. The solution plots had their
%     figure windows resized to make them easier to see before they were
%     saved to *.png files.
%
% Test Cases:
%
%   uniqueFit(1:5,[5 1 15 9 8])
%       => should look like uniqueFit_testCase1_plotSolution.png
%
%   uniqueFit([1 6 2 4 9 8 5 3], [0.5 0.9 1.5 2.0 0.1 0.1 1.3 0.2])
%       => should look like uniqueFit_testCase2_plotSolution.png
%
%   uniqueFit([0.2 0.5 1.2 1.6 2.6 9.6],[1 3 1 6 7 0.1])
%       => should look like uniqueFit_testCase3_plotSolution.png
%
%
%==========================================================================
% PROBLEM 3.  I can do calculus with MATLAB?
%--------------------------------------------------------------------------
% 
% Function Name: estimateExtremum
%
% Inputs  (2): - (double) A vector of x coordinates
%              - (double) A vector of y coordinates
%
% Outputs (1): - (double) A vector of the x and y coordinates of the extremum 
% 
% Function Description:
%   Write a function called "estimateExtremum" that takes in a set of x and
%   y coordinates corresponding to the function y = f(x), and outputs the
%   approximate coordinates of the function's local extremum (maximum or
%   minimum) as a 2x1 vector.
% 
%   Remember from calculus that a local minimum or maximum of a function
%   occurs where the derivative of the function equals zero. So to find the
%   local maximum or minimum of a function, you need to derive it, and find
%   where the derivative equals to zero. Once you have derived a function,
%   even if there's not an exact 0 value in your vector, you can
%   interpolate to find the x-value where the derivative will be 0. Then,
%   once you find the x-value where the derivative is 0, you can
%   interpolate from the original data to find what the local maximum or
%   minimum value will be.
% 
% Notes: 
%   - The function is guaranteed to have its derivative change sign exactly
%     once within the bounds of the inputted coordinates.
%   - The vector of x coordinates is guaranteed to be strictly increasing.
%   - When performing an interpolation with a function's derivative, you
%     will need x-values to correspond to the "y-values" that are the
%     derivative. Use the midpoints between the inputted x-values for this.
%     (Ex: inputted x-values = [2 4 5], midpoint x-values = [3 4.5])
% 
% Test Cases:
%   x1 = 1:0.2:4;
%   y1 = 3.*x1.^4 - 11.*x1.^3 + 33.*x1.^2 - 99.*x1 + 54;
%   extremum1 = estimateExtremum(x1, y1);
%             extremum1 => [2.0317 -51.8306]
%
%   x2 = [1, 1.2, 1.5, 1.7, 2, 2.2, 2.5, 2.7, 3];
%   y2 = [-5, -4.08, -3, -2.48, -2, -1.88, -2, -2.28, -3];
%   extremum2 = estimateExtremum(x2, y2);
%             extremum2 => [2.2500 -1.9000]
%
%==========================================================================
% PROBLEM 4.  Exrapolate all the data!
%--------------------------------------------------------------------------
%
% Function Name: extrapCalc
%
% Inputs  (4): - (double) A vector of x values
%              - (double) A vector of y values
%              - (char)   A string of colors
%              - (double) A vector of bounds for the axes
%
% Outputs (0):
%
% Output Plots (1): A 3x1 subplot of different extrapolation methods.
%
% Function Description:
%   Given a vector of x-valus, a vector of corresponding y-values, a
%	string of colors, and a vector describing bounds for the axes, write a
%	function called extrapCalc that extrapolates from the data using 3
%	different extrapolation methods. Your function should output 3 subplots
%	in one column. The first subplot should be titled 'Interp1: Linear' and
%	will use the function interp1 with the  method 'linear' to perform the
%	extrapolations. The second subplot should be titled 'Interp1: Cubic'
%	and will use the function interp1 with the  method 'cubic' to perform
%	the extrapolations. The third subplot should be titled 'Spline' and
%	will use spline() to perform the extrapolations.
%
%   For each method, you should perform 4 extrapolations (all of which you
%   plot), and then you should plot the originally given data. This will
%   give a total of 5 curves plotted on each subplot. The 4 extrapolations
%   you perform will all use the inputted x-values as the "new X" values
%   for extrapolation, and will only treat part of the inputted data as the
%   "original" data. The first extrapolation you perform should use the
%   first 1/5th of the data as the "original data". The second extrapolation
%   should use the firrt 2/5ths of the data as the "original data", etc. So
%   that you are using more and more of the original data with each
%   extrapolation, with the extrapolated curves become more and more like
%   the originally inputted data. For your "5th extrapolation" you would
%   use the first 5/5ths of the given data as your "original data" (which
%   is just using all of it), and then use the originally inputted x-values
%   as your "new x" values: but this is effectively the exact same simply
%   plotting the original data. So that's what you should do for your
%   funciton.
%   
%   You should plot your extrapolations in the following order:
%       1) The extraplation performed using first 1/5th of data.
%       2) The extraplation performed using first 2/5ths of data.
%       3) The extraplation performed using first 3/5ths of data.
%       4) The extraplation performed using first 4/5ths of data.
%       5) The original data that you were given.
%
%   And the color of your plotted lines should follow the order of the
%   colors given in the input string.  This means that the first plotted
%   line should be graphed in the first color given in the color string and
%   so on. You are guaranteed that the color string will contain exactly 5
%   characters. Additionally, the axes should be set to the range given as
%   an input. The vector for the bounds of the axes will be given in the
%   form [xMin, xMax, yMin, yMax]. Label the y-axis 'y values' and the
%   x-axis 'x values'.
%
% Notes:
%   - You are guaranteed that the inputted vector lengths will be the
%     same and will be divisible by 5.
%
% Test Cases:
% 	x1 = linspace(0, 4*pi);
%   y1 = sin(x1);
%   x2 = linspace(0, 20, 50);
%   y2 = 5.*cos(x2);
%
%   extrapCalc(x1,y1,'yrbgk', [0, 14, -2, 2]);
%       => output graph should look like extrapCalc1.png
%
%   extrapCalc(x2,y2,'rgbmk', [0, 20, -8, 8]);
%       => output graph should look like extrapCalc2.png
%
%==========================================================================
% PROBLEM 5.  More calculus with MATLAB?  EXTRA CREDIT  EXTRA CREDIT  EXTRA 
%--------------------------------------------------------------------------
% 
% Function Name: areaBtnCurves
% Inputs  (4): - (double) A vector of coefficients for a polynomial
%              - (double) A vector of coefficients for a second polynomial
%              - (double) The actual area between the two functions given above
%              - (double) A 1x2 vector of a start and end x value
%
% Outputs (2): - (double) the approximated area between the curves
%              - (double) the number of points needed to adequately
%                approximate the area between the functions
%
% Plots (1):   - A plot of percent error vs. number of sample points
%
% Function Description:
%   On the off-chance that Wolfram|Alpha goes down in the last 30 minutes
%   before your calculus homework is due, you want to have a backup plan
%   for evaluating all those pesky integrals. So you decide to write a
%   Matlab function to numerically do it for you:
%
%   The function will approximate the area between two given functions over
%   the given x-value range using an increasing number of linearly spaced
%   points to evaluate the area until the percent error between your
%   approximate area and the given actual area is less than 2%. It will
%   output the number of points needed to approximate the area to within
%   2%, and the value of the approximated area with that number of points.
%   It will also output a plot of "Accuracy" vs. "Number of Points" once
%   you have reached the threshold accuracy. The percent error for this
%   problem will be the relative error between each approximated area and
%   the given actual area. The formula for this will be:
%
%     percentError = 100 * abs( (approximatedArea - givenArea) / givenArea)
%
%   where abs() means absolute value, approximatedArea is the area you
%   approximate with some number of points, and givenArea is the area given
%   in your third input.
%   
%   You should approximate the area under each of the two given curves
%   using the trapezoidal method. The curves will be given in the form of
%   polynomial coefficients, and so the "number of points" you use to
%   evaluate the area between the curves is the number of points you use to
%   evaluate each curve to then find the area under each one with the
%   trapezoidal method. To find the area between the curves, you will
%   always subtract the area under the second curve from the area under the
%   first curve (as in, don't try to figure out which curve is above the
%   other, just subtract area under input 2 from area under input 1).
%
%   The first area approximation you perform should use 2 linearly spaced
%   points between the given x-bounds, and you should increase the number
%   of points by 1 until the percent error for your approximation is less
%   than 2.
%
%   You should also save a vector of your percent errors, because you will
%   need to output a plot of percent error vs the number of points used.
%   For this plot, you should plot the number of points on the x-axis, and
%   then plot each corresponding percent error on the y-axis. The plot
%   should asymptotically approach y = 0 with increasing number of points.
%
%   Plot Specifications:
%       Titles/Axis Labels:
%           - The plot should be titled: 'Accuracy vs. Samples'
%           - The x-axis should be labeled 'Number of Samples'
%           - The y axis should be labeled 'Percent Error'
%       Axis Ranges:
%           - The x-axis should go from 2 to one more than the number of
%             points necessary to approximate the area to within 2% accuracy
%           - The y-axis should go from 0 to the maximum percent error
%             (the maximum percent error should be the error for your first
%             approximation, when you only used 2 points)
%
% 
% Notes: 
%   - Your function only has to work for polynomials. As in, you will never
%     be given an input function in any form other than polynomial
%     coefficients.
%
% Hints:
%   - trapz()
%   - polyval()
%   - Iteratively performing a calculation until your percent error reaches
%     some given tolerance is exactly how the vast majority of numerical
%     methods are coded in engineering; if you have to take a numerical
%     methods class then you will write lots and lots of codes in this
%     format.
% 
% Test Cases:
%   coeff1 = [1/362880,0,-1/5040,0,1/120,0,-1/6,0,1,5];
%   coeff2 = [-2,0,4];
%   coeff3 = [1/540,1/720,1/120,1/24,1/6,1/2,1,1];
%   coeff4 = [1/3,-1];
%   coeff5 = [4,3,2,1,1];
%
%   [sampArea1,numPoints1] = areaBtnCurves(coeff2,coeff5,-1.7851e3,[-4,4]);
%       => sampArea1 = -1.8198e+03
%          numPoints1 = 19
%          -output plot should look like
%           areaBtwCurves_testCase1_plotSolution.png
%
%   [sampArea2,numPoints2] = areaBtnCurves(coeff1,coeff4,39.5127,[-1,6]);
%       => sampArea2 = 40.1699
%          numPoints2 = 10
%          -output plot should look like
%           areaBtwCurves_testCase2_plotSolution.png
%
%   [sampArea3,numPoints3] = areaBtnCurves(coeff5,coeff3,8.2451e6,[-20,10]);
%       => sampArea3 = 8.4038e+06
%          numPoints3 = 22
%          -output plot should look like
%           areaBtwCurves_testCase3_plotSolution.png
%
%
%==========================================================================
% FINISHED!!!
%--------------------------------------------------------------------------
%
% Congratulations, you've finished this homework assignment.  Before you
% turn in your code be sure you have tested it throughly.  Once you've
% tested it you may submit it to T-square.  Be sure all files are submitted
% with the correct filenames.
