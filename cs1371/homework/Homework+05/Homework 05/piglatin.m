function [ sentence ] = piglatin( nouns )
% PIGLATIN Returns a sentence with blanks filled with pig Latin versions of
% the words in NOUNS
%splits up the nouns
[noun1, noun2] = strtok(nouns, ' ');
noun2 = noun2(2:end);fl

%no easy way to explain these steps, they just make the words into pig
%Latin words
[start1, end1] = strtok(lower(noun1),'aeiou');
[start2, end2] = strtok(lower(noun2),'aeiou');
first = [end1, '-', start1, 'ay,'];
second = [end2, '-', start2, 'ay!'];

%returns the pig Latin version of the sentence
sentence = ['My most favorite thing in the world is ', first, ' but I hate ', second];
end