%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name         : John Pratt
% GT Email     : jpratt9@gatech.edu
% Homework     : hw08
% Course       : CS1371
% TA's Name    : Nick Fahrenkrag/Edward Foyle
% Section      : B05
% Collaboration: I worked on the homework assignment alone, using
%                only course materials.
%
% Files provided with this homework:
%   0074D3-CONVO.txt
%   0074D3-REPORT_soln.txt
%   1055HI-CONVO.txt
%   1055HI-REPORT_soln.txt
%   57K9L2-CONVO.txt
%   57K9L2-REPORT_soln.txt
%   ABCs_LowLevelFileIO.m
%   ABCs_hw08_pretest.p
%   BurgerBowl_RestockingData_soln.txt
%   BurgerBowl_inventoryData.txt
%   BurgerBowl_prices.txt
%   Caged Wisdom Mailing List.txt
%   Caged Wisdom Mailing List_updated_soln.txt
%   FemaleBlacklist.txt
%   Funeral.txt
%   Grand Prix Mailing List.txt
%   Grand Prix Mailing List_updated_soln.txt
%   HotWords0074D3.txt
%   HotWords1055HI.txt
%   HotWords57K9L2.txt
%   MaleBlacklist.txt
%   MatlabDeli_RestockingData_soln.txt
%   MatlabDeli_inventoryData.txt
%   MatlabDeli_prices.txt
%   Resistance.txt
%   Unsubscribe from Caged Wisdom.txt
%   Unsubscribe from Caged Wisdom_messages_soln.txt
%   Unsubscribe from Grand Prix.txt
%   Unsubscribe from Grand Prix_messages_soln.txt
%   abcs_lights.txt
%   hw08.m
%   inventory_soln.p
%   pickSong_soln.p
%   spySpeak_soln.p
%   teamPowerHolder_soln.p
%   teamPowerHolder_convo1.txt
%   teamPowerHolder_convo2.txt
%   teamPowerHolder_convo3.txt
%   unsubscribe_soln.p
%
% Files to submit:
%   hw08.m
%	ABCs_LowLevelFileIO.m
%	pickSong.m
%	inventory.m
%	teamPowerHolder.m
%	unsubscribe.m
%	spySpeak.m
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
%       - ABCs_LowLevelFileIO.m
% ABCs File Testing:
%  >> ABCs_hw08_pretest
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
% Problem 1.  You ain't got no Yeezy in your Serato?
%==========================================================================
%
% Function Name: pickSong
%
% Inputs (2):  - (char) filename of the text file containing the tracklist
%                (char) string indicating the remaining time
%
% Outputs (1): - (char) A string indicating the song that is closest to the
%                       input time. 
%
% Function Description:
%   Imagine you are a MATLAB-loving DJ. You look at the time and see that
%   you have X amount of time left in your DJ set. You will take the
%   tracklist of an album and will play the song closest to that amount of
%   time.
%
%    The tracklist will be a text file each line containing the title of
%    the song and the track length as follows:
%
%       6. Shake It Off - 3:39
%
%   The function you create will have two inputs, a string indicating
%   the file containing the tracklist and another string indicating time
%   left formatted as minute:seconds. Your function should output the title
%   of the song that is chosen as a string.
%
% Notes:
%   - Be careful with songs that may have '-' or ':' in their titles.
%   - Songs CAN be longer than the time remaining. You just need the song
%     with the closest track length.
%   - If two or more tracks are the closest to the remaining time, output 
%     the track that is listed the earliest.
%
% Test Cases
%
%   song1 = pickSong('Funeral.txt', '3:13')
%       song1 => 'Neighborhood #2 (Laika)'
%
%   song2 = pickSong('Funeral.txt', '5:01')
%       song2 => 'Rebellion (Lies)'
%
%   song3 = pickSong('Resistance.txt', '3:57')
%       song3 => 'Exogenesis: Symphony Part 2 (Cross-Pollination)'
%
%
%==========================================================================
% Problem 2. MATLAB Inventory
%==========================================================================
%
% Function Name: inventory
%
% Inputs  (2): - (char) The name of a .txt file containing inventory data
%                       for a restaurant.
%              - (char) The name of .txt file containg the price the store
%                       must pay for each item.
% 
% Outputs (1): - (double) A number: the total cost of restocking the
%                         restaurant.
%
% Output files  (1): A .txt file containing inventory restocking data.
% 
% Function Description:
%   Imagine that you're working some tedious part time job at a restaurant
%   for the summer, and your entire job consists of maintaining the store's
%   inventory. In order to make your life easier, you want to write MATLAB
%   code to do your job for you!
%
%   Write a function called "inventory" that takes in two txt files: one
%   txt file of inventory data after a day of sales, and a second txt file
%   of how much it costs to restock 1 of each item. You will need to use
%   these two txt files to find how many of each item you should buy to
%   completely restock the store, and then you will need to output the
%   total price to restock to full inventoy. You will also need to create
%   and output another txt file of inventory restocking data.
%
%   The format for these txt files will be as follows:
%
%   Input 1: <businessName>_inventoryData.txt
%       (the dashes are merely to indicate the start and end of the file,
%       and are not actually part of the file)
%       ---------------------------------
%       Inventory Data:
%       
%       Chips #40 #100
%       Lettuce #80 #90
%       Cheese #22 #60
%       ---------------------------------
%       
%       Notes:
%       - For this file, the name of the item comes first. The first number
%         is the number of this item are remaining in inventory at the end of
%         a day, and the second number is how many of that item you need for
%         full inventory.
%       - The naming convention for this file is:
%         <businessName>_inventoryData.txt
%      
%
%   Input 2: <businessName>_prices.txt
%       ---------------------------------
%       Prices:
%
%       Chips $2
%       Lettuce $2
%       Cheese $6
%       ---------------------------------
%
%       Notes:
%       - For this file, the items will be in the same order as in the first
%         input txt file. Then there will be a price after it, which will
%         always be a whole dollar amount.
%       - The naming convention for this file is:
%         <businessName>_prices.txt
%
%
%   Output: <businessName>_restockingData.txt
%       ---------------------------------
%       Inventory Data:
%       
%       Chips #40 #100
%       Lettuce #80 #90
%       Cheese #22 #60
%
%
%       Restocking Data:
%
%       Chips #100 #60
%       Lettuce #90 #10
%       Cheese #60 #38
%       ---------------------------------
%
%       Notes:
%       - For this file you will need to include the original inventory data,
%         and then put two empty lines before getting to the restocking data.
%         For the restocking data the order of the items should be the same
%         as it is in the two inputted files. Then the first number after
%         each item is the inventory amount after you restock the inventory
%         that day (so it should always be the same as each full inventory
%         amount). then thesecond number is how many of each item you had to
%         buy to restock.
%       - The naming convention for your output file is:
%         <businessName>_restockingData.txt
%   
%   Besides the three txt files described above, you will also need to
%   output a double of the total price spent to restock the entire store.
%
% Notes: 
%   - All inventory numbers will have a # in front of them 
%   - All the prices will have a $ in front of them and will always be a
%     full dollar amount.
%   - When creating the new output every item should be seperated by a space
%       Ex. 'Chips #5 #2'
%   - There will always be 5 items to stock.
%   - If your output file is not EXACTLY the same as the solution txt file,
%     then you will receive 0 credit for it.
%
% Test Cases:
% 
% [amountspent] = inventory('MatlabDeli_inventoryData.txt', 'MatlabDeli_prices.txt')
%       amountspent => 493
%
%       MatlabDeli_restockingData.txt should look exactly like
%       MatlabDeli_restockingData_soln.txt
%
%
% [amountspent2] = inventory('BurgerBowl_inventoryData.txt', 'BurgerBowl_prices.txt')
%       amountspent2 => 271
%
%       BurgerBowl_restockingData.txt should look exactly like
%       BurgerBowl_restockingData_soln.txt
%
%
%==========================================================================
% PROBLEM 3. Who's gonna get the project done
%--------------------------------------------------------------------------
%
% Function Name: teamPowerHolder
% Inputs  (1): - (char) Filename of a .txt file containing an email
%                       correspondence between any number of team members
% Outputs (1): - (char) The name of the person who is leading the team.
%
% Function Description:
% Write a function, teamPowerHolder, that takes in a .txt file of an email
% correspondence between a team for a group project and outputs the name of
% the person who is leading the team. For this problem, the leader of the
% team will be the first person to ask a question starting with "do you
% want ... ?" (Ex: "Do you want to do the data analysis, and I'll write the
% report?") Ignore capitalization.
%
% Guarantees:
%   - Someone will always ask a question starting with "do you want", and
%     maybe multiple people. The first one is the one who's leading the
%     group.
%   - Between each speaker there will be exactly one blank line.
%
% Hints:
%   - There are some emoticons in the conversations, so using strtok() up
%     to the colon won't work to pull out the name of who's speaking. Think
%     about the empty lines.
%   - Do NOT use fclose all or fclose('all'), just close files you open.
%
% Test Cases:
%
%   out1 = teamPowerHolder('teamPowerHolder_convo1.txt')
%           => 'Mike'
%
%   out2 = teamPowerHolder('teamPowerHolder_convo2.txt')
%           => 'Anna'
%
%   out3 = teamPowerHolder('teamPowerHolder_convo3.txt')
%           => 'Kelly'
%
%==========================================================================
% Problem X.  STOP EMAILING ME THIS IS THE THIRD TIME IN A ROW
%==========================================================================
%
% Function Name: unsubscribe
%
% Inputs (2):  - (char) the name of a .txt file consisting of a list of
%                       email addresses
% 			   - (char) the name of a .txt file consisting of a list of
% 		                names to be unsubscribed
%
% Outputs (0)
%
% Output Files (2): - A .txt file consisting of an updated list of email 
%                     addresses
% 				    - A .txt file consisting of a list of customized
%                     messages to send
%
% Function Description:
%   You are the newly elected secretary of an organization. This means you 
%   have to manage the member mailing list. Unfortunately, the previous 
%   managers of the mailing list have been terribly disorganized. The 
%   formatting and capitalization are not consistent, but worst of all, the
%   list is out of date! You have received numerous emails from previous
%   members that want to be unsubscribed from the list, and you have
%   collected their names. You don't want to manually go through and delete
%   email addresses from the mailing list, so you decide to write a MATLAB 
%   function to do it for you!
%
%   Write a function called "unsubscribe" that will update a mailing list 
%   to remove the email addresses of members that have chosen to 
%   unsubscribe. It must also clean up the formatting and capitalization of
%   the list. In addition to an updated mailing list, you must also create 
%   a file containing customized messages to send to ex-members of the 
%   mailing list. The two input file names will be 
%   '<organization name> Mailing List.txt' and 
%   'Unsubscribe from <organization name>.txt'. The two files you output 
%   must be named '<organization name> Mailing List_updated.txt' and
%   'Unsubscribe from <organization name>_messages.txt'.
%
%   Let's go through an example:
%   
%   You have two .txt files. You are given the file names. They are
%   'Looney Tunes Mailing List.txt' and
%   'Unsubscribe from Looney Tunes.txt'.
%
%     'Looney Tunes Mailing List.txt' looks like this:
%     ---------------------------------beginning of file (not part of file)
%     BBunny3@Gatech.edu; 
%     ppig3@gatech.edu,
%     Dduck3@Gatech.edu;
%     TDEVIL3@GATECH.EDU 
%     MmArTiAn3@GaTeCh.EdU 
%  
%     ---------------------------------------end of file (not part of file)
%     Note:
%       - There is one email address per line
%       - Each email address is in the format
%         '<first initial><last name><number>@gatech.edu'
%       - There may be commas, semicolons, and/or spaces at the end of each
%         line
%       - The capitalization of the letters in the email addresses is
%         random and inconsistent
%       - There may be empty lines at the bottom of the file, but not at
%         the top
%  
%     'Unsubscribe from Looney Tunes.txt' looks like this:
%     ---------------------------------beginning of file (not part of file)
%     porky pig, 
%     Daffy Duck;
%  
%  
%     ---------------------------------------end of file (not part of file)
%     Note:
%       - There is one name per line
%       - There may be commas, semicolons, and/or spaces at the end of each
%         line
%       - The capitalization of the letters in the names is random and
%         inconsistent
%       - There may be empty lines at the bottom of the file, but not at
%         the top
%  
%   You must now create two new files called
%   'Looney Tunes Mailing List_updated.txt' and
%   'Unsubscribe from Looney Tunes_messages.txt'.
%
%     'Looney Tunes Mailing List_updated.txt' should look like this:
%     ---------------------------------beginning of file (not part of file)
%     bbunny3@gatech.edu
%     tdevil3@gatech.edu
%     mmartian3@gatech.edu
%  
%     ---------------------------------------end of file (not part of file)
%     Note:
%       - There are no commas, semicolons, or spaces at the end of each
%         line
%       - The letters in the email addresses are all lowercase
%       - There is a single empty line at the bottom of the file
%       - The email addresses are listed in the same order as in the
%         original mailing list
%
%     'Unsubscribe from Looney Tunes_messages.txt' should look like this:
%     ---------------------------------beginning of file (not part of file)
%     Porky, you have been unsubscribed from the Looney Tunes mailing list.
%     Daffy, you have been unsubscribed from the Looney Tunes mailing list.
%
%     ---------------------------------------end of file (not part of file)
%     Note:
%       - There are no commas, semicolons, or spaces at the end of each
%         line
%       - Each line is in the format '<first name>, you have been
%         unsubscribed from the <organization name> mailing list.'
%       - The names are capitalized in the standard way; the first letter
%         is uppercase; the rest are lowercase
%       - There is a single empty line at the bottom of the file
%       - The names are listed in the same order as they appear in the original mailing list
%
%   That's all, folks! Be sure to review the provided test cases in great
%   detail. Your output files must match the solution files CHARACTER FOR
%   CHARACTER.
%
% Notes:
%   - No two members will have the same first initial and last name
%   - All members are guaranteed to have only 1 first name and 1 last name
%   - All files will have the .txt extension in the file name
%
% Hints:
%   - Don't forget to close all of your files
%
% Test Cases:
%
%   unsubscribe('Grand Prix Mailing List.txt', ...
%               'Unsubscribe from Grand Prix.txt')
%     => output file named 'Grand Prix Mailing List_updated.txt' that looks
%        like 'Grand Prix Mailing List_updated_soln.txt'
%     => output file named 'Unsubscribe from Grand Prix_messages.txt' that 
%        looks like 'Unsubscribe from Grand Prix_messages_soln.txt'
%
%   unsubscribe('Caged Wisdom Mailing List.txt', ...
%               'Unsubscribe from Caged Wisdom.txt')
%     => output file named 'Caged Wisdom Mailing List_updated.txt' that
%        looks like 'Caged Wisdom Mailing List_updated_soln.txt'
%     => output file named 'Unsubscribe from Caged Wisdom_messages.txt'
%        that looks like 'Unsubscribe from Caged Wisdom_messages_soln.txt'
%
%
%==========================================================================
% Problem 5.  Welcome to the NSA
%==========================================================================
%
% Function Name: spySpeak
%
% Inputs (3):  - (char) the name of a .txt file containing a tanscript of 
%                       an online conversation
%              - (char) the name of a .txt file containing a list of hot 
%                       words & male/female keywords
%              - (char) the name of a .txt file containing a list of male 
%                       spies (aka the Male Blacklist)
%              - (char) the name of a .txt file containing a llst of female 
%                       spies (aka the Female Blacklist)
%
% Outputs (0)
%
% Output Files (1): -  A .txt file containing a report on the conversation 
%                      with threat levels and identities of the spies
%
% Function Description:
%   Welcome to NSA headquarters, you've been assigned to our top-secret
%   service because of your awesome hacking skills!  We've provided you
%   transcripts of suspicious online conversations and it is your job to to
%   build a program that goes through them, line by line, word by word, and
%   find how many words match the provided list in the txt file of hot
%   words (the words up until the line of 6 dashes "------").  Not only
%   will you need to identify the threat level of each conversation (how
%   many hot words are said), but you will also need to name each suspect
%   based on their gender and their level of danger to the government.  
%
%   The last 2 lines in the hot words txt file contain the male and female
%   keywords, respectively. You will use these to identify which speaker in 
%   each conversation is male and female.  After you've found the gender of 
%   each suspect, you must assign them a spy level based on how many 
%   suspicious words they've said.  If no suspicious words are spoken, 
%   their spy level is "unknown". Besides this, their spy level will be the 
%   name of a spy, and the number of hot words each person says will define 
%   which name. If a male suspect says 1 hot word, their spy level is the 
%   spy name in the first line of MaleBlacklist.txt. If they say 2 hot 
%   words, then their spy name is the 2nd line, etc. The same goes for 
%   FemaleBlacklist.txt. You are guaranteed that no suspect will say more 
%   than 5 hot words.
%   
%   Let's go through an example:
%
%   Input conversation: 0074D3-CONVO.txt
%       ---------------------------- (not part of file)
%       cooldude1992: Hey you!
%       2hot4you: Hi.
%       cooldude1992: Have you written code for the cipher homework?
%       2hot4you: Yeah, I totally got burned out writing it though...
%       cooldude1992: Sweet! I'm down by the station right now.
%       cooldude1992: Can I drop by your place and you can help me?
%       2hot4you: Yep. This homework is the bomb!!
%       ---------------------------- (not part of file)
%
%   Input Hotwords file:
%       ---------------------------- (not part of file)
%       DROP
%       STATION
%       CODE
%       CIPHER
%       BURNED
%       BOMB
%       ------
%       TOTALLY
%       HEY
%       ---------------------------- (not part of file)
%
%   MaleBlacklist.txt
%       ---------------------------- (not part of file)
%       Perry the Platypus
%       James Bond
%       Sterling Archer
%       Jack Bauer
%       Sam Fisher
%       ---------------------------- (not part of file)
%
%   FemaleBlacklist.txt
%       ---------------------------- (not part of file)
%       Harriet the Spy
%       Irene Adler
%       Pamela Landy
%       Nikita Mears
%       Sydney Bristow
%       ---------------------------- (not part of file)
%
%   From the input conversation, we can deduce that cooldude1992 is female
%   (because she said 'Hey', the female keyword) and that 2hotforyou is
%   male (because he said 'totally', the male keyword). Parsing through the
%   conversation, cooldude1992 says a total of 4 hot words (CODE, CIPHER,
%   STATION, DROP), therefore her threat level is 4, therefore her identity
%   is Nikita Mears, the 4th line on FemaleBlacklist.txt. Similarly,
%   2hotforyou says a total of 2 hot words (BURNED, BOMB), therefore his
%   identity is James Bond, the 2nd line on MaleBlacklist.txt.

%   Using this information, you can write the report for the conversation.
%   the total threat level is the sum of the threat levels of both spies
%   (4+2 = 6), and the identity of suspect 1 is the first person to talk in
%   the conversation. Your output .txt file should look like this:
%
%   0074D3-REPORT.txt
%       ---------------------------- (not part of file)
%       THREAT LEVEL: 6
% 
%       SUSPECT 1 IDENTITY: Nikita Mears
%       SUSPECT 2 IDENTITY: James Bond
%       ---------------------------- (not part of file)
%
% Notes:
%   - The hot words in each conversation will be defined by the 2nd input
%     txt file.
%   - The last 2 lines in the hot words txt file contain the male and 
%     female keywords, respectively.
%   - Hot words that are contained inside other words do not count. So
%     strfind() will not work.
%   - Ignore capitalization when looking for hot words and gender keywords.
%   - You are not guaranteed that the genders will be different. So you may
%     have two females speaking.
%   - Each spy guaranteed to *not* say conflicting gender keywords (the
%     female will not say the male keyword at any time)
%   - If a spy says no hot words, their identity should return as 
%     'Unknown' regardless if their gender is identifiable or not.
%   - The number of hot words said by any suspect will not exceed the
%     length of their blacklist. As in, nobody will say more than 5 hot
%     words.
%
% Hints: 
%   - You can nest if statements and while loops, which may occur a lot in
%     this problem.
%   - Identifying the online ID of the first person to speak may be helpful
%     for later comparison.
%
% Test Cases:
%
%   spySpeak('0074D3-CONVO.txt', 'HotWords0074D3.txt', 'MaleBlacklist.txt', 'FemaleBlacklist.txt')
%       your output file should be named "0074D3-REPORT.txt" and look
%       exactly like "0074D3-REPORT_soln.txt"
%
%   spySpeak('1055HI-CONVO.txt', 'HotWords1055HI.txt', 'MaleBlacklist.txt', 'FemaleBlacklist.txt')
%       your output file should be named "1055HI-REPORT.txt" and look
%       exactly like "1055HI-REPORT_soln.txt"
%
%   spySpeak('57K9L2-CONVO.txt', 'HotWords57K9L2.txt', 'MaleBlacklist.txt', 'FemaleBlacklist.txt')
%       your output file should be named "57K9L2-REPORT.txt" and look
%       exactly like "57K9L2-REPORT_soln.txt"
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
