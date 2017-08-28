%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name         : John Pratt
% GT Email     : jpratt9@gatech.edu
% Homework     : hw03
% Course       : CS1371
% TA's Name    : Nick Fahrenkrog/Edward Foyle
% Section      : B05
% Collaboration: I worked on the homework assignment alone, using
%                only course materials.
%                 
% Files provided with this homework: 
%   hw03.m
%	ABCs_vectors.m
%	ABCs_logicals.m
%   ABCs_hw03_pretest
%   shoelace_soln.p
%   encoded_soln.p
%   GTadmissions_soln.p
%   evenOrOddlyLength_soln.p
%   
%
% Files to submit:
%   hw03.m
%	ABCs_vectors.m
%	ABCs_logicals.m
%	shoelace.m
%	encoded.m
%	GTadmissions.m
%	evenOrOddlyLengthed.m
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
% Part of this homework is an m-file called "ABCs_strings". Open these
% files in MATLAB and complete it according to the directions contained
% within. 
%
% Files to Complete: 
%       - ABCs_vectors
%       - ABCs_logicals
% ABCs File Testing:
%  >> ABCs_hw03_pretest
%
%==========================================================================
% PART 2. Drill Problems
%--------------------------------------------------------------------------
%
% The drill problems cover the following major topic(s):
%	functions
%
% Follow the directions carefully and make sure files names as well as
% function headers are written exactly as described in the problem text. If
% your function headers are not written as specified, then you will recieve
% an automatic zero for the problem.
%
% All drill problems must be functions (i.e. contain valid function
% headers).  Any scripts turned in will be given a 0 automatically.
%
%==========================================================================
% PROBLEM 1.  If the shoe fits... 
%--------------------------------------------------------------------------
%
% Function Name: shoelace
% Inputs  (2): - (double) A vector of x coordinates
%              - (double) A vector of y coordinates
% Outputs (1): - (double) The area of the polygon defined by the inputs
%
% Function Description:
%	Given pairs of x and y coordinates defining a simple polygon, write a
%	function shoelace that computes and outputs the area of this polygon.
%
%   In order to do this, you will be implementing the shoelace algorithm.
%   This algorithm works by lining up your x coordinates in a column and
%   your y coordinates in a column next to it. Then, you multiply numbers
%   diagonally so that the first x value is multiplied by the second y
%   value, the second x value is multiplied by the third y value, and so on
%   until the last x value is multiplied by the first y value. You take the
%   sum of these numbers. Let's call this sum1. Then, the process is
%   repeated so that the first y value is multiplied by the second x
%   value, the second y value is multiplied by the third x value, and so on
%   until the last y value is multiplied by the first x value. You take the
%   sum of these numbers. Let's call this sum2. The area in the polygon is
%   then half the positive difference between sum1 and sum2. Or:
%
%                               |sum1 - sum2|/2
%
%   The shoelace method is named so because of the diagram you make when
%   computing it, as approximated in ascii below for a triangle.
%                                  X  Y
%                                  1  3
%                                   \/
%                                   /\  
%                     6 <=(3*2) <- 2  7  -> (1*7)=>  7
%                                   \/
%                                   /\
%                    28 <=(7*4) <- 4  1 -> (2*1)=>   2
%                                   \/
%                                   /\
%                     1 <=(1*1) <- 1  3 -> (4*3)=>  12
%                   ----------------------------------
%             Sums:  35                             21
%
%                   area = (35 - 21)/2 = 7
%
%   Looks kind of like a shoe with laces, right? In this example, a
%   triangle with x coordinates [1, 2, 4] and corresponding y coordinates
%   [3, 7, 1] is determined to have area 7.
%
%
% Notes:
%	- You are guaranteed to have at least 3 pairs of x and y coordinates.
%	  There may be more
%   - Wikipedia has a decent page on this:
%     http://en.wikipedia.org/wiki/Shoelace_formula
%   - You are also guaranteed that the points will be ordered either
%     clockwise or counterclockwise around the polygon (Basically all this
%     means is that the points we give you can be used for the shoelace
%     method)
%
% Hints:
%	- You may find abs() useful
%   - Remember that .* performs an element-by-element multiplication; this
%     could help you a lot in this problem.
%
% Test Cases:
%
%       [area1] = shoelace([1,2,4], [3,7,1]);
%           => area1 = 7
% 
%       [area2] = shoelace([-22, 7, 12, 4], [0, -1, 6, 24])
%           => area2 = 434           
% 
%       [area3] = shoelace([1, 5, -10, 2], [1, 6, -2, 1])
%           => area3 = 23
% 
%
%==========================================================================
% PROBLEM 2.   If something exists, there's a cipher for it.
%--------------------------------------------------------------------------
%
% Function Name: encoded
%
% Inputs  (2): - (double) A 1xN vector
%              - (double) A number that might be encoded into the vector
%
% Outputs (1): - (logical) A 1x4 vector of true/false values, showing
%                          whether or not the number is encoded into the
%                          vector in the 4 described ways.
%
% Function Description:
%   Write a function that takes in two inputs: a vector of any length, and
%   a number. Your function needs to check if the number is "encoded" into
%   the vector in any of 4 possible ways. These are as follows:
%
%       1) The number is actually contained in the vector.
%               ex1: [7 9 4] is the vector, and 4 is the number.
%               ex2: [5 9 7 3 2] is the vector, and 9 is the number.
%
%       2) The number is the distance between all adjacent values in the vector.
%               ex1: [3 6 9 12] is the vector, and 3 is the number.
%               ex2: [0 5 10 15] is the vector, and 5 in the number.
%               ex3: [4 5 6 7] is the vector, and 1 is the number.
%              
%       3) The number is the same as the sum of all the values in the
%          vector.
%               ex1: [1 2 3 4] is the vector, and 10 is the number.
%               ex2: [0 0 1 1 2 2] is the vector, and 6 is the number.
%
%       4) Every value in the vector is divisible by the number.
%               ex1: [3 6 21 99999] is the vector, and 3 is the number.
%               ex2: [16 20 8] is the vector, and 4 is the number.
%
%   Your function should output a 1x4 logical vector of the true/false
%   values for the above encodings that you need to check, with each index
%   of your output corresponding to the numbers above.
%
%   Your function is simply checking an inputted vector and inputted number
%   to see if the "encoding" exists already. And the possible ways for
%   encoding to exist are the 4 ways described above. For example: If your
%   inputted number is actually contained in your inputted vector, then the
%   first index of your logical output vector will be a True (because this
%   is the 1st check on the list above). If the inputted number is not the
%   distance between all adjacent values in the inputted vector, then the
%   2nd index of your logical output vector will be False (because this is
%   the 2nd check on the list above). Etc.
%
% Notes:
%   - Treat 0 as being divisible by everything.
%
% Hints:
%   - mod() also works with vectors
%   - all() could be quite useful
%   - This is a Logicals problem, not a Vectors problem.
%
% Test Cases:
%
%       [out1] = encoded([-1 0 1 2], 1)
%           => out1 = [1 1 0 1]
%              %must be Logical class
%   
%       [out2] = encoded([14 21 28 35], 7)
%           => out2 = [0 1 0 1]
%              %must be Logical class
%
%       [out3] = encoded([1.1 1.2 1.3 1.4], 5)
%           => out3 = [0 0 1 0]
%              %must be Logical class
%
%
%==========================================================================
% PROBLEM 3.   I love college
%--------------------------------------------------------------------------
%
% Function Name: GTadmissions
%
% Inputs  (3): - (double) A 1x3 vector of an applicant's GPA, SAT score, and
%                         ACT score (in that order)
%              - (logical) True/false: whether or not the applicant was
%                          either a valedictorian or salutatorian
%              - (logical) True/false: whether of not the applicant has
%                          family at GT
%
% Outputs (1): - (logical) True/False: whether or not the applicant is
%                          accepted
%
%
% Function Description:
%   You have a lot of friends who are totally jealous that you go to
%   Georgia Tech, and that they don't, so they all want to either come here
%   as a freshmen or transfer in from whatever inferior college they
%   decided to actually attend. Since you're a nice and caring friend, you
%   decide to show off your new GT-learned matlab ability by writing a
%   function to try and predict whether or not they'll all get in!
%
%   Write a function, called GTadmissions, that takes three inputs of data
%   that would be used by the admissions office, and returns a single
%   logical output (where true corresponds to a student being accepted and
%   false respectively corresponds to rejected). The three inputs will as
%   such: (1) a 1x3 vector of numbers, representing a student's GPA, SAT
%   score, and ACT score (in that order); (2) a single true/false logical
%   value, where true means that this student was either valedictorian or
%   salutatorian of their high school; (3) a single true/false logical
%   value, where true means that this student has family who have attended
%   GT.
%
%   - An applicant will always be accepted to Georgia Tech if they meet the
%   minimum requirements for acceptance: GPA higher than or equal to 3.85,
%   SAT score higher than or equal to 2000, and ACT score higher than or
%   equal to 29.
%   - An applicant will also always be accepted if they were
%   valedictorian/salutatorian of their school, even if they do not meet
%   the minimum requirements described above.
%   - An applicant may be accepted for only meeting 2 of the 3 minimum
%   acceptance requirements described above if they have had family attend
%   GT.
%
% An Example Test Case:
%
%              accepted = GTasmissions([3.84 2001 30], false, true)
%
%   The applicant in this example test case only meets 2 of the minimum
%   requirements for acceptance (SAT score > 2000, and ACT score > 29), and
%   they were not the valedictorian or salutatorian of their high school
%   (as shown by the "false" in the second input). However, this student
%   does have family who has attended GT (as shown by the "true" in the
%   third input), and so they will still be accepted to Georgia Tech
%   despite only meeting 2 of 3 minimum requirements and not being
%   valedictorian or salutatorian. Thus, the value of "accepted" should be
%   true.
%   
%
% Notes:
%   - This problem could be much helped by clever use of the "and" and
%     "or" operators ("&" and "|" respectively).
%   - Logical data prints to the command window as either a 1 or a 0, so if
%     you're expecting a "true" and you see a "1", then you're good. If
%     you're expecting a true and you see a "0" though, then something's
%     wrong.
%
% Test Cases:
%
%       [accepted1] = GTadmissions([3.9 2000 28], false, true)
%           => accepted1 = 1
%              %must be Logical class
%
%       [accepted2] = GTadmissions([3.5 1900 28], true, false)
%           => accepted2 = 1
%              %must be Logical class
%
%       [accepted3] = GTadmissions([4.0 2400 36], false, false)
%           => accepted3 = 1
%              %must be Logical class
%
%==========================================================================
% PROBLEM 4.   Even vs. Odd
%--------------------------------------------------------------------------
%
% Function Name: evenOrOddlyLengthed
%
% Inputs  (1): - (double) Some random vector, with an even or odd length.
%
% Outputs (1): - (double) A vector of the even or odd indices of the
%                         original vector, depending on its even or odd length.
%
%
% Function Description:
%   This homework problem is straightforward to describe, but not so simple
%   to figure out: using what you know of vectors and logicals, output a
%   vector of only the odd indices of the input vector if that input's
%   length is odd. If the input's length is even, then output a vector of
%   its even indices. ("Odd indices" simply means the numbers in the 1st,
%   3rd, 5th, etc. locations in the vector, while "even indices" simply
%   means the 2nd, 4th, 6th, etc. locations.) So if your input is [1 2 3 4
%   5 6], then your output should be [2 4 6]; if your input is [1 2 3 4 5],
%   then you should output [1 3 5].
%
% Hints:
%   - Things to get you thinking: mod() function, start:step:end, index vectors. 
%
% Test Cases:
%
%       [out1] = evenOrOddlyLengthed([1:10])
%           => out1 = [2 4 6 8 10]
%
%       [out2] = evenOrOddlyLengthed([2 1 2 1 2 1 2 1 2 1 2 1 2])
%           => out2 = [2 2 2 2 2 2 2]
%
%       [out3] = evenOrOddlyLengthed([1:4:24]);
%           => out3 = [5 13 21]
%
%==========================================================================
% FINISHED!!!
%--------------------------------------------------------------------------
%
% Congratulations, you've finished this homework assignment.  Before you
% turn in your code be sure you have tested it throughly.  Once you've
% tested it you may submit it to T-square.  Be sure all files are submitted
% with the correct filenames.
