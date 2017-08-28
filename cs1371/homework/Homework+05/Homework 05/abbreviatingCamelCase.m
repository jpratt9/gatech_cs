function [ camel ] = abbreviatingCamelCase( sentence )
%ABBREVIATINGCAMELCASE Returns an abbreviated camel-cased version of
%SENTENCE
%   removes spaces from the sentence
[camel, rest] = strtok(sentence,' ');
%ensures the camelsentence starts with a lowercase letter
camel = lower(camel);
%finds vowels ad removes them from the first word (excluding the first
%letter)
vowels = camel == 'a' | camel == 'e' | camel == 'i' | camel == 'o' | camel == 'u';
vowels = [false vowels(2:end)];
camel(vowels) = '';
%runs through the rest of SENTENCE performing the same actions on each
%word, but instead capitalizing the first letter of each word
while ~isempty(rest)
    [word, rest] = strtok(rest,' ');
    word(1) = char(upper(word(1)));
    vowels = word == 'a' | word == 'e' | word == 'i' | word == 'o' | word == 'u';
    vowels = [false vowels(2:end)];
    word(vowels) = ''; 
    camel = [camel word];
end
end