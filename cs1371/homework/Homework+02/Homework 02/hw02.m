%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name         : John Pratt
% GT Email     : jpratt9@gatech.edu
% Homework     : hw02
% Course       : CS1371
% Section      : B05
% Collaboration:
%                 "I worked on the homework assignment alone, using
%                  only course materials."
%
% Files provided with this homework:  
%   hw02.m
%	ABCs_functions.m
%	ABCs_hw02_pretest.p
%   quad_soln.p
%   findZeroVelocity_soln.p
%   birthdaycake_soln.p
%   balloons_soln.p  
%
% Files to submit:
%	ABCs_functions.m
%	quad.m
%	findZeroVelocity.m
%	birthdaycake.m
%	balloons.m
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
% Part of this homework is an m-file called "ABCs_functions". Open these
% files in MATLAB and complete it according to the directions contained
% within. 
%
% Files to Complete: 
%       - ABCs_functions.m
% ABCs File Testing:
%  >> ABCs_hw02_pretest
%
%==========================================================================
% PART 2. Drill Problems
%--------------------------------------------------------------------------
%
% The drill problems cover the following major topic(s):
%	functions
%
% Follow the directions carefully and make sure file names as well as
% function headers are written exactly as described in the problem text. If
% your function headers are not written as specified, i.e. you write a
% similar function but with different inputs or outputs than those
% described, then you have not completed the homework problem described and
% will receive a 0.
%
%==========================================================================
% PROBLEM 1.   Negative B plus or minus square root...
%--------------------------------------------------------------------------
%
% Function Name: quad
%
% Inputs  (3): - (double) The first coefficient of a 2nd order polynomial, A
%              - (double) The corresponding 2nd coefficient, B
%              - (double) The corresponding 3rd coefficient, C
%
% Outputs (2): - (double) The positive root of the polynomial
%              - (double) The negative root of the polynomial
%
% Function Description:
%   Write a function called quad.m that takes in coefficients A, B, and C
%   from a 2nd order polynomial, and uses them to evaluate the quadratic
%   formula and find the two roots of the polynomial (where it is equal to
%   0). The "positive root" will come from using a plus sign for the +/-,
%   and the "negative root" will be from using a minus sign.
%
%   For reference, the quadratic formula is:
%
%                   -B  +/-  sqrt(B^2 - 4*A*C)
%                 ------------------------------
%                              2*A
%
% Notes: 
%   - Matlab follows order of operations, but don't be afraid to use lots
%     of parentheses anyway.
%   - sqrt() is a built-in function in matlab, and is the square-root
%     function. It takes the square root of a number.
%
% Test Cases:
%
%       [posRoot1,negRoot1] = quad(5,0,-5)
%           posRoot1 => 1
%           negRoot1 => -1
%   
%       [posRoot2,negRoot2] = quad(1,36,-9)
%           posRoot2 => 0.2483
%           negRoot2 => -36.2483
%
%
%==========================================================================
% PROBLEM 2.   Quadratic formula in action!
%--------------------------------------------------------------------------
%
% Function Name: findZeroVelocity
%
% Inputs  (4): - (double) The first coefficient of a cubic polynomial, A.
%              - (double) The corresponding 2nd coefficient, B.
%              - (double) The corresponding 3rd coefficient, C.
%              - (double) The corresponding 4th coefficient, D.
%
% Outputs (2): - (double) The "positive root" for when velocity is 0.
%              - (double) the "negative root" for when velocity is 0.
%
%
% Function Description:
%   Imagine that you are an engineer finishing your degree at Georgia Tech,
%   and for your capstone-design course you need to find when the velocity
%   of certain component in your design is equal to 0. Using experimental
%   and curve fitting techniques that you will actually learn in later
%   classes, you have found that this component's position function with
%   respect to time is simply a cubic polynomial. For example, the position
%   function with respect to time might be something like this:
%
%           f(t) = 3t^3 + 4t^2 + 2t + 3.
%
%   If it was, then the "coefficients" of this polynomial would be 3, 4, 2,
%   and 3 (in that order). From calculus it is known that Velocity is the
%   derivative of Position. The derivative of a cubic polynomial with
%   coefficients of A, B, C, and D is shown below:
%
%           cubic function: f(t) = At^3 + Bt^2 + Ct + D
%
%           its derivative: f'(t) = (3*A)t^2 + (2*B)t + C
%
%   Using this knowledge, write a function that takes in the coefficients
%   A, B, C, and D of a cubic function for Position, and outputs the
%   "positive root" and "negative root" for when Velocity is zero.
%
% Notes:
%   - You do not need to, but you may use your prevously written function,
%     quad.m, or the included function quad_soln.p to code this problem.
%   - The inputs/outputs of your function must match those described above;
%     if yours do not, your will receive a zero for this problem.
%
% Test Cases:
%
%       [posRoot1 negRoot1] = findZeroVelocity(3,0,-81,4)
%           => posRoot1 = 3
%           => negRoot1 = -3
%
%       [posRoot2 negRoot2] = findZeroVelocity(78,25,-33,5)
%           => posRoot2 = 0.2836
%           => negRoot2 = -0.4973
%
%
%==========================================================================
% PROBLEM 3. Who wants some cake?
%--------------------------------------------------------------------------
% 
% Function Name: birthdaycake
%
% Inputs  (2): - (double) The total number of pieces of cake
%              - (double) The number of people at your party
%
% Outputs (1): - (double) How many pieces of cake you will get
%
% Function Description:
%   You are having a birthday party for yourself, and are trying to predict
%   how many pieces of cake you'll get to eat by yourself. Write a matlab
%   function to do this for you! There are two inputs: the total number of
%   pieces of cake, and the number of people at the party. You know that
%   the cake will need to be divided evenly between all guests at your
%   party, including yourself, and that you want everyone to eat the same
%   number of pieces. Because of this, there might be a few pieces of cake
%   left over that could not be fairly distributed. These few pieces left
%   over will be yours to eat after everyone has left, so you will get all
%   of them.
%
% Example:
%   If there are 20 pieces of cake and 6 people at your party: 18 pieces of
%   cake will be distributed among the 6 people so that each person gets 3
%   (including yourself). This will leave 2 pieces of cake remaining from
%   the original 20, and you will also get these 2 pieces. So your output
%   in this case should be 5.
%
% Notes:
%   - You may find the floor() and mod() functions useful.
%
% Test Cases:
%
%       [forMe1] = birthdaycake(20,6)
%           forMe1 => 5
%
%      [forMe2] = birthdaycake(300,56)
%           forMe2 => 25
%
%
%==========================================================================
% PROBLEM 4.   Balloon pranks are fun
%--------------------------------------------------------------------------
%
% Function Name: balloons
%
% Inputs  (3): - (double) The volume of your roommate's bedroom
%              - (double) The average radius of an inflated balloon
%              - (double) The price for a single 12-pack of balloons
%
% Outputs (1): - (double) The total cost of the prank
%
%
% Function Description:
%   Let's say your roommate decided to go home for labor day but you're
%   staying on campus, and that it's your turn in the perpetual roommate
%   prank-war that you and he/she are having. So you decide to fill his/her
%   bedroom with balloons! Whether or not you hypothetically follow through
%   on this hypothetical prank is one thing, but you at least need to
%   calculate how much it would cost you.
%
%   Write a function that takes 3 inputs: the volume of your roommate's
%   bedroom, the average radius of an inflated balloon, and the price of a
%   12-pack of balloons; and outputs the total cost of the prank. Assume
%   that balloons are sold in packs of 12, and use the price given as the
%   total price of one 12-pack of balloons (before tax). Also assume an 8%
%   sales tax.
%
% Notes:
%   - You may assume the balloons will all be spherical. The volume formula
%     of a sphere is as follows: volume = (4/3)*pi*(radius^3)
%   - Ignore the empty space that will actually exist between balloons.
%   - Round up when finding the number of packs of balloons needed; you
%     can only buy things in whole numbers after all.
%   - Remember to include an 8% sales tax.
%
%
% Test Cases:
%
%       [cost1] = balloons(512,.7,3)
%           => cost1 = 97.2000
%
%       [cost2] = balloons(800,.5,2.5)
%           => cost2 = 345.6000
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
