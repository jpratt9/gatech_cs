%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name         : <John Pratt>
% GT Email     : <jpratt9@gatech.edu>
% Homework     : hw10
% Course       : CS1371
% Section      : <B05>
% Collaboration: "I worked on the homework assignment alone, using
%                only course materials."
%
% Files provided with this homework:
%   ABCs_hw10_pretest.p
%   ABCs_structureArrays.m
%   ABCs_structures.m
%   hw10.m
%   molarMass_soln.p
%   myStruct_soln.p
%   myStruct_testCaseSolns.mat
%   pandoraSongs.mat
%   pandora_soln.p
%   periodicTable.mat
%   phase2Registration_soln.p
%   phase2Registration_testCaseInputs.mat
%   smarterThan5thGrader_soln.p
%   smarterThan_testCases.mat
%
% Files to submit:
%   hw10.m
%	ABCs_structures.m
%   ABCs_structureArrays.m
%	myStruct.m
%	phase2registration.m
%	molarMass.m
%	smarterThan5thGrader.m
%	pandora.m
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
% Part of this homework are two m-file called "ABCs_<topic>". Open these
% files in MATLAB and complete it according to the directions contained
% within. 
%
% Files to Complete: 
%       - ABCs_structures.m
%       - ABCs_structureArrays.m
% ABCs File Testing:
%  >> ABCs_hw10_pretest
%
%==========================================================================
% PART 2. Drill Problems
%--------------------------------------------------------------------------
%
% The drill problems cover the following major topic(s):
%	Structures
%   Structure Arrays
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
% Problem 1.  Welcome to Structures.
%==========================================================================
%
% Function Name: myStruct
%
% Inputs  (1): - (cell) A 1xN cell array containing fieldnames and data
%
% Outputs (1): - (struct) The contents of the cell array in structure form.
%
% Function Description:
%   Write a function that creates a structure from a given cell array. The
%   cell array will be formatted as such:
%
%   inCellArr = { <field 1 name> , {cell array of field 1 contents},
%   <field 2 name>, {cell array of field 2 contents}, <field 3 name>, {
%   cell array of field 3 contents}, <field 4 name>, ... }
%
%   You should take this cell array and create a structure array with
%   fields given by the strings in the oddly-numbered indices, and with
%   field contents given by the field content cell arrays in the subsequent
%   evenly-numbered indices. Each element in the field content cells should
%   be stored individually in the corresponding index of the structure
%   (i.e. if the field content cell arrays are 1xN, then your output
%   structure should be 1xN). The field content cell arays will all be the
%   same size, with the singular exception of a 1x1 cell. In this case,
%   that single element should be assigned to that field name for every
%   index of the structure (i.e. if your structure is 1xN, then all N
%   elements for this field will be the same piece of data, which was the
%   contents of the singular cell).
%
% Guarantees:
%   - The input cell array will always have an even length.
%   - The contents cell array for the first field is guaranteed to be a
%       1xN cell, and define the size of your output structure.
%   - The field content cell arrays will always be the same size, with the
%       exception of possibly being a 1x1 cell.
%
% Notes:
%   - You may NOT USE THE STRUCT() FUNCTION. The point of this problem is
%       for you to thoroughly learn how it works by coding it yourself. Any
%       submission that uses the struct() function will receive 0 credit.
%   - You must always assign the contents of a 1x1 contents cell array into
%       each index of the output structure, not the 1x1 cell.
% 
% Test Cases:
%
%   load('myStruct_testCaseSolns.mat')
%
%   struct1 = myStruct({'Alias', {'Elastigirl', 'Frozone', ...
%     'Mr. Incredible'},'Location', {'Unknown', 'Known', 'Terminated'}})
%
%       => struct1 should be equal to struct1_soln, which you may load from
%          myStruct_testCaseSolns.mat
%
%   struct2 = myStruct({'Superhero', {'Thunderhead', 'Stratogale',...
%     'Metaman', 'Dynaguy', 'Splashdown'}, 'Death', {'missile jet', ...
%     'jet turbine', 'express elevator', 'takeoff', 'vortex'}, 'Cause', ...
%     {'CAPES!'}})
%
%       => struct2 should be equal to struct2_soln, which you may load from
%          myStruct_testCaseSolns.mat
%
%
%==========================================================================
% Problem 2.  Phase II
%==========================================================================
%
% Function Name: phase2Registration
%
% Inputs (3): -(struct) A structure array containing your current schedule
%             -(cell) A cell array containing the CRN's of classes to add/drop
%             -(struct) A structure array representing GT's registrar
%
% Ouputs (1): -(struct) A structure array representing your new schedule
%
% Function Description:
%     It's that time again for Phase II Registration! As you learned from
%     last semester, Phase II Registration can be a time of stress as you
%     try to decide which classes to take and try to snag that last
%     available seat. In order to save yourself the heartache of having an
%     8am class every morning next semester, you decided to write a MATLAB
%     function that will make your registration process easier.
%
%     You already have a structure array of the classes that you registered
%     for during Phase I. Unfortunately, you didn't get all of the classes
%     that you wanted and you had to register for other classes as place
%     holders. The first input is a 1x4 or 1x5 structure array of the
%     classes that you are already enrolled in. 
%
%     Class structure format:
%
%         class1(1) =>
%             title: 'Biological Principles';
%               CRN: 85588;
%      courseNumber: 1510;
%              days: 'MWF';
%              time: '11:05am - 11:55am';
%        instructor: 'Jones';
%          location: 'Clough Undergraduate Learning Center';
% 
%      The second input is a 2x2 cell array containing the CRN's of class
%      that you would like to add and drop. The first row contains the
%      titles 'Add' and 'Drop' in that order. The second row contains a
%      vector (type double) of CRN's. The CRN's in the first column
%      correspond to the classes to be added and the CRN's in the second
%      column correspond to the classes to be dropped.
%
%      The last input represents the Georgia Tech registrar. It is a 1xN
%      structure array that contains all of the classes that are of
%      interest to you. The fields are the same as the class structure
%      (i.e. title, CRN, courseNumber, etc...).
% 
%      Your function should take these inputs and output a new structure
%      array of classes after you drop/add claforsses from the original
%      structure array. The classes should be appended to the end of the
%      structure array in the order that they appear in the cell array.
%
% Test Cases:
%
%    load('phase2Registration_testCaseInputs.mat');
% 
%    out1 = phase2Registration(class1, change1, registrar)
%       out1 => 1x4 structure array identical to out1_soln
%
%    out2 = phase2Registration(class2, change2, registrar)
%       out2 => 1x5 structure array identical to out2_soln
%
%    out3 = phase2Registration(class3, change3, registrar)
%       out3 => 1x5 structure array identical to out3_soln
%
%
%==========================================================================
% Problem 3.  Chemistry Calculator
%==========================================================================
%
% Function Name: molarMass
%
% Inputs  (2): - (char) A string representing a chemical formula
%			   - (struct) A structure array of elements and relevant info
%
% Outputs (1): - (double) The molar mass of the chemical compound.
%
% Function Description:
%   Write a function that takes in an input string of a chemical compound,
%   with commas delimiting each element, and outputs the molecular weight
%   of the compound. You will also be given an input of a "periodic table"
%   structure array. This structure array will not contain all of the
%   elements from the periodic table, but it is guaranteed to contain all
%   of the elements used in the inputted chemical formula. Each structure
%   in this array will contain the following fields:
%
%     Name
%     Symbol
%     AtomicNumber
%     AtomicWeight
%
%	The inputted chemical formula will look something like 'H2,O' (water)
%	or 'C6,H12,O6' (glucose). Notice that there are commas between each
%	element that composes the molecular formula. 'H' is the molecular
%	symbol for Hydrogen, and 'O' is the symbol for Oxygen. We can tell from
%	the '2' in the input string that there will be 2 Hydrogen atoms in a
%	water molecule, and from the lack of number after Oxygen that there is
%	only a single Oxygen atom in a water molecule. The molecular weight of
%	water will thus be 2*(Hydrogen's weight) + (Oxygen's weight), which
%	evaluates to 18.015.
%
%   Use string operations and the inputted structure array to add up the
%   molecular weight of the inputted chemical formula.
%
% Notes:
%   - The input string will never have brackets [] or parentheses () in it.
%   - The input string will never contain elements that do not appear in
%     the input structure array.
%   - Elements in the input string are distinguished by commas for your
%     convenience.
%   - Elements are allowed to repeat in a chemical formula.
%
% Hints:
%   - There is a way to capture all of the values of a particular field
%     in a structure array and store it in a numerical or cell array.
%
% Test Cases:
%
%   load('periodicTable.mat'); % this contains the variable "table"
%   
%   mass1 = molarMass('O2', table)
%     mass1 => 31.998
%   
%   mass2 = molarMass('Na,Cl', table)
%     mass2 => 58.4398
%
%   mass3 = molarMass('H2,S,O4', table)
%     mass3 => 98.072
%
%   mass4 = molarMass('C6,H12,O6', table)
%     mass4 => 180.156
%
%   mass5 = molarMass('C,H2,Br,C,H2,Br', table)
%     mass5 => 187.862
%
%==========================================================================
% Problem 4.  Uhhhh, yeah, obviously I am...
%==========================================================================
%
% Function Name: smarterThan5thGrader
%
% Inputs (3):  - (struct) A 1x11 structure array of the questions to be
%                         asked to the contestant. Contains fields "Answer"
%                         and "Value".
%              - (struct) A 1x1 structure of the contestant. Contains
%                         fields "Name", "Gender", "Education", and
%                         "Answers".
%              - (struct) A 1x10 structure array of the fifth graders to
%                         call on for help. Contains fields "Name" and
%                         "Answer".
%
%
% Outputs (1): - (struct) A 1x1 structure that is a report of the game,
%                         with fields as described below.
%
% Function Description:
%   Write a MATLAB function to simulate a round of the gameshow Are You
%   Smarter Than a 5th Grader. This game is simple: a single contestant is
%   asked 10 questions in a row, and if they answer all 10 correctly they
%   get the chance to answer an 11th question. For each question answered
%   correctly they make a certain amount of money, and if they miss a
%   single question along the way then then they are eliminated. The
%   contestant may ask for help on each question from a local 5th grader.
%   Here is what you need to know for your function:
%
%   You have three inputs: 
%     1) A 1x11 structure array of the questions asked. 
%     2) A 1x1 structure of the contestant's data and the answers they will 
%        give to all 11 questions. 
%     3) A 1x10 structure array of the 5th graders who are there to help 
%        with each question. 
%
%       The contestant will be asked the questions in order from the first 
%   index of the array being the first question to the last index being 
%   the last question. Contained within this structure array of questions 
%   are the fields "Answer" and "Value"; you don't actually know what the 
%   questions asked were, all you need to do is compare the contestant's 
%   answer to each question to the answer given in the structure array of 
%   questions. 
%
%       The structure of the contestant will contain a field called 
%   "Answers". Inside of this will be a 1x11 cell array of the contestant's 
%   answers to each question. If the string at index 1 of the contestant's
%   answers is the same as the string contained in the Answer field of the
%   first index of the questions structure array, then the contestant has
%   answered the first question correctly and may move on to the second
%   question.
%
%       A contestant is also allowed to call on help from local 5th graders 
%   for each question. The third input to your function will be a 1x10
%   structure array representing local 5th graders, with each index
%   corresponding to one of the first 10 questions (the contestant is not
%   allowed to call for help on the 11th question). If a contestant calls
%   for help on a specific question, then their "answer" to that question
%   will be the string: 'Ask a 5th Grader'. For example, a contestant might
%   answer 'Ask a 5th Grader' for the 7th question in the game. In this
%   case, the 7th index of the 5th-graders structure array will be used.
%   This structure array contains the fields "Name" and "Answer", where the
%   Name field is the name of each 5th grader at each index and the Answer
%   field of each index is the answer that this 5th grader provides to
%   their specific question if asked.
%
%       The game is played by a contestant answering questions in order. If
%   they answer a question correctly then they earn the winnings for that
%   question, which is the number stored in the "Value" field for each
%   index of the questions structure array. If they do not answer a
%   question correctly, then they are eliminated and may not answer any
%   more questions. A contestant may call for help from a 5th grader for
%   any question besides the 11th final question, but they are only allowed
%   to call for help twice. A contestant must use the answer provided by
%   the fifth grader if they call for help, but will be forgiven once for
%   an incorrect answer provided by a 5th grader. Once eliminated, a
%   contestant will take all the winnings they have earned for the
%   questions answered correctly.
%
%       You have one output: A 1x1 structure containing a report of how the 
%   contestant did. The fields of the report should be as follows:
%
%       Name
%       Gender
%       Education
%       NumberQuestionsAnswered
%       Winnings
%       FifthGradersUsed
%
%       The first three fields of this report output will come directly 
%   from your inputted contestant structure. Then "NumberQuestionsAnswered"
%   will be the numer of questions that the contestant answered correctly 
%   over the course of the game, "Winnings" will contain a number of how 
%   much the contestant won, and "FifthGradersUsed" needs to contain a cell 
%   array of which 5th graders were used. If no help was used, then this 
%   field should contain an empty cell array. Otherwise it should contain a 
%   cell array of the names of the 5th graders who helped, and in the order 
%   that they helped.
%
% Game Rules (for this homework):
%   - Winnings are earned on a per question basis, and awarded for correct
%     answers.
%   - The contestant may call for the help of a 5th grader up to 2 times.
%   - When calling for help, the contestant must always use the answer
%     provided by the 5th grader.
%   - The contestant may be forgiven one time for a 5th grader answering
%     incorrectly. In this case they will still earn the winnings for the
%     question. This counts as one of the 2 allowed calls for help.
%   - No help is allowed on the 11th final question.
%   - The contestant is eliminated for an incorrect answer that they
%     provide themselves, even if they were still allowed to call for help.
%
% Notes:
%   - The contestant is guaranteed to not try to call for help on the 11th
%     question.
%   - The contestant is not guaranteed to obey the rule that they are only
%     allowed to call for help twice. If they try to call for help a third
%     time they should be eliminated for answering that question
%     incorrectly.
%   - Notice what's going on with the 5th graders: the contestant can call
%     for help twice, and can be saved once if a fifth grader is incorrect.
%     If they call on a 5th grader for help and the 5th grader
%     answers the question incorrectly then one of two things happens:
%     1) either the contestant has already asked for help from another 5th
%     grader who was also incorrect, in which case the game is over and the
%     contestant has lost. Or 2) Your code somehow needs to store that the
%     5th grader is incorrect, but the contestant still gets the winnings
%     and still advances to the next question.
%   - The 5th grader who answers incorrectly for the second time must still
%     be included in the cell array in the field "FifthGradersUsed"
%
% Test Cases
%
%   load('smarterThan_testCases.mat') %%% DON'T PUT THIS IN YOUR FUNCTION
%
%       report1 = smarterThan5thGrader(questions,cont_Emily,fifthGraders);
%           report1 should be the same as report1_soln
%
%       report2 = smarterThan5thGrader(questions,cont_Jacob,fifthGraders);
%           report2 should be the same as report2_soln
%           
%       report3 = smarterThan5thGrader(questions,cont_John,fifthGraders);
%           report3 should be the same as report3_soln
%
%
%==========================================================================
% PROBLEM 5.   I didn't know Pandora used matlab... EXTRA CREDIT
%--------------------------------------------------------------------------
%
% Function Name: pandora
%
% Inputs  (2): - (struct) A 1x1 struct of data about a "Now Playing" song.
%                (struct) A 1xN struct of data about possible next songs.
%
% Outputs (1): - (char) A string of the song title of what song should
%                       play next.
%
% Function Description:
%   Write a function called pandora.m that takes in two inputs: a 1x1
%   structure containing data about the "Now Playing song" and a 1xN
%   structure containing data about possible songs that could be played
%   next. Your function needs to find which song of those in the second
%   input is most similar to the "Now Playing" song, and output a string of
%   its title.
%
%   The data about each song is contained in a 1x1 structure (or one index
%   of a structure array), and an example of how this data is stored for
%   Dog Days Are Over by Florence + The Machine is shown below:
%
%       dogDays = 
%
%                Artist: 'Florence + The Machine'
%                 Title: 'Dog Days Are Over'
%                 Album: 'Lungs'
%                 Genre: [1x1 struct] %shown below as dogDays.Genre
%                   Key: 'Major'
%                Vocals: 'Female'
%     DrivingInstrument: [1x1 struct] %shown below as dogDays.DrivingInstrument
%            Popularity: 90
%
%
%           dogDays.Genre = 
%                  Genre: 'Alternative'
%          RelatedGenres: {'Rock'  'Soul'  'Blues'}
%
%           dogDays.DrivingInstrument =
%             Instrument: 'Percussion'
%     RelatedInstruments: {'Full Band'  'Vocals'}
%
%   - The Artist, Title, Album fields contain strings with information
%    pertaining to the song. 
%   - The Genre field in each song's structure contains its own
%    structure, with fields for Genre and RelatedGenres: Genre has a string
%    of the song's genre; RelatedGenres contains a 1xN cell array of genres
%    that the song is related to.
%   - The Key field contains a string of whether the song is in a Major or
%    Minor key. 'Major' or 'Minor' will be the only two strings in this
%    field.
%   - The Vocals field contains the gender of the vocalist in the song. So
%    either 'Male' or 'Female'.
%   - The DrivingInstrument field is a lot like the Genre field, and
%    contains a structure of its own. This structure is a 1x1 with the
%    fields Instrument and RelatedInstruments: Instrument contains a string
%    of the driving instrument in the song; RelatedInstrument contains a
%    cell array of other instruments the song is driven by.
%   - The Popularity field contains an integer between 0 and 100
%    (inclusive), and this integer represents a popularity rating of the
%    song. 100 represents the maximum popularity, while 0 represents no
%    popularity whatsoever.
%
%   How to compare songs:
%       You will only need to compare data in the fields for Genre, Key,
%       Vocals, DrivingInstrument:
%       - Genre: treat this as either a 100%, 50%, or a 0% match. 100%
%       match if both songs have the same genre. 50% match if the
%       NowPlaying song's genre is contained in the other song's related
%       genre. 0% match for anything else (this includes the other song's
%       genre being contained in the NowPlaying song's related genres).
%       - Key: 100% match if the songs have the same key, and 0% key if
%       not. Remember 'Major' and 'Minor' are the only options here.
%       - Vocals: 100% match is the songs have the same gender vocalist. 0%
%       match if not.
%       - DrivingInstrument: similar to Genre, so can either be 100%, 50%,
%       or 0% match. 100% match if songs have the same driving instrument,
%       50% match if NowPlaying's driving instrument is contained in the
%       other song's related instruments.
%
%   Using all of the percent matches for the four different fields you have
%   to compare, you now need to calculate the overall similarity for two
%   songs using the following weights and summing all four weighted values.
%
%       40%: Genre similarity
%       10%: Key similarity
%       20%: Vocal similarity
%       30%: DrivingInstrument similarity
%
%   The song from the "possible next songs" input that has the most overall
%   similarity with the "now playing" song will be the song that should be
%   played next, so output this song's title.
%
%
% Notes: 
%   - For Genre and DrivingInstrument fields, the RelatedGenre and
%     RelatedInstruments comparisons should only be one-way. As in, for the
%     Genre field, you should compare the NowPlaying's Genre to the
%     RelatedGenres of the other song. Do not make the reverse comparison
%     of NowPlaying's related genres to the other song's main genre.
%
% Hints:
%   - The fieldnames() function is helpful.
%
% Test Cases:
%
%   load('pandoraSongs.mat')
%
%   [nextSong1] = pandora(everlong, [makeYouFeel alreadyHome dogDays warpath countingStars]);
%       nextSong1 => 'Counting Stars'
%   
%   [nextSong2] = pandora(makeYouFeel, [alreadyHome warpath everlong dogDays countingStars]);
%       nextSong2 => 'Already Home'
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
