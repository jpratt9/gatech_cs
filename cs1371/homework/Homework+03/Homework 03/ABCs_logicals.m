% DO NOT CHANGE THIS LINE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [A B C D E] = ABCs_logicals(num, vec1, vec2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Directions:
% Write the code to satisify the following directions. For each part, store
% your answer in the variable that is specified within the parentheses. 
%   Ex. Add 1 + 1. (GT)
% That means store the value of 1 + 1 in the variable GT, like so:
%   Ex. GT = 1 + 1;

% Given Input Variables (3):
%   1. (double) num - A positive integer. 
%   2. (double) vec1 - A vector of some arbitrary length.
%   3. (logical) logVec2 - Another vector of a different length, that will be logical data. 


% 1. Logical operators: Logical operators are things such as a greater than
% symbol, and can be used to compare two numbers and return a single
% logical true/false for whether the expression is true or not. The
% possible operators are: == "called double equals", which checks that two
% numbers are the same; > and <, which check if one number is greater or
% less than another number; >= and <=, which check for
% greater-than-or-equal-to and less-than-or-equal-to respectively; and
% finally there is ~=, which stands for "not equal to". Use this knowledge
% to check if your input variable, num, is a positive number (i.e. greater
% than zero). (A)
A = num > 0;


% 2. & and |. The "and" and "or" operators are simplistic, but very
% powerful when used well. &, or "and", simply compares two logical values
% and returns a single true if both of the logicals it was comparing are
% true. |, or "or" (which is shift + the key right above Enter), simply
% compares two logical values and returns a true if either of its compared
% values are true. Use this knowledge to find if num is both a positive
% number and not equal to 1. (B)
B = (num > 0 & num ~= 1);


% 3. Any() and all(). Any() and all() are two built-in functions in matlab
% that can be used on vectors of logical data. As their names imply, any()
% will return a true if there are any true values in the vector of
% logicals, and all() will return a true if every value in a vector of
% logicals is true. Any() is to the "or" operator as all() is to the "and"
% operator. Use this knowledge to find if all the logical values in vec2
% are true. (C.)
C = all(vec2);


% 4. is_____. Matlab has many built-in functions starting with "is", and
% these are usually referred to as the "is functions". A few "is" functions
% that apply to you with what you currently know are isequal, isnumeric,
% and islogical. isnumeric() and islogical() simply check the data class of
% a single input: isnumeric checks if its input is a numerical class of
% data, and returns a single true if so. islogical checks if its input is
% logical data, and returns a single true if so. Isequal has two inputs,
% and simply checks to see if they are equal, and is convenient because it
% will not error from differently lengthed vectors (like the double equals
% operator ("==")). Use this knowledge to check if vec1 is equal to
% vec2. (D)
D = isequal(vec1, vec2);


% 5. Checking for even or odd numbers. Something for which there is no
% built-in function, but that you will actually need to do quite a lot of,
% is checking if a number is even or odd. The usual way of going about this
% is by using the mod() function, and comparing a number's mod with 2 to
% either 0 or 1. For example, you can check if a number is even by writing
% out a line of code: "isEvenOrNot = mod(num,2) == 0;". Because if a number
% is divisible by 2, then its mod with 2 with just be 0. Use this and your
% knowledge of mod() to check if the input variable, num, is odd. (E)
E = mod(num,2) == 1;

end