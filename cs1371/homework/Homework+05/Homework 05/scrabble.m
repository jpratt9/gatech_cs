function [ score ] = scrabble( word, pointValues )
%SCRABBLE Returns the SCORE obtained by playing WORD in the game Scrabble
%given letter point values POINTVALUES.
word = lower(word); %First, ignore case on the word

scoreMultiplier = 2 .^ length(strfind(word, '!')); %final word score is multiplied by 2 raised to the power of !'s present

%lines 8-13 remove !'s by replacing them with spaces then removing spaces
for n = 1:length(word)
    if strcmp(word(n),'!')
        word(n) = ' ';
    end
end
word = word(~isspace(word));

%find the indices of letter doublers, #s
doubleLetterIndices = strfind(word,'#');
for n = 1:length(doubleLetterIndices)
    doubleLetterIndices(n) = doubleLetterIndices(n) - n;
end

%lines 23-28 remove !'s by replacing them with spaces then removing spaces
for n = 1:length(word)
    if strcmp(word(n),'#')
        word(n) = ' ';
    end
end
word = word(~isspace(word));

%finds position in the alphabet of all letters
letterNumbers = word - 96;

%stores scores associated with each letter of WORD
for n = 1:length(word)
    letterScores(n) = pointValues(letterNumbers(n));
end
%takes into account double letter tiles
letterScores(doubleLetterIndices) = letterScores(doubleLetterIndices) .* 2;
%sums up scors of each letter then multiplies by SCOREMULTIPLIER
score = sum(letterScores) .* scoreMultiplier;
end