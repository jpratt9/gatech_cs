%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name         : <John Pratt>
% GT Email     : <jpratt9@gatech.edu>
% Homework     : hw11
% Course       : CS1371
% Instructor   : Omojokun, Olufisayo
% Lecture Time : MWF <2:00>
% TA's Name    : <Edward Foyle, Nick Fahrenkrog>
% Section      : <B05>
% Collaboration: <"I worked on the homework assignment alone, using
%                  only course materials.">
%
% Files provided with this homework:  
%   hw11.m
%	volunteer_soln.p
%	costumeParty_soln.p
%	sumFib_soln.p
%	stringFilter_soln.p
%	cornMaze_soln.p
%   cornMaze_tutorial.m
%   costumeItems.mat
%   mazes.mat
%
% Files to submit:
%   hw11.m
%	volunteer.m
%	costumeParty.m
%	sumFib.m
%	stringFilter.m
%	cornMaze.m
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
% Problem 2.  "I volunteer as Tribute!"
%==========================================================================
%
% Function Name: volunteer
%
% Inputs (1):  - (cell) A 1xN cell array of names
%
% Outputs (1): - (char) The name of the final tribute
%
% Function Description:
%   You live in one of the districts of Panem and the most terrible time 
%   of year has come: the Reaping.  Whether you're in a lower numbered 
%   district where everyone wants to be a hero, or a higher numbered 
%   district where everyone has a savior complex, it's guaranteed that all 
%   citizens (listed in the input cell array) will volunteer. To keep the 
%   chaos under control, citizens are given the opportunity to volunteer in 
%   alphabetical order, which means that the person with the last name in 
%   alphabetical order will be attending the Hunger Games! It is your job 
%   to recursively figure out who will be attending in the form of an
%   output.
%
% Notes:
%   - You *must* use recursion in this problem. Submissions not using
%     recursion will receive 0 credit.
%   - Use of the function sort() is not allowed. Submissions using sort
%     will receive 0 credit.
%   - It is guaranteed that the first letter of each name will be
%     different (this means you would only have to compare the first
%     letter of each name).
%
% Hints:
%   - Remember that ASCII values can be compared numerically.
%
%   
%               MAY THE ODDS BE EVER IN YOUR FAVOR!
%
%  Test Cases:
%
%   Dist11 = volunteer({'Chaff', 'Seeder', 'Rue', 'Thresh'})
%       Dist11 => 'Thresh'
%
%   Dist12 = volunteer({'Peeta', 'Katniss', 'Gale', 'Haymitch'})
%       Dist12 => 'Peeta'
%
%   Dist3 = volunteer({'Mags', 'Finnick', 'Annie'})
%       Dist3 => 'Mags'
%
%
%==========================================================================
% Problem X.  "Why are you dressed so scary?"
%==========================================================================
%
% Function Name: costumeParty
%
% Inputs  (2): - (cell)   a cell array containing items and their prices
%              - (double) your budget for Halloween costume items
%
% Outputs (2): - (cell)   a cell array containing the items you bought
%              - (double) the amount of money you have left over
%
% Function Description:
%   You have been invited to a wacky Halloween costume party, and you want
%   dress to impress, but you are a student on a budget. Write a function
%   called "costumeParty" that will find the wackiest costume you can
%   afford. Given a cell array of costume items and their prices, your
%   function must recursively add the cheapest item to your costume until
%   you can no longer afford any of the items. Your function must also
%   compute how much money you have left over after your shopping spree.
%   
%   The first column of the input cell array contains item names, and the
%   second column contains prices. The output cell array must be vertical,
%   ordered by price with the first row containing the name of the cheapest
%   item you bought and the last row containing the name of the most
%   expensive.
%
% Notes:
%   - You MUST use recursion to solve this problem. Submissions not using
%     recursion will receive 0 credit.
%   - You CANNOT use the sort() function. Submissions using the sort()
%     function will receive 0 credit.
%   - No two items will have the same price.
%
% Hints:
%   - If you are having trouble computing the second output, consider what
%     the value should be when you reach the terminating condition.
%   - You are not guaranteed to run out of money before you have bought
%     everything in the cell array. Thusly, there are 2 possible terminating
%     conditions for this problem.
%
% Test Cases:
%
%   load costumeItems.mat;
%   
%   [costume1, leftover1] = costumeParty(costumeItems, 5);
%     costume1 => {'Fingerless Gloves'
%                  'Vampire Fangs'
%                  'Lizard Leggings'
%                  'Cowboy Boots'
%                  'Feather Boa'      }
%     leftover1 => 0.47
%
%   [costume2, leftover2] = costumeParty(costumeItems, 25);
%     costume1 => {'Fingerless Gloves'
%                  'Vampire Fangs'
%                  'Lizard Leggings'
%                  'Cowboy Boots'
%                  'Feather Boa'
%                  'Mermaid Tail'
%                  'Ghostface Mask'
%                  'Indoor Sunglasses'
%                  'Sushi Chef Headband'
%                  'Adult-sized Teletubby Onesie'
%                  'Ash Ketchum's Baseball Cap'
%                  'Assorted Glow Sticks'        }
%     leftover1 => 1.52
%
%==========================================================================
% Problem 5.  So much candy
%==========================================================================
%
% Function Name: sumFib
%
% Inputs (1):  - (double) An integer of the number of houses visited.
%
% Outputs (1): - (double) The number of pieces of candy you will have.
%
% Function Description:
%   Instead of trick-or-treating through the rough-and-tumble hoods of
%   Atlanta, you have opted for the safer and much more contrived hoods of
%   Mathland. In Mathland, none of the houses giving out candy want to be
%   outdone by any of the houses before them, so each house gives you as
%   much candy as the previous two houses combined. The first two houses
%   each give you one piece of candy. You want to write a function that
%   takes an input of the number of houses visited and outputs the total
%   pieces of candy you have recieved (spoiler: it's a lot).
%
%   You may have noticed that this is just the sum of the first n Fibonacci
%   numbers, where n is the number of houses you have visited.
%
% Notes:
%   - You *must* use recursion to solve this problem. Submissions not using
%     recursion will receive 0 credit.
%   - You may want to have one function that adds the Fibonacci numbers and
%     a helper function that calcuates the nth Fibonacci number.
%
%
% Test Cases:
%   out1 = sumFib(3);
%   out1 = 4;
%
%   out2 = sumFib(10);
%   out2 = 143;
%
%   out3 = sumFib(28);
%   out3 = 832039
%
%==========================================================================
% PROBLEM 4. Filter that junk!
%--------------------------------------------------------------------------
%
% Function Name: stringFilter
%
% Inputs  (1): - (cell) A cell array to be filtered.
%
% Outputs (1): - (char) All of the strings from the input cell array
%                       concatenated into a single string.
%
% Function Description:
%   Write a function called stringFilter to recursively filter all the
%   strings out of a cell array. The cell array will contain elements of
%   class double, cell, char, or logical, and will contain irregular depths 
%   of nested cells. Your function needs to concatenate all the strings in 
%   the cell array into a single output string, where the strings from the 
%   cell array are concatenated in the order that they appear in the input 
%   cell array (i.e. the order they appear in from left to right in the 
%   string).
%
%   For example, consider the cell array:
%
%     {'This' {{{[1:5] true} {' '}} {'is '} false true} 'an example.'}
%
%   Notice that the cell array is 1x3:
%
%     {'This' {{{[1:5] true} {' '}} {'is '} false true} 'an example.'}
%     |-Ind1-|----------------Index 2------------------|---Index 3---|
%
%   Index 2 of this cell array is another complicated cell array that will
%   will need to be recursively filtered. Also notice that there are 4
%   strings contained in this cell array: 'This', ' ', 'is ', and 'an
%   example.' Your function should filter through the cell array, and
%   concatenate the strings contained within into a single string in the
%   order that they appear. So for the above example, the output of your
%   function should be: 'This is an example.'
%
% Notes:
%   - You should not put spaces or any other characters between each
%     addition to the output string. Simply concatenate the strings as they
%     appear in the cell array.
%   - There will not be any structures contained within the cell array.
%
% Hints: 
%   - You must use recursion. Not because you have to for the homework, but
%     because you can't solve this problem otherwise.
%   - Consider combining iteration and recursion.
%
% Test Cases:
%
%       cA1 = {'This' {{{[1:5] true} {' '}} {'is '} false true} 'an example.'};
%       [filtered1] = stringFilter(cA1)
%           filtered1 => 'This is an example.'
%
%       cA2 = {{{{'I told '} 5:25 'her she'} {} [] [] ' knows'} '/take aim and reload'};
%       [filtered2] = stringFilter(cA2)
%           filtered2 => 'I told her she knows/take aim and reload'
%
%==========================================================================
% PROBLEM #.  <insert corny pun here>  EXTRA CREDIT  EXTRA CREDIT  EXTRA CR
%--------------------------------------------------------------------------
%
% Function Name: cornMaze
%
% Inputs  (1): - (cell) A cell array representing a map of a corn maze
%             
% Outputs (2): - (char) A string describing the outcome of your escape
%              - (double) Number of scares you will encounter in the maze
%                          
% Function Description:
%       Instead of slaving tirelessy on this problem for hours, you should 
%   go to an actual haunted corn maze with your friends because THIS IS A
%   BONUS PROBLEM. But hey, if you've got the time... this problem's pretty
%   a-maize-ing!
%
%       Write a recursive function called "cornMaze" that attempts to find
%   an unbroken path from the top left corner of a haunted corn maze, 
%   represented by the input cell array, to the bottom right corner. The 
%   cells in the cell array will contain 1 of 3 possible characters:
%       1) 'P', representing an open path
%       2) 'C', representing a bunch of corn stalks you can't go through
%       3) 'Z', representing a dressed-up live actor very skilled at
%          scaring people and is in an open path.
%
%       Starting at the top left corner at postion (1,1), your function
%   will attempt to find adjacent paths. Because the haunted corn maze is
%   very dark, you will have no idea where you're going and will always
%   attempt to find a new path in this order of directions from your
%   current position:
%       1) Down
%       2) Right
%       3) Up
%       4) Left
%
%       Your function's first output will either be the string 'Escaped!'
%   if you successfully reach the bottom right corner through consecutive
%   adjacent paths, or the string 'Trapped!' if you don't.
%
%       Also, because it's very dark, you won't be able to see the live
%   actors ahead unless you're in the same position as them, at which point
%   they've already scared you. Your function's second output will be a
%   tally of how many "scares" you encounter (i.e. how many times you come
%   across 'Z')
%
%   Notes:
%     - Your function MUST USE RECURSION, however, the recursion can be in
%       a helper function, not your main function.
%     - The starting position is guaranteed to be 'P'.
%     - A 'Z' acts like an open path for the purposes of traversing the
%       maze, it simply adds 1 to your scare count.
%     - The number and locations of live actors can vary, and they can only
%       scare you once.
%     - A 'P' or a 'Z' may occur along the edge of the maze, but it will 
%       only be considered the exit to the maze if it is located at the
%       bottom right corner.
%
%   Hints:
%     - You can generate additional mazes faster using Excel and xlsread()
%       if you want to create additional test cases.
%     - Check out cornMaze_tutorial.m for a skeleton code of a typical 
%       approach to this kind of problem!
%       
%
% Test Cases:
%
%   load('mazes.mat');
% 
%   [out1 scares1] = cornMaze(maze1);
%       out1 => 'Escaped!'
%       scares1 => 0
%
%   [out2 scares2] = cornMaze(maze2);
%       out2 => 'Escaped!'
%       scares2 => 3
%
%   [out3 scares3] = cornMaze(maze3);
%       out3 => 'Escaped!'
%       scares3 => 1
%
%   [out4 scares4] = cornMaze(maze4);
%       out4 => 'Trapped!'
%       scares4 => 1
%
%==========================================================================
% FINISHED!!!!!!!!!!!!!
%--------------------------------------------------------------------------
%
% Congratulations, you've finished this homework assignment.  Before you
% turn in your code be sure you have tested it throughly.  Once you've
% tested it you may submit it to T-square.  Be sure all files are submitted
% with the correct filenames.