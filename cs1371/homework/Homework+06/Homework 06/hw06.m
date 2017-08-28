%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name         : John Pratt
% GT Email     : jpratt9@gatech.edu
% Homework     : hw06
% Course       : CS1371
% Lecture Time : MWF 2:00
% TA's Name    : Nick Fahrenkrog/Edward Foyle
% Section      : B05
% Collaboration: I worked on the homework assignment alone, using
%                only course materials.
%
% Files provided with this homework:  
%	hw06.m
%   ABCs_conditionals.m
%   ABCs_hw06_pretest.p
%   ifOnlyIfOnly_soln.p
%   isValidDate_soln.p
%   rockPaperScissors_soln.p
%   personalityTest_soln.p
%   gymStats.mat
%   pokemon_MATLABversion_soln.p
%
% Files to submit:
%	hw06.m
%   ABCs_conditionals.m
%   ifOnlyIfOnly.m
%   isvalidDate.m
%   rockPaperScissors.m
%   personalityTest.m
%   pokemon_MATLABversion.m
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
%       - ABCs_conditionals.m
% ABCs File Testing:
%  >> ABCs_hw06_pretest
%
%==========================================================================
% PART 2. Drill Problems
%--------------------------------------------------------------------------
%
% The drill problems cover the following major topic(s):
%	Conditionals
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
% Problem 1.  Which Choice Can I Make?
%==========================================================================
%
% Function Name: ifOnlyIfOnly
%
% Inputs (2):  - (Varies) Input 1. (see function description)
%              - (Varies) Input 2.
%
% Outputs (2): - (Varies) Output 1.
%              - (Varies) Output 2.
%
%
% Function Description:
%   Write a function that behaves differently depending on the class of the
%   first input. The three following descriptions are for each possible
%   class of data: double, logical, and char.
%
%       Double: If the first input is double class, then your 2nd input is
%       guaranteed to also be a double. The first input will always be a
%       single number, and the 2nd input can be any size. In this case,
%       your first output should be the first input divided by
%       the overall sum of the 2nd input. The second output should be the
%       2nd input dot-multiplied by the first input.
%
%       Logical: If the first input is logical class, then the 2nd input is
%       guaranteed to represent a number and be length 1. However, the 2nd
%       input can vary between double and char class. So it could either be
%       [5] or '5', which are very different (as you should know from your
%       strings knowledge). For your first output in this case, simply
%       output the opposite of the first input. For example, if your first
%       input was [true false false true], then your first output should be
%       [false true true false]. For your second output in this case, check
%       whether the number represented in the 2nd input is even, and output
%       a single true or false, true is the number is even. If the class of
%       that input was double, then simply leave this second output as
%       logical class. If the class of the 2nd input was char (so it was a
%       string), then output a string of 'True' or 'False' instead of just
%       a logical value.
%
%       Char: If the first input is char class (in other words, if the
%       first input is a string), then the second input is always
%       guaranteed to be another string. You will need to find which string
%       is longer, and remove indices from it that go past the length of 
%       the shorter string. Your first output will then be the two strings
%       concatenated together with a space between them, and the second
%       output will be a single true of false: true if the inputted strings
%       were originally the same length, and false if they were not and you
%       had to shorten one. If you have to shorten one of the inputted
%       strings, then the shortened version of that string should be what
%       you use to concatenate them together for your first output.
%
% Hints: 
%   - ischar(), islogical(), and isnumeric() will be three useful functions.
%
% Test Cases:
%
%       [out1, out2] = ifOnlyIfOnly(5,[5 6 7; 4 3 2])
%           => out1 = 0.1852
%              out2 = [25 30 35
%                      20 15 10]
%
%       [out1, out2] = ifOnlyIfOnly('Hello', 'Worldddd')
%           => out1 = 'Hello World'
%              out2 = false  %%logical class%%
%
%       [out1, out2] = ifOnlyIfOnly(true, '22')
%           => out1 = false  %%logical class%% 
%              out2 = 'True'  %%as a string%%
%
%
%==========================================================================
% Problem 2.  ValiDATE This!
%==========================================================================
%
% Function Name: isValidDate
%
% Inputs (1):  - (char) a string representing a date
%
% Outputs (1): - (logical) a logical representing the validity of the date
%
% Function Description:
%   Write a function called "isValidDate" that determines whether or not a
%   date is valid. The input date will always be in the format '<month>
%   <day>, <year>' (for example, 'January 1, 2014').
%
%   Here are the rules that your function must use to check date validity:
%     1) The year must be a positive integer
%     2) The month must be spelled correctly and have the first letter
%        capitalized.
%     3) The day must be an integer in the allowable range for that month
%       (As in: 'February 31, 2014' would not be valid.)
%
%   If any of these three rules are violated, your function should output
%   false.
%   
%
%   Here is a rhyme help you to remember how many days are in each month:
%     "Thirty days have September, April, June, and November. All the rest
%      have thirty-one, except for February, which is dumb."
%   February has 28 days in a non-leap year and 29 days in a leap year.
%
%   Your function should also account for leap years. Here are two easy
%   rules to determine if a year is a leap year:
%     1) If the year is divisible by 400, it is a leap year
%     2) If the year is not divisible by 400, it must be divisible by 4 but
%        not by 100 to be a leap year
%
% Notes:
%   - The day and year are NOT guaranteed to be positive or integer-valued.
%   - There will never be a suffix on the day of the month.
%
% Hints:
%   - You may find the strtok() function useful.
%   - Especially with this function, the test cases below are helpful but
%     not a guarantee that you will get the question correct. If you want to
%     be thorough you should check your code with many of your own test
%     cases.
%
% Test Cases:
%
%       valid1 = isValidDate('September 30, 2014')
%           => valid1 = true
% 
%       valid2 = isValidDate('September 31, 2014')
%           => valid2 = false
% 
%       valid3 = isValidDate('February 29, 2012')
%           => valid3 = true
% 
%       valid4 = isValidDate('December 29.9, -1005.7')
%           => valid4 = false
%
%
%==========================================================================
% Problem 3.  Rock, Paper, Scissors, Shoot!
%==========================================================================
%
% Function Name: rockPaperScissors
%
% Inputs (1):  - (char) A string containing the first player's moves
%              - (char) A string containing the second player's moves
%
% Outputs (1): - (char) A string that says who won the game
%
% Function Description:
%   The age old game of Rock-Paper-Scissors is making its way into the
%   world of MATLAB!
%   This is a hand game played by two people, where players simultaneously
%   form one of three shapes with their hand, and the three shapes form a
%   triangle such that someone always wins! (Unless both players play the
%   same thing...)
%   Scissors beats Paper, Paper beats Rock, Rock beats Scissors:
% 
%                     Scissors ----->  Paper
%                        ^               /
%                         \             /
%                          \           /
%                           \         /
%                            \       /
%                             Rock <-
%
%   Since playing only one round of this game isn't quite thrilling enough,
%   this game will be played best two out of three. The first input will
%   contain the first players moves for each respective round in the format
%   'Rock,Paper,Scissors', or any combination of the three. 'Rock' would be
%   the players first move, Paper the second, and so forth. The same format
%   applies to the second input (the second player's moves).
%
%   To win the overall game (where the game consists of three rounds), a
%   player must win two of those three rounds. Due to the possibility of
%   ties, it is not guaranteed that there will always be a winner. (For
%   example, if the two players tied in two of the rounds, then no one has
%   won the game yet, because neither player has reached two wins.)
%
%   Here is an example match:
%      Player1 -> 'Rock,Scissors,Scissors'
%      Player2 -> 'Paper,Rock,Scissors'
%
%      Round 1: Player 2 beats Player 1, because Paper beats Rock.
%      Round 2: Player 2 beats Player 1, because Rock beats Scissors.
%      Round 3: both players selected the same thing and is a draw.
% 
%      As a result, Player 2 has two wins, and Player 1 has none. Player 2
%      has reached the two wins required to win the game, and so your
%      function would output 'Player 2 wins!'.
%
%   The output of your function should always be one of the following:
%      - 'Player 1 wins!'   if Player 1 wins the game
%      - 'Player 2 wins!'   if Player 2 wins the game
%      - 'Keep Playing!'    if neither player has won 2 rounds yet
%
% Notes:
%   - The first letter in each move will always be capital
%   - The character separating a player's moves in the input will always be
%     a comma (and no space).
%   - The output string must match exactly to one of the above outputs
%     (case matters!)
%   - Each input will contain exactly three moves.
%
% Hints:
%   - Your code should be pretty repetitive, so take advantage of copy and
%     paste.
%
% Test Cases:
%
%   [winner1] = rockPaperScissors('Rock,Scissors,Scissors', ...
%                                 'Paper,Rock,Scissors')
%               winner1 => 'Player 2 Wins!'
% 
%   [winner2] = rockPaperScissors('Paper,Paper,Rock', ...
%                                 'Rock,Scissors,Rock')
%               winner2 => 'Keep Playing!'
% 
%   [winner3] = rockPaperScissors('Paper,Paper,Scissors', ...
%                                 'Scissors,Rock,Paper')
%               winner3 => 'Player 1 Wins!'
%
%
%==========================================================================
% Problem 4.  Multiple Personalities?
%==========================================================================
%
%Function Name: personalityTest
% Inputs (3): - (string) A string containing your personality type.
%             - (string) A string containing all possible personality
%                        types, in order from 1 to 10, separated by spaces.
%             - (string) A string containing the personality sub-type.
%
% Outputs (3): - (string) A string containing the dominant personality type
%                         and subtype
%              - (string) A string containing the recessive personality
%                         type
%              - (string) A string containing the two "wing" personality
%                         types
%
% Function Description:
%   The Enneagram personality test tells you your dominant personality
%   type, your two "wing" personality types, and your recessive personality
%   type. Your dominant personality type is the personality type that best
%   describes you. Your wing personality types are the two personality
%   types that you also have a few characteristics of. Your recessive
%   personality type is the personality type that you least resemble.
%
%   You took the Enneagram personality test, but it only gave you either
%   your dominant or recessive personality type. You wanted to know your
%   dominant, recessive, and wing personality types! Luckily, you can write
%   a MatLab function to figure out all of your personality types!
%
%   The Enneagram personality test is based on the following circle:
%
%                               1
%                          10        2
%
%                       9               3
%
%                       8               4
%
%                          7         5
%                               6        
%
%   where each number is a personality number. Imagine you are standing at
%   one of the numbers, your dominant personality type, and looking into
%   the circle. The wing personalities are the two personality types
%   surrounding the dominant personality type. So, if your dominant
%   personality type was personality type 3, then your wing personality
%   types would be types 4 and 2. Your right wing personality is the number
%   to the right (counterclockwise on the circle) of your dominant
%   personality type (2 in this case) and your left wing personality type
%   is the number to the left (clockwise on the circle) of your dominant
%   personality type (4 in this case). Your recessive personality type is
%   the personality type opposite of your dominant personality type on the
%   circle. So, if your dominant personality type was 3, your recessive
%   personality type would be 8.
%
%   Write a MatLab function that takes an input of a dominant or recessive
%   personality type and outputs the other personality types. If the
%   inputed personality type starts with a lower case letter , then it is
%   your recessive personality type. If it starts with an uppercase, then
%   it is your dominant personality type.
%
%   You also know your personality subtype from a different personality
%   test. To be thorough in your code you wanted to add it as well. Your
%   subtype can be either 'alone', 'smallGroup', or 'largerGroup' (those
%   will be the exact input strings). If it is alone add '_a' to the end of
%   your dominant personality type. If it is smallGroup add '_s' to the end
%   of your dominant personality type. If it is large group add '_l' to the
%   the end of your dominant personality type.
%
% Notes:
%   - All outputs have to be capitalized.
%   - There will always be ten personality types in the form 'Type1 Type2
%     Type3', but you do not know the names or order of the personality types.
%   - The ten personality types will always be capitalized.
%   - Your third output is the two wing personalities, these will be in
%     the order: [leftWing rightWing]
%  
% Test Cases:
%       type1 = 'helper';
%       pVec1 = ['Reformer Helper Achiever Individualist Dreamer Investigator ...
%                 Loyalist Enthusiast Challenger Peacemaker'];
%       subType1 = 'alone';
%       [dom1, rec1, wings1] = personalityTest(type1,pVec1,subType1);
%           dom1 => 'Loyalist_a'
%           rec1 => 'Helper'
%           wings1 => 'Enthusiast Investigator'
%
%       type2 = 'Dreamer';
%       pVec2 = ['Achiever Individualist Dreamer Investigator Loyalist ...
%                 Enthusiast Challenger Peacemaker Reformer Helper'];
%       subType2 = 'smallGroup';
%       [dom2, rec2, wings2] = personalityTest(type2,pVec2,subType2);
%           dom2 => 'Dreamer_s'
%           rec2 => 'Peacemaker'
%           wings2 => 'Investigator Individualist'
%
%       type3 = 'Challenger';
%       pVec3 = ['Peacemaker Reformer Helper Achiever Individualist Dreamer ... 
%                 Investigator Loyalist Enthusiast Challenger'];
%       subType3 = 'largeGroup';
%       [dom3, rec3, wings3] = personalityTest(type3,pVec3,subType3);
%           dom3 => 'Challenger_d'
%           rec3 => 'Individualist'
%           wings3 => 'Peacemaker Enthusiast'
%
%
%==========================================================================
% PROBLEM 5.   EXTRA CREDIT  EXTRA CREDIT  EXTRA CREDIT  EXTRA CREDIT
%--------------------------------------------------------------------------
%
% Function Name: pokemon_MATLABversion
%
% Inputs  (3): - (double) A 1x2 vector of your pokemon's attack and defense
%                         stats: [attack defense].
%              - (char) A string of the type of your pokemon.
%              - (double) An integer of how many "Revives" you have.
%                
% Outputs (1): - (char) A sentence describing the outcome of your pokemon
%                       challenge.
%
% Function Description:
%   Write a matlab function that simulates a pokemon game: where you
%   challenge 8 gym leaders to try and win, and if you beat all 8 you earn
%   the right to challenge the elite 4. For those of you unfamiliar with
%   pokemon: no pokemon knowledge is actually necessary to code this
%   problem, so don't worry.
%
%   Your function will have three inputs: (1) a 1x2 vector of your
%   pokemon's stats. This will simply be Attack and Defense stats, and will
%   be of the form: [attackStat defenseStat]. (2) A string of the type of
%   pokemon you have. And (3), an integer of how many "Revives" you have. A
%   "revive" is an item that one may use in pokemon games to revive a
%   fainted pokemon, and will be used in this problem to help you win
%   battles against gym leaders when your stats are not higher than theirs.
%
%   Firstly, your function will need to simulate a battle between your own
%   pokemon and a gym leader's pokemon. From there you may use whichever
%   approach you wish to repeat the simulation for the next gym leader, and
%   so on. Simulating a battle will be accomplished by comparing your own
%   pokemon's stats to those of the gym leader. The stats of all pokemon's
%   gym leaders have been included with the homework, and are saved in the
%   file gymStats.mat (calling the line of code: load('gymStats.mat') will
%   save the variables contained into your workspace). There are a two
%   different ways for your pokemon to win a battle:
%       1) Your pokemon's attack stat is higher than the opponent's defense
%          stat. This should always result in your pokemon winning the
%          battle.
%       2) Condition (1) is not met, but your pokemon's attack
%          stat is greater than 80% of your opponent's defense stat. In
%          this case, you have to use one of your revives win the battle.
%
%   If one of two above conditions is not met, then you will lose that
%   battle. If you lose against a gym leader, then you are not allowed to
%   challenge the following gym and that is the end of your pokemon
%   challenge.
%
%   Pokemon types will also play a part in this function. In pokemon, types
%   of pokemon define how some pokemon are just inherently strong against
%   others. For example, a water pokemon is inherently strong against a
%   fire pokemon, because water literally puts fires out. How this works
%   for this matlab problem is as such: if your pokemon's type is strong
%   against the opponent pokemon's type, then your stats will be multiplied
%   by 2 for that battle. If the opponent pokemon's type is strong against
%   your pokemon's type, then your stats will be multiplied by 0.5 for that
%   battle. The types of the 8 gyms you must face, and the types that are
%   strong against/weak to them are shown below:
%
%       Gym 1: Rock Type Gym
%           Strong types: Water, Grass, Fighting, Ground (2x multiplier)
%             Weak types: Flying, Bug, Fire, Ice (0.5x multiplier)
%
%       Gym 2: Water Type
%           Strong types: Grass, Electric (2x multiplier)
%             Weak Types: Ground, Rock, Fire (0.5x multiplier)
%
%       Gym 3: Electric Type
%           Strong types: --
%             Weak types: Flying, Water (0.5x multiplier)
%           Immune types: Ground (A Ground pokemon should always beat this gym)
%
%       Gym 4: Grass Type
%           Strong types: Flying, Poison, Bug, Fire, Ice (2x multiplier)
%             Weak types: Ground, Rock, Water (0.5x multiplier)
%
%       Gym 5: Poison Type
%           Strong types: Ground, Psychic (2x multiplier)
%             Weak types: Grass (0.5x multiplier)
%           Immune types: Steel (A Steel pokemon should always beat this gym)
%
%       Gym 6: Psychic Type
%           Strong types: Bug, Ghost (2x multiplier)
%             Weak types: Fight, Poison (0.5x multiplier)
%           Immune types: Dark (A Dark pokemon should always beat this gym)
%
%       Gym 7: Fire Type
%           Strong types: Ground, Rock, Water (2x multiplier)
%             Weak types: Bug, Steel, Grass, Ice (0.5x multiplier)
%
%       Gym 8: Ground Type
%           Strong types: Water, Grass, Ice (2x multiplier)
%             Weak types: Poison, Rock, Steel, Fire (0.5x multiplier)
%           Immune types: Flying (A Flying pokemon should always beat this gym)
%      Ineffective types: Electric (An Electric pokemon should always lose this gym battle)
%
%
%       *************************
%       The stats for each gym leader's pokemon are saved in gymStats.mat;
%       variable "stats1" is the first gym's stats, variable "stats2" is
%       the 2nd gym's stats, variable "stats3" is the third gym's stats,
%       etc. You will need to load this file in your function with the
%       following line of code:
%
%           load('gymStats.mat')
%
%       With the above line of code at the beginning of your function, you
%       will then be able to refer to the variables stats1, stats2, stats3,
%       etc.
%       *************************
%
%
%   Lastly: this function should also take Experience into account. So when
%   your pokemon wins a battle, you should add 20% of the opponents stats
%   to your own, and this change to your stats will be permanant. As in, it
%   won't go away after the battle ends (like your type multipliers
%   should).
%
%   Now you have everything you need to code this function: you have the
%   conditions for your pokemon to win a battle, the type
%   advantages/disadvantages for each gym, how much your pokemon's stats
%   should grow with each battle, and the stats of the gym leader's
%   pokemons saved in gymStats.mat. This function is lots and lots and lots
%   of conditional statements, but once you write the simulation for one
%   battle it is easy to write the rest. Now let's get to your outputs:
%
%   You need to output two things in this function. (1) A string telling
%   how you did, and (2) your pokemon's stats at the end of the function.
%   The output string will be as such:
%
%       Output string for losing to one of the gyms along the way:
%           "You defeated %d gyms, and have %d revives remaining. Keep
%           training and one day you will challenge the Elite 4."
%
%       Output string for defeating all 8 gyms:
%           "You defeated 8 gyms, and have %d revives remaining. You may
%            now challenge the Elite 4."
%          
%
% Notes:
%   - The line of code to load the gym leader's stats in your function is:
%
%       load('gymStats.mat')
%
%     This will load the eight variables "stats1", "stats2, "stats3", ...
%     into your function. These are the stats for each gym leader's
%     pokemon, and you cannot code the function without them.
%   - If you are confused about the point of Revives in this problem (the
%     third input), refer to number 2 of the conditions to win a battle.
%
% Hints:
%   - The code to simulate each gym will be very similar, so copy and paste
%     will save you lots of time typing.
%   - Your solution to this problem if you choose to do it should be
%     very long and very repetitive.
%
%
% Test Cases:
%       [conclusion1 finalStats1] = pokemon_MATLABversion([30 20], 'Ground', 1)
%           conclusion1 => 'You defeated 1 gyms, and have 1 revives
%                           remaining. Keep training and you will challenge
%                           the Elite 4 one day.'
%           finalStats1 => [36 30]
%
%       [conclusion2 finalStats2] = pokemon_MATLABversion([91 70], 'Flying', 1)
%           conclusion2 => 'You defeated 8 gyms, and have 0 revives
%                           remaining. You may now challenge the Elite 4.'
%           finalStats2 => [217.2162 196.2162]
%
%       [conclusion3 finalStats3] = pokemon_MATLABversion([100 100], 'Electric', 2)
%           conclusion3 => 'You defeated 7 gyms, and have 2 revives
%                           remaining. Keep training and you will challenge
%                           the Elite 4 one day.'
%           finalStats3 => [201.1817 197.1817]
%   
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
