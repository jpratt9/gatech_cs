%Strings
%   comparing  - ex: google returning similar results to what you type in
%   tokenizing
clear
clc

%string compare tests
login = 'omojokun';

%== results in a logical vector from making element by element char
%comparisons
login == 'omojokun';    % is login storing a string containing these chars?
login == 'omojokin' ;   % is login storing a string containing these chars?
login == 'Omojokin';

%login == 'smith'      % yields error because...

% when using ==, you can only compare strings of the same length

strcmp(login, 'smith');      % 
strcmp(login, 'Omojokun');   % strcmp is case sensitive just like == because
                            % of ASCII code differences
strcmpi(login,'Omojokun');   % however, strcmpi is not case sensitive

quote = 'Hasta la vista baby';  % let's tokenize this (i.e. break it up into meaningful chunks)

% below, I don't really care about tokens until we get to 'vista', so we
% use ~ to ignore token until then
[~, rest] = strtok(quote,' ');% this gives us the first token, and everything after it exclusding the delimiter
[~, rest] = strtok(rest,' ');  % eats up leading delimiters (i.e., if there were a space before it would not include it in the token)
token     = strtok(rest,' '); % however, it only does this with the token not the 'rest'

token == 'vista'

quote = 'Put. That Coffee. Down! Coffee''s for closers!'
[~, rest] = strtok(quote,' .!') ;% the delimiter list is just that: a list of delimiters.  don't seperate the delimiters with spaces 
[~, rest] = strtok(rest,' .!') ;
token     = strtok(rest,' .!');
%   it's smart to save your delimiter list as a variable if you're going to
%   be delimiting multiple times.  Generally, a delimiter is just anything
%   that can seperate words or tokens in a given string.

str = '!! !! !! a ! = 42';
delims = '! ';
[var, rest] = strtok(str,delims);
[op, rest] = strtok(rest,delims);
[num, rest] = strtok(rest,delims);
[var ' ' op ' ' num]        ;    %extracts the string 'a = 42' from this string


