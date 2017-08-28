function report = smarterThan5thGrader(questions, contestant, fifthGraders)
%Returns the results of a game of "Are You Smarter Than a Fifth Grader?"
%given questions struct QUESTIONS, contestant info struct CONTESTANT, and fifth
%grader responses struct FIFTHGRADERS
keepGoing = true;         
ndx = 1;                 
helpCalls = 0;           
fifthGradersUsed = {};
winnings = 0;
helpWrongs = 0;
while keepGoing && ndx <= length(questions)   % while the previous answer was correct and we're
    helped = false; % whether contestant asked for help with this question
    if strcmp(contestant.Answers{ndx},'Ask a 5th Grader') && helpCalls < 2 && ndx < 11  % if the contestant tries asking for help
        contestant.Answers{ndx} = fifthGraders(ndx).Answer; % the contestant will take the fifth grader's answer
        fifthGradersUsed = [fifthGradersUsed fifthGraders(ndx).Name]; % and the name of the fifth grader will be recorded
        helpCalls = helpCalls + 1;
        helped = true; % contestant took help for this question
        if ~strcmp(contestant.Answers{ndx},questions(ndx).Answer)
            helpWrongs = helpWrongs + 1;
        end
    end
    correct = strcmp(contestant.Answers{ndx},questions(ndx).Answer);
    if correct || (helped && helpCalls == 2) || (helped && helpWrongs < 2 && helpCalls == 2)% if contestant answered correctly or they've just accepted their first assist or 
        winnings = winnings + questions(ndx).Value;
    else
        keepGoing = false;
    end
        
    if keepGoing
        ndx = ndx + 1;  % advance to the next question
    end
end
contestant.NumberQuestionsAnswered = ndx-1; %ndx will always be 1 higher than the number of questions answered
contestant.Winnings = winnings;
contestant.FifthGradersUsed = fifthGradersUsed;
report = rmfield(contestant,'Answers');
end

%TO GET CREDIT, EITHER CONTESTANT:
%   ANSWERED CORRECTLY
%   IS USING HELP FOR THE FIRST TIME
%   IS USING HELP FOR THE SECOND TIME AND THE HELP WAS RIGHT BEFORE