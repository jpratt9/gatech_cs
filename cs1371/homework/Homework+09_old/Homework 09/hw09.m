%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name         : <your name>
% GT Email     : <your GT email address>
% Homework     : hw09
% Course       : CS1371
% TA's Name    : <Your TA's Name>
% Section      : <Your Section>
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
%   ABCs_CellArrays.m
%   ABCs_HighLevelFileIO.m
%   ABCs_hw09_pretest.p
%   avgTemp_soln.p
%   data1.xls
%   data1Outliers_soln.xls
%   data2.xls
%   data2Outliers_soln.xls
%   data3.xls
%   data3Outliers_soln.xls
%   findOutliers_soln.p
%   hw09.m
%   moveEvaluator.p
%   receipt1.txt
%   receipt1Sheet_soln.xls
%   receipt2.txt
%   receipt2Sheet_soln.xls
%   receipt2sheet_soln.p
%   receipt3.txt
%   receipt3Sheet_soln.xls
%   rubric_hw1grades.xls
%   sortByHeader_soln.p
%   techScores.xls
%   ticTacToeTurn_soln.p
%   ticTacToe_solns.mat
%
% Files to submit:
%   hw09.m
%	ABCs_HighLevelFileIO.m
%	ABCs_CellArrays.m
%	avgTemp.m
%	sortByHeader.m
%	receipt2sheet.m
%	ticTacToeTurn.m
%	findOutliers.m
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
%       - ABCs_CellArrays.m
%       - ABCs_HighLevelFileIO.m
% ABCs File Testing:
%  >> ABCs_hw09_pretest
%
%==========================================================================
% PART 2. Drill Problems
%--------------------------------------------------------------------------
%
% The drill problems cover the following major topic(s):
%	Cell Arrays
%   High Level File IO
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
% Problem 1.  It's some weather we're having, huh?
%==========================================================================
%
% Function Name: avgTemp
%
% Inputs  (1): - (cell) a cell array containing historic temperatures
%
% Outputs (2): - (double) the average high temperature
% 			   - (double) the average low temperature
%
% Function Description:
%   What's the temperature going to be tomorrow? Write a function called 
%   "avgTemp" that will find the average high and low temperatures from a
%   cell array of historic highs and lows. The cell array will be
%   structured like so:
%
%     {'High', 80
%	   'Low',  60
%      'Low',  63
%      'High', 77
%      'Low',  55}
%   
%   There may be any number of rows, but there will always be two columns.
%   An element in the first column will be a string ('High' or 'Low'), and 
%   an element in the second column will be a number representing the
%   temperature. Your job is to output both the average high temperature
%   and the average low temperature, rounded to the nearest integer.
%
% Notes:
%   - Highs and lows may appear in any order in the cell array.
%   - Use the round() function to round your outputs.
%
% Hints:
%   - You may solve this with iteration if you want, but you can also do it
%       with logical indexing.
%   - Strcmp() can be used to compare a single string to a cell array of
%       strings, and it will return a mask in this case.
%
% Test Cases:
%
%    temps1 = {'High',99;'Low',60;'High',100;'Low',43;'Low',44;'Low',50;'High',82};
%    [high1, low1] = avgTemp(temps1)
%        high1 => 94
%        low1  => 49
%
%    temps2 = {'High',50;'Low',20;'High',51;'High',69;'Low',32;'High',55;'Low',23};
%    [high2, low2] = avgTemp(temps2)
%        high2 => 56
%        low2  => 25
%
%
%==========================================================================
% PROBLEM 2.  Sorting an Excel File
%--------------------------------------------------------------------------
%
% Function Name: sortByHeader
%
% Inputs  (2): - (char) The file name of an Excel file
%              - (char) The name of a header to sort by
%
% Outputs (1): - (cell) Cell array containing the sorted Excel data 
%
% Function Description:   
%	Given the file name of an Excel file as a first input, write a function
%	called "sortByHeader" that sorts the rows of the excel file by the data
%	in the column given by the 2nd input. If the data in the given column
%	is text, then sort it alphabetically. If the data in the given column
%	is numeric, then sort it in ascending order. Then output the sorted
%	data from the entire excel file as a cell array.
% 
% Notes:
%	- The function should work for any excel file with any number of rows
%       and columns, not just techScores.xls
%   - The header given in the 2nd input is guaranteed to always exist in
%       the excel file.
%   - The data in the column that you are to sort by will either be all
%       strings or all doubles.
%
% Hints:
%   - The sort() function can take an input of a cell array of strings, and
%       will sort the strings alphabetically.
%
% Test Cases:
%
%	x = 'techScores.xls';
%
%   scores = sortByHeader(x, 'Opponent');
%   scores => 'Opponent'              'Tech Points'    'Opponent Points'
%             'Clemson'               [         30]    [             27]
%             'Clemson'               [         39]    [             34]
%             'Duke'                  [         49]    [             10]
%             'Florida State'         [         49]    [             44]
%             'Georgia'               [         24]    [             30]
%             'Iowa'                  [         14]    [             24]
%             'Jacksonville State'    [         37]    [             17]
%             'Miami'                 [         17]    [             33]
%             'Mississippi State'     [         42]    [             31]
%             'North Carolina'        [         24]    [              7]
%             'Vanderbilt'            [         56]    [             31]
%             'Virginia'              [         34]    [              9]
%             'Virginia Tech'         [         28]    [             23]
%             'Wake Forest'           [         30]    [             27]
%
%   scores = sortByHeader(x, 'Tech Points');
%   scores => 'Opponent'              'Tech Points'    'Opponent Points'
%             'Iowa'                  [         14]    [             24]
%             'Miami'                 [         17]    [             33]
%             'North Carolina'        [         24]    [              7]
%             'Georgia'               [         24]    [             30]
%             'Virginia Tech'         [         28]    [             23]
%             'Clemson'               [         30]    [             27]
%             'Wake Forest'           [         30]    [             27]
%             'Virginia'              [         34]    [              9]
%             'Jacksonville State'    [         37]    [             17]
%             'Clemson'               [         39]    [             34]
%             'Mississippi State'     [         42]    [             31]
%             'Florida State'         [         49]    [             44]
%             'Duke'                  [         49]    [             10]
%             'Vanderbilt'            [         56]    [             31]
%
%
%==========================================================================
% Problem 3.  Ain't nobody got money for that
%==========================================================================
%
% Function Name: receipt2sheet
%
% Inputs (1):  - (char) The name of the text file to be read
%
% Outputs (0)
%
% Output Files (1): An excel file meeting the following description.
%
% Function Description:
%   Since we are all broke college kids we need to save all the money we
%   can! That doesn't always mean buying the cheapest stuff though; it's
%   all about the cheapest unit price. To help you keep track of your
%   spending, you have decided to write a Matlab function: your function
%   will take in a text file of a receipt, and print it to an excel file
%   along with the unit price of each item.
%
%   An example input txt file is shown below:
%
%   ---------------------------------- (not part of file)
%   Bananas - .5 lbs - $2.35
%   Grapes - .25 lbs - $4.29
%   Tortilla Chips - 2 units - $4.98
%   Notebook Paper - 5 units - $4.95
%   Water Bottle - 2 units - $19.98
%   Desk Lamp - 1 units - $26.95
%   ---------------------------------- (not part of file)
%
%   Notes:
%       - The item name comes first, and may be multiple words.
%       - There is always a ' - ' between important parts of information.
%       - The price is the price of all of the units. So for notebook
%         paper, the price of buying 5 units is $4.98.
%
%   The excel sheet that you output should have columns for 'Item',
%   'Quanitity', 'Unit Price', and 'Total Price' in that order. It should
%   headers for each column. You may open one of the solution excel files
%   included in this homework to see one.
%   The item, quantity and total price columns will contain exactly the
%   same as the values in the text file. The only value you will have to
%   calculate is the unit price. This price should be rounded to 2 decimal
%   places and you should only display 2 decimal places in your excel
%   sheet.
%
%   The name of the excel sheet should be the name of the receipt with
%   'sheet' appended. For example, if the name of the receipt file was
%   'bathAndBeyond.txt' the outputted Excel file would be named
%   'bathAndBeyondSheet.xls'.
%
% Notes:
%   - The unit price is always the unit price of the given units
%   - Even though the solution Excel files have '_soln' appended to them,
%       your file name shoud be exactly as described above.
%   - Write everything to your excel file as strings rather than numbers.
%   - The inputted name of a txt file is guaranteed to not have any periods
%       before the '.txt' extension.
%
% Hints:
%   - You may want to use strsplit() to delimit the text file.
%   - You can use '%.2f' instead of the typical '%d' within the sprintf
%       function to print a number to 2 decimal places. You should print
%       your prices into a string before writing to excel.
%   - Matlab's built in file-comparison tool can be weird for excel files,
%       but you may check your files by using xlsread() to read in both
%       files and then using isequaln() to compare the 'raw' outputs.
%
% Test Cases:
%
%   receipt2sheet('receipt1.txt');
%   Output File should look like: 'receipt1Sheet_soln.xls'
%
%   receipt2sheet('receipt2.txt');
%   Output File should look like: 'receipt2Sheet_soln.xls'
%
%   receipt2sheet('receipt3.txt');
%   Output File should look like: 'receipt3Sheet_soln.xls'
%
%
%==========================================================================
% Problem 4.  x's and o's and I want to know...
%==========================================================================
%
% Function Name: ticTacToeTurn
%
% Inputs  (2): - (cell) A 3x3 cell array containing a tic tac toe board.
%              - (char) A single character of 'x' or 'o', indicating whose
%                       turn it is in the tic tac toe game.
%
% Outputs (2): - (cell) A 2xN cell array of all the next possible moves,
%                       and strings describing the outcome of each move.
%
% Helper Functions (1): moveEvaluator.p
%
% Function Description:
%   Write a MATLAB function to find and evaluate the outcome of all the
%   possible next moves in a tic tac toe game. Your inputs will be a 3x3
%   cell array of a tic tac toe board that looks something like this:
%
%       { 'x' 'o' 'x'
%         'o' 'x' 'o'
%         'o' ' ' ' ' }
%
%   Spaces will represent empty spaces, and besides that, a string of 'x'
%   represents where player X has made a move and a string of 'o' indicates
%   where player O has made a move. You will also have an input of whose
%   turn it is in the tic tac toe game. Your job is to find all the next
%   possible moves for this player, let's say for the above example that
%   it's player X's turn: your 2nd input would simply be the string: 'x'.
%
%   Your function should output a 2xN cell array where the first row
%   contains cell arrays of all the next possible moves, and the second row
%   should be a string describing the outcome of the move. The player will
%   either win, or the turn will be passed onto the next player; so if it's
%   player X's turn, you can either have the string 'Player X Wins!' or the
%   string 'Your move, player O.' This output would look like this for the
%   above example:
%
%    {   { 'x' 'o' 'x'             {'x' 'o' 'x'
%          'o' 'x' 'o'              'o' 'x' 'o'
%          'o' 'x' ' '}             'o' ' ' 'x'}
%
%     'Your move, player O.'       'Player X Wins!' }
%
%
%   You are also give a helper function to help you code this problem. This
%   function has already been written, and is provided with the homework. 
%   It is called moveEvaluator, and its inputs/outputs are described below:
%
%   Helper Function Name: moveEvaluator
%   Helper Function Inputs (2): - (char) A 3x3 character array representing
%                                        a tic tac toe board, after a move
%                                        has been made.
%                               - (char) A single character of the the
%                                        player that just moved.
%   Helper Function Outputs (1): - (char) A string indicating the outcome
%                                         of the turn.
%
%   The helper function moveEvaluator takes in a 3x3 character array of a
%   tic tac toe board after a move has been made, with spaces used to 
%   represent the empty spaces on the board, and a single character of the 
%   player who just went. This 2nd input will be a string of either 'x' or 
%   'o'. This helper function will then output the outcome of that turn: if
%   it was player X's turn, then the two possible outcomes are 'Player X
%   Wins!' or 'Your turn, player O.' Similarly, if it was player O's turn,
%   then the two possible outcomes are 'Player O Wins!' or 'Your turn,
%   player X.'
%
% Notes:
%   - You are not supposed to actually write the code for the helper
%       function included; it is provided for you to call while working on
%       your ticTacToeTurn function.
%   - The .mat file provided with this homework contains variables
%       to use as inputs when running the test cases below. You should not
%       load the .mat file in your actual function, and if you do then your
%       code will error when autograded and you will receive 0 points for
%       this problem.
%   - The order that you should output all the next possible boards should
%       be the order that MATLAB would linearly index the empty spaces on the
%       board (i.e. down the columns). If you use the find function to find 
%       the empty spaces, this is taken care of for you.
%
% Test Cases:
%
%       load('ticTacToe_solns.mat') %% note: variables board1 and board2
%                                   are also contained within this .mat
%                                   file, so you do not need to copy/paste
%                                   those if you load it.
%
%       board1 = { 'x' 'o' 'x'
%                  'o' 'x' 'o'
%                  'o' ' ' ' ' }
%       move1 = 'x'
%       possibleMoves1 = ticTacToeTurn(board1,move1)
%           possibleMoves1 should be the same as possibleMoves1_soln, which
%           is a variable you may load from ticTacToe_solns.mat
%
%       board2 = { 'x' ' ' ' '
%                  ' ' ' ' ' '
%                  ' ' ' ' ' '}
%       move2 = 'o'
%       possibleMoves2 = ticTacToeTurn(board2,move2)
%           possibleMoves2 should be the same as possibleMoves2_soln, which
%           is a variable you may load from ticTacToe_solns.mat
%
%
%==========================================================================
% Problem 5.  Identify Outliers
%==========================================================================
%
% Function Name: findOutliers
%
% Inputs (1):  - (string) The name of an excel file.
%
% Outputs (0)
%
% File Outputs (1): An excel file with outliers identified.
%
% Function Description:
%   You have finally secured the illusive summer internship, and your first
%   job is to organize some data! How exciting! Since you have recently
%   become a boss at MATLAB, you decide to write a function that will do it
%   for you:
%
%   You will be identifying outliers in the data contained in an Excel
%   spreadsheet. Don't worry, MATLAB has built in functions for all the
%   analysis you need to do, but here's a brief description if you want to
%   know what's going on: Statistically, an outlier is defined as a value
%   that is 1.5 times the IQR outside of the middle 50% of the data. The
%   IQR is the difference between the 75th percentile and 25th percentile
%   of the data. So if a data value is greater than the 75th percentile of
%   the data plus 1.5*IQR, it is an outlier. Also, if it is 1.5 times the
%   IQR below the 25th percentile, it is an outlier. The conditions for a
%   single data point being an outlier are written out mathematically
%   below:
%
%       data value > 75th percentile + 1.5*IQR
%
%       data value < 25th percentile - 1.5*IQR
%
%   If one of the above conditions is true for a specific data value, then
%   that data value is an outlier. IQR here is the iqr of all the data, and
%   you can find this by using MATLAB's iqr() function. The 75% and 25%
%   percentile are the 75% and 25% percentile of the data; look up MATLAB's
%   built in pcntile() function to find these.
%
%   There are a few sets of data contained in the excel sheet you are
%   given, and when you are calculating whether a specific piece of data is
%   an outlier you should use the IQR and percentiles of only that set of
%   data. The set of data is given in the first column, and the actual data
%   values are given in the 2nd column. For example, in data1.xls (which is
%   included with this homework), there are 4 sets of data contained. These
%   4 different sets of data are different sizes, will have different IQRs,
%   and will have different percentiles. So you will need to find the IQR
%   and percentiles for each data set.
%
%   For your output excel file you should simply copy the input file but
%   add a third column for 'Outliers' (with that header). This third
%   column will simply have every data point that is an outlier reprinted
%   in it, and have an empty cell for data points that are not outliers.
%   You may open 'data1Outliers_soln.xls' to see what is meant by this.
%   
%
%   The filename of the output Excel file should be the same as the input
%   file with "Outliers" appended to the end. For example, if the input
%   file was 'trafficData.xls', the output file should be named
%   'trafficDataOutliers.xls'. The solution Excel files have '_soln'
%   appended to them so that your function doesn't overwrite them, but your
%   filenames should adhere to the guidelines described here.
%
% Notes:
%   - Use the iqr() and prctile() functions. You do not have to try to
%       write your own!
%   - Make sure your Excel files match the solution files EXACTLY!
%   - The data set number in the first column is not guaranteed to increase
%       by 1 each time, so you may have data sets 1, 3, and 5. But each
%       data set will always be self-contained. As in, you won't have a
%       random value from data set 3 right in the middle of data set 5.
%
% Hints:
%   - To represent a blank cell in excel, your input cell array to
%       xlswrite() should have NaN (not a number) for that index. You can
%       create an array of NaN's using the NaN() function.
%   - The num2cell() function may be useful when you get ready to write
%       your data to the Excel file.
%   - The built in functions that MATLAB has for iqr() and prctile() can
%       be very useful in the ISYE/MATH 3770 course that all engineers have
%       to take at GT, so you would do well to remember that MATLAB has
%       them.
%   - MATLAB's built in file-comparison tool can be weird for excel files,
%       but you may check your files by using xlsread() to read in both
%       files and then using isequaln() to compare the 'raw' outputs.
%
% Test Cases:
%
%       findOutliers('data1.xls');
%           Output file should look like: data1Outliers_soln.xls
%
%       findOutliers('data2.xls');
%           Output file should look like: data2Outliers_soln.xls
%
%       findOutliers('data3.xls');
%           Output file should look like: data3Outliers_soln.xls
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
