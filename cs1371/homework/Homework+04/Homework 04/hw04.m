%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name         : John Pratt
% GT Email     : jpratt9@gatech.edu
% Homework     : hw04
% Course       : CS1371
% TA's Name    : Nick Fahrenkrog/Edward Foyle
% Section      : B05
% Collaboration: I worked on the homework assignment alone, using
%                only course materials.
%
% Files provided with this homework:
%   hw04.m
%   ABCs_arrays
%   ABCs_masking
%   ABCs_hw04_pretest.p
%	voltageFilter_testCases.mat
%   erosion_soln.p
%   myFind_soln.p
%   vectorVortex_soln.p
%   voltageFilter_soln.p
%   barrelShiftArray_soln.p
%
% Files to submit:
%   hw04.m
%	ABCs_arrays.m
%   ABCs_masking.m
%	erosion.m
%	myFind.m
%	vectorVortex.m
%	voltageFilter.m
%	barrelShiftArray.m
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
% Part of this homework is an m-file called "ABCs_arrays". Open these
% files in MATLAB and complete it according to the directions contained
% within. 
%
% Files to Complete: 
%       - ABCs_arrays.m
%       - ABCs_masking.m
% ABCs File Testing:
%  >> ABCs_hw04_pretest
%
%==========================================================================
% PART 2. Drill Problems
%--------------------------------------------------------------------------
%
% The drill problems cover the following major topic(s):
%	Arrays
%   Masking
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
% PROBLEM 1.   Geology 101
%--------------------------------------------------------------------------
%
% Function Name: erosion
% Inputs  (3): - (double) An MxN array representing the heights of the
%                         topsoil in a particular area
%              - (double) An MxN array representing the heights of the
%                         bedrock in the same area underneath the topsoil 
%              - (double) An erosion factor
% Outputs (1): - (double) An MxN array representing the new heights of the
%                         topsoil with the applied erosion factor
%
% Function Description:
%   Write a function that takes in arrays representing the heights of
%   topsoil and bedrock of the same area and an erosion factor, and outputs
%   the new heights of topsoil with the applied erosion factor. Assume
%   that the topography is uniformly eroded by subtracting the erosion
%   factor from each element of the topsoil array. Since topsoil erodes 
%   much more easily than bedrock, the erosion factor can completely erode
%   the topsoil but should not affect the bedrock.
%   For example, for a particular spot that has a topsoil of 34, bedrock of
%   10, and erosion factor of 26, the new height should be 10 and not 8.
%
% Notes: 
%   - Topsoil and bedrock arrays are guaranteed the same size
%
% Hints:
%   - Logical indexing might be useful
%
% Test Cases:
%
%       topsoil1 = [20 30 40; 41 21 32;40 25 20];
%       bedrock1 = [10 9 11; 12 15 13; 11 9 13];
%       factor1 = 8;
% 
%       out1 = erosion(topsoil1, bedrock1, factor1)
%           out1 => [12 22 32
%                    33 15 24
%                    32 17 13]
%
%       topsoil2 = [100 107 95; 105 106 90; 115 103 82];
%       bedrock2 = [50 50 50; 50 50 50; 50 50 50];
%       factor2 = 54;
%
%       out2 = erosion(topsoil2, bedrock2, factor2)
%           out2 => [50 53 50
%                    51 52 50
%                    61 50 50]
%
%
%==========================================================================
% PROBLEM 2.   matlab finder to find that matlab
%--------------------------------------------------------------------------
%
% Function Name: myFind
%
% Inputs  (1): - (logical) A 2-Dimensional mask.
%
% Outputs (1): - (double) A 1xN vector of the column-wise indices where the
%                         input mask was "true".
%
%
% Function Description:
%   Write a matlab function that imitates the built-in find() function.
%   Your function should take in a 2-dimensional mask of any size, and
%   output a vector of the indices of where the mask was "true". Use the
%   indices of the array as they count down the columns and then across the
%   rows. For example:
%
%               input: [true false
%                       true  true]
%
%               output: [1 2 4]
%                       
%
% Notes:
%   - You may NOT use the find() function! Any submissions using find()
%     will receive 0 credit.
%
% Test Cases:
%
%       mask1 = [true true true; true false false; true true false];
%       [out1] = myFind(mask1)
%           out1 => [1 2 3 4 6 7]
%
%       mask2 = [true true; true false; false false; true false; true true];
%       [out2] = myFind(mask2)
%           out2 => [1 2 4 5 6 10]
%
%       mask3 = [false false false false false; true false false false false];
%       [out3] = myFind(mask3)
%           out3 => [2]
%
%
%==========================================================================
% PROBLEM 3.   Vector Vorticity
%--------------------------------------------------------------------------
%
% Function Name: vectorVortex
%
% Inputs  (3): - (double) The number, n, of rows of the array
%              - (double) The number, m, of columns of the array
%              - (double) A vector of numbers
%
% Outputs (1): - (double) The vortex array
%
% Function Description:
%   Write a function called vectorVortex that creates a "vortex" of an
%   input vector. Starting with the top left corner of a n x m array, the
%   vector should create a clockwise border around the array. Then, create
%   an inner clockwise border such that a layer of zeros exists between the
%   outside and inside border. The example below illustrates this. Notice
%   that 
%
%   For example:
%      Given a vector, [1 2 3 4 5 6 7 8 9 10 11 12 ... 30 31 32], and the
%      dimensions 7 x 7:
%
%           out = vectorVortex(7,7,1:32)
%              out => [ 1     2     3     4     5     6     7
%                      24     0     0     0     0     0     8
%                      23     0    25    26    27     0     9
%                      22     0    32     0    28     0    10
%                      21     0    31    30    29     0    11
%                      20     0     0     0     0     0    12
%                      19    18    17    16    15    14    13]
%
% Notes: 
%   - The zeros function may be helpful.
%   - The vector you need will always be the necessary length.
%   - The dimensions of the array will always be large enough to fit the
%     vortex (the inner and outer borders).
%
% Test Cases:
%
%       out1 = vectorVortex(7,9,2:2:80)
%           out1 =>    [ 2     4     6     8    10    12    14    16    18
%                       56     0     0     0     0     0     0     0    20
%                       54     0    58    60    62    64    66     0    22
%                       52     0    80     0     0     0    68     0    24
%                       50     0    78    76    74    72    70     0    26
%                       48     0     0     0     0     0     0     0    28
%                       46    44    42    40    38    36    34    32    30]
%
%       out2 = vectorVortex(6,6,1:24)
%           out2 => [ 1     2     3     4     5     6
%                    20     0     0     0     0     7
%                    19     0    21    22     0     8
%                    18     0    24    23     0     9
%                    17     0     0     0     0    10
%                    16    15    14    13    12    11]
%
%
%
%==========================================================================
% PROBLEM 4.   Matlab: Engineering Applications 101
%--------------------------------------------------------------------------
%
% Function Name: voltageFilter
%
% Inputs  (3): - (double) An array of voltage readings from an array of
%                         electrical sensors at time = 1 second.
%              - (double) The voltages of the same array of sensors, but at
%                         time = 2 seconds.
%              - (double) The voltages of the same array of sensors, but at
%                         time = 3 seconds.
%
% Outputs (2): - (double) An array of filtered and averaged voltage data.
%              - (double) An array telling you what to fix: 0's where
%                         sensors are fine, 1's where a sensor encounted a
%                         "random spike", and 2's where a sensor is
%                         defective.
%
%
% Function Description:
%   Imagine you are an engineer using an array of piezo-electric sensors to
%   convert strain in a material to voltage signals, and thus study this
%   material's response to external loads. If none of that last sentence
%   made sense, then don't worry, I'll walk you through the function you
%   need to write:
% 
%   Your inputs will be three arrays of the same size, where each array
%   represents voltage readings from your array of sensors (so the top left
%   index of the array is the voltage reading of the top-left sensor). The
%   reason there are three input arrays is because each array is the
%   voltage readings at a different point in time. **The main  goal of the
%   function is to output an array of the mean-voltage with respect to time
%   at each location (as in: an array that is the average of the three input
%   arrays).** In doing this, you will need to filter reasonable voltage
%   readings from values that are too small to matter, and values that are
%   too large to be realistic. There are also two other things your function
%   needs to do: (1) find where a sensor gave the exact same voltage
%   reading for all three points in time (i.e. if the top left value for
%   all three inputs is the exact same). This means that the sensor is
%   defective and will need to be replaced. (2) Output an array to help you
%   fix what needs to be fixed. In real life this array could be used to
%   help you go replace defective sensors and re-calibrate sensors that
%   recorded voltages that are way too high.
% 
%   List of things your function needs to do:
%
%       -Find any locations in the size of the array that have the exact
%        same value for all three inputs. (example: if the top left corner
%        of all three inputs is the same exact value, then the top left
%        corner would be one of these locations)
%
%       -Filter out "random noise". "Random noise" simply means that the
%        voltage reading from a specific sensor is really really small. So
%        these will be any values in your inputs that are less than 1. (None
%        of these locations will coincide with the exact-same-value
%        locations described in last bullet point.) Set these locations to
%        0. A sensor experiencing "random noise" will experience random
%        noise at all points in time, so these locations will be consistent
%        from input to input.
%
%       -Filter out "random spikes". To do this, you will have to find the
%        average value of all three input arrays independently, and find
%        locations in the input arrays where the value there is more than 3
%        times that array's average. Set these locations to 0 in each
%        array. Also: Save these locations as you will need them later,
%        even if there was only a random spike in one of the inputted
%        arrays.
%
%       -Now that your data has been filtered, it's time to average the
%        three input arrays together to find the mean-voltage of every
%        sensor. (An array that is the average of the three inputs.) This
%        is the main point of the function.
%
%       -Once you do that, you can find the overall average voltage. As in:
%        find an array that is the average of the three inputted arrays, as
%        described in the last bullet point, and then find the average
%        value of this average-array. You will need to exclude 0's from
%        this average calculation. You will use this overall average value
%        to replace the mean-voltage reading from locations with defective
%        sensors or that encountered "random spikes". You will then have
%        your first output.
%
%       -Finally, you will need an array of what to fix. This should be an
%        array of 0's, 1's, and 2's. Remember how you had to find locations
%        of defective sensors that had the exact same value for all three
%        inputs? Those will be 2's in this array. Remember how you had to
%        find locations that encountered "random spikes" of really really
%        high voltages? Those will be 1's in this array. Besides that,
%        the rest of this array will be 0's. This is your second output.
%
% Example (with vectors instead of arrays):
%
%   volts1 = [.23 .45 27 29 25 29 .76 .45];
%   volts2 = [.19 .39 29 30 25 100000 .5 .1];
%   volts3 = [.87 .24 28 31 25 25 .37 .4];
%
%   The value of 100000 in volts2 would be an example of a "random spike".
%   The first two values and last two values in each vector are examples of
%   "random noise". The location in the vectors with the value of 25 for
%   all three is an example of a "defective sensor". The two outputs of
%   this function would be:
%
%   out1 = [0 0 28.0000 30.0000 25.2500 25.2500 0 0]
%   out2 = [0 0 0 0 2 1 0 0]
%
% Notes:
%   - You may assume that all "random noise" voltage readings will be
%     different (i.e. you don't need to worry about these sensors being
%     defective).
%
% Test Cases:
%
%       load('voltageFilter_testCases.mat')
%       
%       [filtered1, needToFix1] = voltageFilter(volts11, volts12, volts13)
%
%            filtered1 => [      0       0       0       0       0
%                          13.7296 14.6667 14.3333 13.7296 14.6667
%                          13.7296 16.6667 13.7296 15.0000       0]
%
%            needToFix1 => [0 0 0 0 0
%                           1 0 0 2 0
%                           2 0 1 0 0]
%
%
%       [filtered2, needToFix2] = voltageFilter(volts21, volts22, volts23)
%
%            filtered2 => [505.3333 502.3333 493.2500 498.6667
%                          489.0000        0        0 504.0000
%                          493.2500        0        0 493.2500
%                          500.3333 482.0000 493.2500 500.0000]
%
%            needToFix2 => [0 0 2 0
%                           0 0 0 0
%                           1 0 0 2
%                           0 0 2 0]
%
%
%==========================================================================
% PROBLEM 5.  EXTRA CREDIT - EXTRA CREDIT - EXTRA CREDIT - EXTRA CREDIT
%--------------------------------------------------------------------------
%
% Function Name: barrelShiftArray
%
% Inputs  (2): - (double) An array
%              - (double) A number of times to shift the array
%
% Outputs (1): - (double) The shifted array
%
% Function Description:
%
%
%   Write a function called "barrelShift" that takes in an array and a
%   number of times to shift the array, and outputs the hifted array. Each
%   time the array is shifted, it snakes around by going down the columns.
%   If a number is on the last row of the column, it then shifts to the
%   first row of the next column. If it is the last row of the last column,
%   it then shifts to the first row of the first column. For example, if
%   you have an array that looks like this:
%
%                 arr =  [10 11 12 13
% 						  14 15 16 17
% 						  18 19 20 21]
%
%   it will look like this after you perform a barrel shift:
%
%                           1 time:  [21 18 19 20
%									  10 11 12 13 
%                                     14 15 16 17]
%
%                           2 times: [17 14 15 16
%									  21 18 19 20 
%                                     10 11 12 13]
%
%                           3 times: [13 10 11 12
%									  17 14 15 16 
%                                     21 18 19 20]
%
%                           4 times: [20 21 18 19
%									  13 10 11 12 
%                                     17 14 15 16]
% 
%   Basically, every time you do one barrel shift the array is shifted down
%   the rows and across the columns to the right. The number at the end is
%   moved to the front position. This process is repeated for the number of
%   shifts specified. If the number of shifts is negative, then the vector
%   should be barrel shifted to the left instead of the right.
%
% Notes:
%   - If the number of shifts is zero, then the function should return the
%     original array.
%   - You may *not* use the function 'circshift'
%
% Hints:
%   - Remember if you try to index out of an array's boundary or index 
%     with a negative number, it will produce an error.
%   - You may find the mod(), reshape(), and size() functions useful. And
%     think of it as one big shift instead of multiple single shifts.
%
% Test Cases:
% 	A = [4 5 6 7 8];
%   B = [1 5; 2 6; 3 7; 4 8];
%   C = [2 10 5 7; 1 12 8 6; 3 4 9 11];
%
%   shifted1 = barrelShiftArray(A, 2);
%       shifted1 => [7 8 4 5 6]
%
%   shifted2 = barrelShiftArray(B, 5);
%       shifted2 => [4  8
%                    5  1
%                    6  2
%                    7  3]
%
%   shifted3 = barrelShiftArray(C, 33);
%       shifted3 => [10  5  7  2
%                    12  8  6  1
%                     4  9 11  3]
%
%   shifted4 = barrelShiftArray(C, -3);
%       shifted4 => [10  5  7  2
%                    12  8  6  1
%                     4  9 11  3]
%
%==========================================================================
% FINISHED!!!
%--------------------------------------------------------------------------
%
% Congratulations, you've finished this homework assignment.  Before you
% turn in your code be sure you have tested it throughly.  Once you've
% tested it you may submit it to T-square.  Be sure all files are submitted
% with the correct filenames.
