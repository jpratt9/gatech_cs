%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name         : John Pratt
% GT Email     : jpratt9@gatech.edu
% Homework     : hw07
% Course       : CS1371
% TA's Name    : Nick Fahrenkrag/Edward Foyle
% Section      : B05
% Collaboration: I worked on this homework with Corey Fogg.
%
% Files provided with this homework:  
%   ABCs_hw07_pretest.p
%   ABCs_iteration.m
%   CFRecruiter_soln.p
%   battleTanks.mat
%   battleTanks_soln.p
%   blackjackStrategy.mat
%   blackjack_soln.p
%   dealer.p
%   decodeStr_soln.p
%   hw07.m
%   snoozeTime_soln.p
%
% Files to submit:
%	ABCs_iteration.m
%	snoozeTime.m
%	decodeStr.m
%	CFRecruiter.m
%	battleTanks.m
%	blackjack.m
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
%       - ABCs_iteration.m
% ABCs File Testing:
%  >> ABCs_hw07_pretest
%
%==========================================================================
% PART 2. Drill Problems
%--------------------------------------------------------------------------
%
% The drill problems cover the following major topic(s):
%	Iteration
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
% Problem 1.  "Your mission (should you choose to acccept it)."
%==========================================================================
%
% Function Name: decodeStr
%
% Inputs (2):  - (string) A coded message
%              - (double) A number indicating which word/character to pull
%                         from the string (ex: 4 -> keep every fourth
%                         word/charater)
%
% Outputs (1): - (string) The decoded message
%              
%
%
% Function Description:
%   As an aspiring secret agent, your first training mission (should you
%   choose to accept it) is learning to recognize and decode secret
%   messages. You will start off simple, by writing a matlab function to
%   decode only two differing types of secret message. The first kind of
%   secret message is a sentence, with words in it separated by spaces,
%   where the secret message is simply every Nth word in the sentence, and
%   where N is your "code factor". For example: if a certain sentence has a
%   code factor of 4, the secret message is every 4th word in the sentence.
%   The second kind of secret message you will decode is a string of
%   characters, without any spaces. For this case, the secret message
%   contained is every Nth character. Your matlab function should be able
%   to recognize and decode both types of secret message. These
%   instructions will self-destruct in 15 seconds.
%
%   To summarize: if your input string has spaces in it, you should pull
%   out every Nth word (where N is the 2nd input) and concatenate then into
%   your output, and if your input string does not have spaces in it, you
%   should pull out every Nth character and concatenate those into your
%   output.
%   
%
% Notes: 
%   - Whether or not your input has spaces in it will determine if you pull
%     out every Nth word or every Nth character.
%   - Do not worry about changing punctuation or capitalization.
%   - There can be more than one space between words (but only spaces).
%   - Your decoded message should NOT end with a space.
%
% Test Cases:
%
%       str = ['I want to go  to the   track meet and eat a Jimmy Johns ' ...
%              'gourmet sandwich  on the first  with    Wednesday Adams.'];
%       [out1] = decodeStr(str,4)
%           => out1 = 'go meet Jimmy on Wednesday'
%
%       [out2] = decodeStr('www.harttoregerill.com/op',3)
%           => out2 = 'waterloo'
%
%==========================================================================
% Problem 2.  Career Fair Recruiter
%==========================================================================
%
% Function Name: CFRecruiter
%
% Inputs (3):  - (char) A string of strudent names, separated by comma-space.
%              - (double) A vector of GPAs, corresponding to the students
%                         in the first input.
%              - (logical) A logical vector of whether or not each student
%                          stays to talk.
%
% Outputs (2): - (char) A string of possible candidates to hire.
%              - (double) The total time spent the recruiter spends talking
%                         to students.
%
% Function Description:
%   Imagaine you are a recruiter at the Career Fair for a big-name company:
%   a bunch of students are waiting in the line to talk with you, and you
%   don't have time to talk to everybody. You're not even going to bother
%   talking to students whose GPA doesn't meet the minimum to work for your
%   company (which is a GPA above a 2.5, not inclusive), and there are some
%   students who don't even stay to talk, they just hand in their resume
%   and leave!
%
%   Write a function that takes in a string of names separated by a
%   comma-space (', '), a vector of these students GPAs, and a logical
%   vector of whether or not they stick around to talk. Output a string of
%   the names of possible candidates for your company (students with GPAs
%   higher than your minimum who stayed there to talk), and output the
%   number of minutes spent talking to these students. The time you spend
%   talking to each student will vary, but it will generally follow the
%   formula:
%
%           Time in minutes = (GPA - 2.5) * 4;
%
% Notes: 
%   - Do not round/ceil/floor the output time.
%   - In the string, names are seperated by ', ', so the string would look
%     like 'Jack, Emily, Sam Lin, Will Brown'. Your output should be
%     exactly the same format as the input, but with fewer names.
%   - It is guaranteed there will be at least one name in your output string.
%   - Use strtok wisely, and deal with ' ' and ',' carefully. Your output
%     needs to be exactly the same as the output from CFRecruiter_soln.p
% 
% Test Cases:
% 
%       [Names, Time] = CFRecruiter('Jack, Rose, Tom', [3.9, 2.3, 3.3],...
%                                   [false true true])
%           => Name = 'Tom'
%              Time = 3.2000
%
%       [Names, Time] = CFRecruiter('Gatech, George Burdell, Barnes Noble',... 
%                                   [4.0, 2.5, 3.6], [true true true])
%           => Name  = 'Gatech, Barnes Noble'
%              Time  = 10.4000
%
%
%==========================================================================
% Problem 3.  Keepin' the Dream Alive
%==========================================================================
%
% Function Name: snoozeTime
%
% Inputs (4):  - (char) The time at which you fall asleep
%              - (char) The time for which your alarm is set
%              - (double) The length of your clock's snooze function (mins)
%              - (char) The time of your first class
%
% Outputs (1): - (double) An integer of how many times you can "snooze"
%
% Function Description:
%   It's been another late night studying for midterms and coding matlab,
%   but, alas, it is finally time to hit the sack (hooray!).  In
%   preparation for your big test day tomorrow, one of the last things you
%   want to do before falling asleep is to determine how many times you can
%   hit the snooze button in the morning.  You want at least 8 hours of
%   sleep, if possible (but no more in case you want to do some last minute
%   studying in the morning). However, you must wake up at least 20 minutes
%   before your first class starts, and if this means less than 8 hours of
%   sleep then you'll just have to be sleep deprived.  So how many times
%   can you snooze? Take into account the time you begin to sleep (after
%   midnight, of course), the time your alarm is set, the length of your
%   clock's snooze function, and the time of your first class to
%   iteratively determine how many times you can Keep the Dream Alive!
%
% Notes:
%   - All times will be written on a 24 hour scale. So a time 1:40 pm would
%     be a string of '13:40'.
%   - You must "wake up" at least 20 minutes before your first class. If
%     hitting snooze again would put you past that, then you cannot hit
%     snooze again.
%   - It is guaranteed that the time your alarm is set for will always be
%     at least 20 minutes before your first class starts.
%   - Time spent snoozing counts as "sleeping". Your function should stop
%     hitting snooze at 8 hours past your bedtime (if applicable). Your
%     function should always return 0 if your "alarm time" (the 2nd input)
%     is more than 8 hours after your "bedtime" (the 1st input).
%
% Hints:
%   - Don't forget that time is not measured in 100's (but 60's)
%
% Test Cases:
%
%   [numberOfSnoozes1] = snoozeTime('3:25', '9:05', 10, '10:00');
%       numberOfSnoozes1 = 3;
%       
%   [numberOfSnoozes2] = snoozeTime('0:00', '6:30', 7, '8:00');
%       numberOfSnoozes2 = 10;
%
%   [numberOfSnoozes3] = snoozeTime('1:05', '9:20', 5, '10:30');
%       numberOfSnoozes3 = 0;
%
%==========================================================================
% Problem 4.  War and Peace: BattleShip style
%==========================================================================
%
% Function Name: battleTanks
%
% Inputs (3):  - (double) An array of Player 1's field of tanks
%              - (double) An array of Player 2's field of tanks
%              - (string) A string detailing the battle (ex: 'A7 B4 C3')
%
% Outputs (3): - (double) An 8x8 array of the victorious side in the battle.
%                         (Or an array of the first players's field.)
%              - (double) A vector detailing the winning players's hits, in
%                         order.
%                         (Or an array of the second player's field.)
%              - (varies) A vector detailing what tanks the winning player
%                         destroyed, in order.
%                         (Or the string 'Cease Fire!')
%
% Function Description:
%  When you were little, you may have heard of the game Battleship (if not
%  then see the Hints section of this problem statement for a linked
%  description). Well unfortunately, ships are slow, boring and not nearly
%  as cool as tanks. Now you get to play with tanks, because you're old
%  enough to make your own choices and tanks are awesome. Unfortunately, we
%  don’t have the budget to give you real tanks for this homework
%  assignment, so instead you get to write a Matlab function simulating a
%  game of BattleTanks!
%
%  Your function will take three inputs: the first two are arrays that show
%  how each player has laid out their tanks on their field. The third
%  input is a string of the moves made in the game, containing the moves of
%  both players. The two arrays will always be 8x8 arrays, and the
%  different tanks on the field will be indicated by numbers 1 through 4
%  (and empty space will just be 0's). The string of moves will be of the
%  form: 'A7', where the letter A indicates the column and the number 7
%  indicates the row. If the first player makes the move 'A7', then that
%  means he/she will hit any tank that is located at column 1 and row 7 of
%  the enemy's field.
% 
% Battle Details:
%
%  - The battlefield will be an 8x8 array with up to 4 tanks represented.
%    Tanks may be aligned horizontally or vertically. A heavy
%    tank is 3x2, and represented by the number 4. A medium tank is 2x2,
%    represented by the number 3. A tank destroyer is 3x1, represented by
%    the number 2. A light tank is 2x1, represented by the number 1. 0
%    represents empty space.
%
%  - The string detailing the battle will be a string of which coordinates
%    in the opponent's battlefield a player "shoots at". This input string
%    will be of the form: 'A7 B4 F6', where moves are separated by a space.
%    For each move the letter (A through H) refers to the column (1 through
%    8 respectively), and the number refers to the row. The first player
%    will always make the first move, and moves will then alternate between
%    players for the full length of the string. There is no guarantee that
%    both players will make the same number of moves, and there is no
%    guarantee that all the moves in the string will be used before the
%    battle ends.
%
%  - You must keep track of the order in which each player hits the
%    opponent's tanks, and also keep track of the order in which each player
%    destroys the opponent's tanks. (Keep track of the numbers representing
%    the tanks, not the tank names.) A tank is destroyed when every index
%    of that tank in a player's array has been hit by the enemy.
% 
% Winning conditions:
%
%  - If one player destroys all of the opponent's tanks, then they have won.
%
%  - If neither side has lost all their tanks after all moves have been
%    played, the winner is determined by the number of hits scored on the
%    enemy fleet (NOT the number of tanks they destroyed). It is thus
%    possible to win but not destroy any tanks.
%
%  - The game is allowed to end in a tie. If all of the moves in the input
%    string have been made, and each player has the same number of hits on
%    the other, then the game will be a tie. In the event of this, the
%    outputs of the function will become the secondary outputs described in
%    parentheses at the top of this problem statement: 1) the 1st players
%    final 8x8 array, 2) the 2nd players final 8x8 array, and 3) a string,
%    'Cease fire!'.
% 
% Rules of Engagement: 
%  - Collateral damage is not allowed. No coordinates will be given that do
%    not land within the 8x8 grid. That is, no letter after H in
%    alphabetical order and no number greater than 8 will be given.
%  - Incompetent players are allowed make the same move multiple times.
%    However, it can only count as a "hit" the first time they make the
%    move.
%  - The battlefield will always be 8x8.
%  - Players are not required to play all their tanks. But if they only have
%    one tank out there, and that one tank gets destroyed, then they lose.
%  - There will be no duplicate tanks, eg. two light tanks will not be on 
%    the same side.
%  - In your output arrays, any place where a tank has been hit but not
%    destroyed should be represented by a 0. So there may be "jagged tanks"
%    in an output array.
%
% Hints:
%   - A helper function may be written in the same file, but following the
%     "end" of the main function. This is a function that can be called
%     from the main function, but not the command window, and can be very
%     helpful for performing repeated tasks.
%   - If you have no idea what the heck this problem is asking because you
%     have no idea what Battleship is, then go this URL:
%     http://en.wikipedia.org/wiki/Battleship_(game)
%
% Test Cases:
%
%      load('battleTanks.mat')
%
%      [results1, winHits1, winDestroy1] = battleTanks(battleAP1,battleAP2,moveA)
%           => results1 should be the same as resultsA (which is saved in battleTanks.mat)
%              winHits1 = [1 1 2 2 2 3 3 3 3]
%              winDestroy1 = [1 2 3]
%
%      [results2, winHits2, winDestroy2] = battleTanks(battleBP1,battleBP2,moveB)
%           => results2 should be the equal to resultsB1 (in .mat file)
%              winHits2 should be the equal to resultsB2 (in .mat file)
%              winDestroy2 = 'Cease fire!'
% 
%==========================================================================
% Problem 5.  House Rules
%==========================================================================
%
% Function Name: blackjack
%
% Inputs (2):  - (double) A random integer that indicates a card seed to be
%                         fed to the dealer.p function
%              - (double) The strategyArray variable loaded from
%                         'blackjackStrategy.mat'
%
% Outputs (1): - (char) A string telling who won the game
%
% Function Description:
%   You've seen the movies. You've heard the stories. Now it's time for you
%   to win big playing blackjack!! Except not actually. Because gambling is
%   bad and you're a broke college student. So instead you decide to write
%   a Matlab function to play blackjack for you without any financial
%   reprecussions.
%
%   If you do not know how to play blackjack, you can read the Wikipedia
%   article here: http://en.wikipedia.org/wiki/Blackjack, but here is a
%   brief summary of what you need to know:
%
%   Blackjack is a game played between one player and a dealer, and either
%   the player or the dealer wins. The objective of the game is to get a
%   hand of cards that adds up to as close to 21 as possible, but dooesn't
%   go over. The dealer deals out 4 cards to start the game: two to the
%   player and 2 to themself. The player can obviously see both of their
%   own cards, and is also shown 1 of the dealer's card. They player then
%   decides from the sum of their two cards and the card shown by the
%   dealer whether they should "hit" or "stay". "Hit" means the dealer
%   gives the player another card to increase the sum of their hand, and
%   "stay" means that the player is already close to 21 and does not want
%   to risk going over. The player can decide to "hit" as many times as
%   they would like, but should they go over 21 they will automatically
%   lose. If the player decides to "stay" without going over 21, then the
%   dealer will reveal their 2nd card, and also "hit" until they get as
%   close to 21 as possible. If the dealer goes over 21, then the player
%   wins. Besides this, whoever is closer to 21 wins.
%
%   The "dealer" for this problem will be a function, dealer.p, that is
%   included with the homework. For everything the dealer would normally do
%   in a real blackjack game, you have the dealer.p function:
%
%  |----------------------- Explanation of dealer.p -----------------------
%  |
%  |[dealerUpCard,playerCard] = dealer(action,[cardSeed])
%  |
%  |    Inputs:
%  |     - action: this input is a string input that can be 'start', 'hit',
%  |        or 'stay'. 'start' refers to the deal at the start of the game,
%  |        'hit' refers to the player deciding to hit and requesting another
%  |        card, and 'stay' refers to the player ending their turn.
%  |     - cardSeed: This input is necessary if your first input is 'start', but
%  |        is optional and will not be used by the function for other
%  |        first-inputs. This should be the exact same cardSeed input to
%  |        your blackjack.m function, and fed to dealer.p to make sure that your
%  |        file and the solution file will be dealt the same cards for the
%  |        same test cases.
%  |
%  |    Outputs:
%  |    The outputs of dealer.p will vary depending on the action it is
%  |    called for.
%  |
%  |    When the input is 'start':
%  |    - dealerUpCard: the numeric value of the dealer's shown card
%  |    - playerCard: a 1x2 vector of the 2 numeric values of the player cards
%  |
%  |    When the input is 'hit':
%  |    - dealerUpCard: will still be numeric value of the dealer's up card
%  |    - playerCard: the numeric value of the new card the player was dealt
%  |
%  |    When the input is 'stay':
%  |    - dealerUpCard: a 1xN vector of the dealer's final hand, after they
%  |                    have either gone over 21 or decided to stay
%  |    - playerCard: an empty vecor
%  |
%  |-----------------------------------------------------------------------
%
%   You are also given an array containing the optimal blackjack strategy.
%   You will use this to determine whether to hit or stay given what your
%   hand adds up to and what card the dealer is showing. This array is
%   saved in 'blackjackStrategy.mat'. Double click on the file to load the
%   contents. The matrix it contains is as shown, and is a variable
%   named strategyArray:
% 
%                     Dealer Up Card
%     Player Hand |  2,3,4,5,6,7,8,9,10,A (which will be represented by 11)
%     ____(sum)___|___________________________
%     17-20       | [0,0,0,0,0,0,0,0, 0,0;...
%     13-16       |  0,0,0,0,0,1,1,1, 1,1;...
%     12          |  1,1,0,0,0,1,1,1, 1,1;...
%     <11         |  1,1,1,1,1,1,1,1, 1,1]
% 
%
%   A value of 1 means 'hit' and 0 means 'stay'. For example, the value at
%   the intersection of the player's cards summing to 12 and the dealer
%   having an up card of 6 is 0, so the optimum strategy at that point in
%   the game is to stay. However, if the player's cards summed to 12 but
%   the dealer had an up card of 9, the array has a value of 1 meaning that
%   you should hit. If you happen to know blackjack strategy, do not
%   worry about the fact that this doesn't account for a "soft hand", and
%   please use this array for your function's strategy.
%
%   Face cards in the deck will merely be represented by the number 10, as
%   that is their value in blackjack (don't worry, there are lots of 10's
%   in the dealer's deck to account for all the face cards). Aces will be
%   represented by the number 11. Aces in blackjack can always either take
%   a value of 11 or 1. You should always treat aces as having a value of
%   11 for this problem, until you go over 21. If you go over 21, you
%   should have a condition to check if you have an aces, and to change
%   its value to 1 if you do. You would then reevaluate whether to hit or
%   stay with the new sum of your hand.
%
%   The function that you write should iterate through a game of blackjack
%   using the dealer.p function, and using the strategy contained in the
%   matrix above. The output should be a string of the outcome of the game:
%   either 'The dealer wins :(' if the dealer wins the game, or 'The player
%   wins!' if the player wins the game. One final note: if you are dealt a
%   hand adding up to 21 at the start of the game, then you should output
%   'Blackjack!'.
%
% Notes:
%   - Do not try to 'reverse engineer' the card order that the helper
%     function outputs. You will spend more time doing that then it'd take
%     to actually code the problem, and we will use a different predefined
%     deck to run the autograder anyway.
%   - A single game of blackjack only lasts until the player decides to
%     stay and the dealer shows their hand. The winner is then decided.
%   - If the player and dealer's hand add up to the same thing, then the
%     dealer wins.
%   - Output 'Blackjack!' if your hand adds up to 21 at the start of the
%     game, but NOT if you get a hand that adds up to 21 by "hitting".
%
% Hints:
%   - Think about how to use the strategy matrix to determing the iteration
%     ending condition.
%   - Try to simplify the logic of the game as much as possible.
%
% Test Cases:
%   You will definitely want to check your code against the solution .p
%   file with many other cardSeed values to make sure your function is
%   working correctly, but here are a few test cases that you can use in
%   the mean time:
%
%       winner1 = blackjack(18,strategyArray)
%           => winner1 = 'The player wins!'
%
%       winner2 = blackjack(78,strategyArray)
%           => winner2 = 'The dealer wins :('
%
%       winner3 = blackjack(79,strategyArray)
%           => winner3 = 'The player wins!'
%
%       winner4 = blackjack(3,strategyArray)
%           => winner4 = 'Blackjack!'
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
