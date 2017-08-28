%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name         : John Pratt
% GT Email     : jpratt9@gatech.edu
% Homework     : hw05
% Course       : CS1371
% TA's Name    : Nick Fahrenkrog/Edward Foyle
% Section      : B05
% Collaboration: I worked on this homework with no other students, used 
%                solutions or partial solutions provided by MathWorks
%                forums and referred to 
%                http://www.mathworks.com/matlabcentral/."
%
%
% Files provided with this homework:  
%	hw05.m
%   ABCs_strings.m
%   ABCs_hw05_pretest.p
%   abbreviatingCamelCase_soln.p
%   textStretch_soln.p
%   piglatin_soln.p
%   scrabble_soln.p
%   caesarWrapCase_soln.p
%   letterPoints.mat
%
% Files to submit:
%	hw05.m
%   ABCs_strings.m
%   abbreviatingCamelCase.m
%   textStretch.m
%   piglatin.m
%   scrabble.m
%   caesarWrapCase.m
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
%       - ABCs_strings.m
% ABCs File Testing:
%  >> ABCs_hw05_pretest
%
% The pretest file included is not designed to tell you your grade on the
% ABCs. It is simply designed as a supplementary resource to help you check
% your code. Though we strive to avoid all mistakes in the pretest file,
% they do still occur. However, a mistake in the pretest file is not
% grounds for a regrade request, due to the supplementary nature of the
% pretest file.
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
% PROBLEM 1.   Even camels abbreviating things these days... HMP DYYYYYY
%--------------------------------------------------------------------------
%
% Function Name: abbreviatingCamelCase
%
% Inputs  (1): - (char) A sentence to be Abbreviating Camel Cased
%                
% Outputs (1): - (char) The abbreviated and camel cased sentence
%
% Function Description:
%   Write a function that both abbreviates a sentence and converts it to
%   camel case. You will abbreviate the sentence by removing all of the
%   vowels from the sentence, unless the vowel is the first letter of a
%   word, and then converting to camel case.
%
%   In case you are unfamiliar, you have already seen camel case in your
%   matlab homeworks. Camel case simply means removing all spaces from a
%   phrase, and instead using capitol letters to indicate where words
%   change. You also lowercase the first letter in the entire sentence. For
%   example: "Hello world lets party" would become "helloWorldLetsParty"
%   when converted to camel case.
%
% Example:
%
%       input: 'Speeding tickets are lame'
%
%       output: 'spdngTcktsArLm'
%
% Hints:
%   - The space characters in your string can be useful.
%   - You may assume there will not be any punctuation marks.
%
%
% Test Cases:
%
%       abbreved1 = abbreviatingCamelCase('woot I love matlab')
%           abbreved1 => 'wtILvMtlb'
%
%       abbreved2 = abbreviatingCamelCase('one fish two fish red fish blue fish')
%           abbreved2 => 'onFshTwFshRdFshBlFsh'
%
% Note: IF THE FORMAT OF YOUR OUTPUT STRING IS NOT EXACTLY RIGHT THEN
%       YOU WILL RECEIVE ZERO CREDIT FOR THIS PROBLEM. So make sure you
%       have no typos, that you include all the correct punctuation, and
%       that you don't have an extra space character on the end that you
%       can't see.
%
%==========================================================================
% PROBLEM 2.   This homework is soooo hard
%--------------------------------------------------------------------------
%
% Function Name: textStretch
%
% Inputs  (4): - (char) A string representing a phrase
%              - (char) A string representing a word
%              - (char) A character representing a letter
%              - (double) A stretch factor
%
% Outputs (1): - (char) A string representing the phrase that has been
%                       infused with flirtation/elation/annoyance/sarcasm
%
% Function Description:
%   It's often hard to express emotions such as flirtation, elation, 
%   annoyance, and especially sarcasm through written means of 
%   communication, such as texting, tweeting, or instant messaging. In
%   an attempt to circumvent this limitation, word lengthening has become a
%   common phenomenon in informal written language, especially in teens.
%
%   Given a phrase, a word, a letter, and a stretch factor, write a 
%   function that identifies the letter in the word in the phrase and
%   stretches it by the factor and returns the same phrase, but with the
%   modified word infused with emotion. For example, run some of the test
%   cases below with the given solution file.
%
% Notes: 
%   - the letter given is guaranteed to appear only once in the given word
%   - the string representing the word is guaranteed to appear only once in
%     the phrase. For example, if the string was 'bag', any word with 'bag',
%     such as 'baggage' or 'eyebag' will not appear in the phrase.
%
% Hints:
%   - the ones() function might be useful
%   - the strfind() functions might be useful
%   - remember concatenation concepts
%
% Test Cases:
%
%       phrase1 = 'this homework is so hard';
%       word1 = 'so';
%       letter1 = 'o';
%       factor1 = 5;
%       out1 = textStretch(phrase1,word1,letter1,factor1);
%           out1 => 'this homework is sooooo hard'
%
%       phrase2 = 'hey I need help with my homework';
%       word2 = 'hey';
%       letter2 = 'y';
%       factor2 = 3;
%       out2 = textStretch(phrase2,word2,letter2,factor2)
%           out2 => 'heyyy I need help with my homework'
%
%       phrase3 = 'shut the front door';
%       word3 = 'front';
%       letter3 = 'f';
%       factor3 = 4;
%       out3 = textStretch(phrase3,word3,letter3,factor3)
%           out3 => 'shut the ffffront door'
%
% Note: IF THE FORMAT OF YOUR OUTPUT STRING IS NOT EXACTLY RIGHT THEN
%       YOU WILL RECEIVE ZERO CREDIT FOR THIS PROBLEM. So make sure you
%       have no typos, that you include all the correct punctuation, and
%       that you don't have an extra space character on the end that you
%       can't see.
%
%==========================================================================
% PROBLEM 3.   2nd graders wrtite matlab these days? Wow...
%--------------------------------------------------------------------------
%
% Function Name: piglatin
%
% Inputs  (1): - (char) A string of two nouns separated by a space.
%                
% Outputs (1): - (char) A cryptic sentence to confuse your 2nd grade
%                       teacher.
%
% Function Description:
%   Let's imagine for a second that you're 7 years old again, and have just
%   discovered the wonders of pig-latin and using it to confuse your
%   teachers. So naturally (since this is CS 1371), you're going to write a
%   matlab function to do this for you!
%
%   Write a matlab function that takes in a string of two random nouns,
%   separated by a space. These two nouns are the answers to two questions
%   that your teacher has asked you: the first is your favorite thing in
%   the world, and your second is your least favorite thing in the world.
%   (Because those are the kinds of things teachers ask you in 2nd grade,
%   after all.) So your function will need to convert the inputted words to
%   pig latin, and then print them into a sentence that you can then read
%   to your teacher.
%   
%   An explanation of pig latin: a word in pig latin has its first sound
%   removed (ex: "taco" becomes "aco" when you remove the T sound), and
%   then this first sound is used with 'ay' after it, and hyphenated to the
%   end of the word-without-its-first-sound.
%
%   example table:     Original Word | Pig Latined Word
%                     ----------------------------------
%                      Matlab        | Atlab-May
%                      Computer      | Omputer-Cay
%                      Transfer      | Ansfer-Tray
%                      Through       | Ough-Thray
%
%   Notice that it is not always a matter of taking the first letter off of
%   the original word, but taking all the letters up to the first vowel.
%
%   Then, once you have figured out the whole pig-latin thing, it's time to
%   actually answer the question your teacher asked you. To do this, simply
%   print the two words into a string as such:
%
%       'My most favorite thing in the world is _____, but I hate _____!'
%
%   Where the underscores represent where you should put the pig-latin-ed
%   words. Make the pig-latin-ed words all lowercase, and do not use any
%   spaces in them.
%
% Example:
%
%       input: 'Cliffs Totalitarianism'
%
%       output: 'My most favorite thing in the world is iffs-clay, but I
%                hate otalitarianism-tay!'
%
% Notes:
%   - There are no spaces between the hyphen and words in the pig latin
%     phrase.
%   - The input words will always be seperated by a single space.
%   - The letter Y will always be considered a consonant for this problem
%     (even if that is not gramatically correct).
%   - Always use the first vowel rule, even if the word is something like
%     "physics". This should become "ics-physay". (Notice that Y was treated
%     as a consonant)
%   - You may assume your inputted words will not start with a vowel.
%
% Hints:
%   - strtok() will be useful.
%
%
% Test Cases:
%
%       edited1 = piglatin('pictures frames')
%           edited1 => 'My most favorite thing in the world is ictures-pay,
%                       but I hate ames-fray!'
%
%       edited2 = piglatin('raspberry blackberries')
%           edited2 => 'My most favorite thing in the world is
%                       aspberry-ray, but I hate ackberries-blay!'
%
%       edited3 = piglatin('Physics september')
%           edited3 => 'My most favorite thing in the world is ics-physay,
%                       but I hate eptember-say!'
%
% Note: IF THE FORMAT OF YOUR OUTPUT STRING IS NOT EXACTLY RIGHT THEN
%       YOU WILL RECEIVE ZERO CREDIT FOR THIS PROBLEM. So make sure you
%       have no typos, that you include all the correct punctuation, and
%       that you don't have an extra space character on the end that you
%       can't see.
%
%==========================================================================
% PROBLEM 4.   'Matlab' is worth 10
%--------------------------------------------------------------------------
%
% Function Name: scrabble
%
% Inputs  (2): - (char) A string of the word played in scrabble, with score
%                       multiplier symbols.
%              - (double) A 1x26 vector of letter point values.
%
% Outputs (1): - (double) The score that the word earned.
%
% Function Description:
%   Write a function called "scrabble" that takes inputs of the word
%   played in scrabble and a vector of all letter point values in scrabble,
%   and outputs the score that the word would earn. In the string of the
%   word played, there will be multiplier symbols that correspond to
%   "double word score" and "double letter score" spaces.
%
%   The score multiplier symbols, which are a pound symbol (#) and an
%   exclamation point (!), indicate that the letter immediately preceding
%   the symbol in the input string was played on either a "double word
%   score" space or a "double letter score" space. An exclamation point
%   means a "double word score", whereas a pound symbol mean a "double
%   letter score space". What this means for you is that any letter with a
%   pound symbol after it needs to be counted twice, and that the entire
%   word's score needs to be multiplied by 2 for every exclamation point in
%   the string.
%
%   Example: If you input was 'Hel#lo!', then the first 'l' was played on a
%            double letter score space, and the final 'o' was played on a
%            double word score space. The output score would be 18.
%
%   The 2nd input will always be the same, and it is a 1x26 vector of the
%   letter point values in the alphabet. For example, the 8th index of this
%   vector is the number 8, which is how many points the letter J is worth
%   in scrabble (and J is the 8th letter in the alphabet).
%
%   All you have to do is add up the points of all the letters played in
%   the word, account for any score multiplers, and then output your the
%   score.
%
% Notes: 
%   - Any multiplication done to the final score by "double word" spaces
%     should be done after the "double letter" spaces have been added into
%     the score.
%   - "Double word" space multiplication should compound on itself. As in,
%     if there are three "double word" spaces in the word, then the score
%     should be doubled three times (or multiplied by 8).
%   - Your input is allowed to have both upper and lowercase letters. This
%     does not effect how many points each letter is worth.
%
% Hints:
%   - sum() and strfind() could be useful.
%
% Test Cases:
%
%       load('letterPoints.mat')
%
%       score1 = scrabble('MATLAB', letterPoints)
%           score1 => 10
%
%       score2 = scrabble('Ramblin!gwreck', letterPoints)
%           score2 => 54
%
%       score3 = scrabble('Q#uar!tz#ifer#ous!', letterPoints)
%           score3 => 220
%
%==========================================================================
% PROBLEM 5. EXTRA CREDIT  EXTRA CREDIT  EXTRA CREDIT  EXTRA CREDIT
%--------------------------------------------------------------------------
%
% Function Name: caesarWrapCase
%
% Inputs  (2): - (char) Some string that needs to be encoded.
%              - (double) An integer of how far to shift.
%
% Outputs (1): - (char) The inputted string encoded with a caesar shift.
%
% Caeser Cipher Information:
% 	The Caesar cipher is named after Julius Caesar, who, according to 
% 	Suetonius, used it with a shift of three to protect messages of 
% 	military significance. It is unknown how effective the Caesar cipher
% 	was at the time, but it is likely to have been reasonably secure
%   because most of Caesar's enemies would have been illiterate and
% 	others would have assumed that the messages were written in an unknown 
%   foreign language.
% 
%   Caesar ciphers can still be found today in children's toys such as
%   secret decoder rings. A Caesar shift of thirteen is also performed in
%   the ROT13 algorithm, a simple method often used to obscure text such as
%   joke punchlines and spoilers online.
%
%	In the Caesar cipher, each letter is shifted by the specified amount.
%	For example, if the shift is 3, then the letter 'a' would be coded as
%	the letter 'd'. 
%
% Function Description:
%	Write a function that inputs a string and how far it needs to be
%	shifted, and performs the caesar shift. Only letters should be shifted
%	(as in, punctuation and space characters should not be changed). When a
%	letter goes beyond the alphabet from the shift performed, you will need
%	to make it wrap back around. What this means is that if the letter 'y'
%	is shifted by 4, it will need to wrap back around to 'C'. However,
%	letters for this variation of the caesar problem will need to change
%	case when they wrap back around. As in, lowercase letters will become
%	uppercase if they go past 'z', and uppercase letters will become
%	lowercase if they go past 'Z'. A letter is allowed to change case more
%	than once if it experiences a shift more than 26.
%
%   Example: Original Letter | Shift | New Letter
%            ------------------------------------
%            'x'             | 9     | 'G'
%            'a'             | -4    | 'W'
%            'Z'             | 3     | 'c'
%            'a'             | 26    | 'A'
%
% Notes:
%   - The Caesar cipher should work for both positive and negative integers
%     that indicate the shift given by the second input.
%   - Shifts may be positive or negative, and may have any value.
% 
% Hints:
%   - The mod() function may be useful.
%
% Test Cases:
%
%       coded1 = caesarWrapCase('Thank you Mario!', 4)
%           coded1 => 'Xlero Csy Qevms!'
%
%       coded2 = caesarWrapCase('Iba vby Wypujlzz pz pu huvaoly jhzasl!', 19)
%           coded2 => 'but OuR pRINCESS IS IN ANOtHER CAStLE!'
%
%       coded3 = caesarWrapCase('Uh, why isn''t this cipher working?', 52)
%           coded3 => 'Uh, why isn't this cipher working?'
%
% Note: IF THE FORMAT OF YOUR OUTPUT STRING IS NOT EXACTLY RIGHT THEN
%       YOU WILL RECEIVE ZERO CREDIT FOR THIS PROBLEM. So make sure you
%       have no typos, that you include all the correct punctuation, and
%       that you don't have an extra space character on the end that you
%       can't see.
%
%==========================================================================
% FINISHED!!!
%--------------------------------------------------------------------------
%
% Congratulations, you've finished this homework assignment.  Before you
% turn in your code be sure you have tested it throughly.  Once you've
% tested it you may submit it to T-square.  Be sure all files are submitted
% with the correct filenames.
