function [ newString ] = textStretch( phrase, word, letter, stretch )
%TEXTSTRETCH Stretches out LETTER in WORD of PHRASE by STRETCH - 1
%finds the index of WORD within PHRASE and index of LETTER within WORD
wordIndex = strfind(phrase, word);
charIndex = strfind(word, letter);

%stores everything that follows the first appearance of LETTER within WORD
restOfPhrase = phrase(wordIndex+length(word):end);
%adds stretch - 1 of LETTER to WORD
for n = 0:stretch-2
    word = [word(1:charIndex+n-1) letter word(charIndex+n:end)];
end
%adds the altered version of WORD bac into PHRASE
newString = [phrase(1:wordIndex-1) word restOfPhrase];
end