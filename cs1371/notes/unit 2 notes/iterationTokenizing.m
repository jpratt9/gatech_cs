clear
clc

str = 'You should let me wet my beak a little.';

%Pronoun: I, me, he, she, herself, you, it, that, they, each, few, many, who....
%Poss. Adj: my, your, his, her, its...


pronCount = 0;
possCount = 0;
others = 0;

%keep tokenizing (i.e. below code) while there are more tokens
keepGoing = true;
rest = str;
while keepGoing
    [word, rest] = strtok(rest, ' .');
    
    if ~isempty(rest)
        word = lower(word);
        
        switch word
            case {'I', 'me', 'he', 'she', 'herself', 'you', 'it', 'that', 'they', 'each', 'few', 'many', 'who'}
                pronCount = pronCount + 1;
            case {'my', 'your', 'his', 'her', 'its'}
                possCount = possCount  + 1;
            otherwise
                others = others + 1;
        end
    end %end if
    keepGoing = ~isempty(rest);
    %keepGoing = length(rest) > 0
    
end  %end of code to repeat (while)

fprintf('%d Pronoun(s). %d Poss. Adj(s). %d Others\n', pronCount, possCount, others);


