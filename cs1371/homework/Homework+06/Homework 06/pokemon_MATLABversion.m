function [ conclusion, finalStats ] = pokemon_MATLABversion( myStats, myType, revives )
%POKEMON_MATLABVERSION Gives the results (CONCLUSION) of pokemon battles
%and final stats of the pokemon (FINALSTATS) given the pokemon's starting
%stats (MYSTATS), type (MYTYPE), and number of revives the trainer has
%(REVIVES)
load('gymStats.mat');
keepGoing = true; %ensures the while loop executes at least once
battlesWon = 0; %initialization of BATTLESWON
while keepGoing
    switch battlesWon %the next gym is determined by the number of battles won so far
        case 0 %rock gym
            switch myType
                case {'Water', 'Grass', 'Fighting', 'Ground'} %checks special type scenarios and applies strong/weak multipliers if necessary
                    myTempStats = myStats .* 2;
                case {'Flying', 'Bug', 'Fire', 'Ice'}
                    myTempStats = myStats .* 0.5;
                otherwise
                    myTempStats = myStats;
            end
            if myTempStats(1) > stats1(2) %checks win conditions after strong/weak multipliers are applied
                battlesWon = battlesWon + 1;
                myStats = myStats + 0.2 .* stats1;
            elseif myTempStats(1) > 0.8 * stats1(2) && revives > 0
                battlesWon = battlesWon + 1;
                myStats = myStats + 0.2 .* stats1;
                revives = revives - 1;
            else
                keepGoing = false;
            end
        %everything is analagous to case 0    
        case 1 %water gym
            switch myType
                case {'Grass', 'Electric'}
                    myTempStats = myStats .* 2;
                case {'Ground', 'Rock', 'Fire'}
                    myTempStats = myStats .* 0.5;
                otherwise
                    myTempStats = myStats;
            end
            if myTempStats(1) > stats2(2)
                battlesWon = battlesWon + 1;
                myStats = myStats + 0.2 .* stats2;
            elseif myTempStats(1) > 0.8 * stats2(2) && revives > 0
                battlesWon = battlesWon + 1;
                myStats = myStats + 0.2 .* stats2;
                revives = revives - 1;
            else
                keepGoing = false;
            end
            
        case 2 %electric gym
            switch myType
                case 'Ground' %ground pokemon automatically win here
                    battlesWon = battlesWon + 1;
                    myStats = myStats + 0.2 .* stats3;
                case {'Flying', 'Water'}
                    myTempStats = myStats .* 0.5;
                otherwise
                    myTempStats = myStats;
            end
            if battlesWon == 2 %win conditions should only be checked if the pokemon was not ground type
                if myTempStats(1) > stats3(2)
                    battlesWon = battlesWon + 1;
                    myStats = myStats + 0.2 .* stats3;
                elseif myTempStats(1) > 0.8 * stats3(2) && revives > 0
                    battlesWon = battlesWon + 1;
                    myStats = myStats + 0.2 .* stats3;
                    revives = revives - 1;
                else
                    keepGoing = false;
                end
            end
        %everything after this point contained within the while loop is 
        %analagous to gyms 1 and 3, with the exception of the last gym
        case 3 %grass gym
            switch myType
                case {'Flying', 'Poison', 'Bug', 'Fire', 'Ice'}
                    myTempStats = myStats .* 2;
                case {'Ground', 'Rock', 'Water'}
                    myTempStats = myStats .* 0.5;
                otherwise
                    myTempStats = myStats;
            end
            if myTempStats(1) > stats4(2)
                battlesWon = battlesWon + 1;
                myStats = myStats + 0.2 .* stats4;
            elseif myTempStats(1) > 0.8 * stats4(2) && revives > 0
                battlesWon = battlesWon + 1;
                myStats = myStats + 0.2 .* stats4;
                revives = revives - 1;
            else
                keepGoing = false;
            end
        case 4 %poison gym
            switch myType
                case 'Steel'
                    battlesWon = battlesWon + 1;
                    myStats = myStats + 0.2 .* stats5;
                case {'Ground', 'Psychic'}
                    myTempStats = myStats .* 2;
                case 'Grass'
                    myTempStats = myStats .* 0.5;
                otherwise
                    myTempStats = myStats;
            end
            if battlesWon == 4
                if myTempStats(1) > stats5(2)
                    battlesWon = battlesWon + 1;
                    myStats = myStats + 0.2 .* stats5;
                elseif myTempStats(1) > 0.8 * stats5(2) && revives > 0
                    battlesWon = battlesWon + 1;
                    myStats = myStats + 0.2 .* stats5;
                    revives = revives - 1;
                else
                    keepGoing = false;
                end
            end
        case 5 %psychic gym
            switch myType
                case 'Dark'
                    battlesWon = battlesWon + 1;
                    myStats = myStats + 0.2 .* stats6;
                case {'Bug', 'Ghost'}
                    myTempStats = myStats .* 2;
                case {'Fighting', 'Poison'}
                    myTempStats = myStats .* 0.5;
                otherwise
                    myTempStats = myStats;
            end
            if battlesWon == 5 %stat checking only occurs if the pokemon wasn't dark
                if myTempStats(1) > stats6(2)
                    battlesWon = battlesWon + 1;
                    myStats = myStats + 0.2 .* stats6;
                elseif myTempStats(1) > 0.8 * stats6(2) && revives > 0
                    battlesWon = battlesWon + 1;
                    myStats = myStats + 0.2 .* stats6;
                    revives = revives - 1;
                else
                    keepGoing = false;
                end
            end
        case 6 %fire gym
            switch myType
                case {'Ground', 'Rock', 'Water'}
                    myTempStats = myStats .* 2;
                case {'Bug', 'Steel', 'Grass', 'Ice'}
                    myTempStats = myStats .* 0.5;
                otherwise
                    myTempStats = myStats;
            end
            if myTempStats(1) > stats7(2)
                battlesWon = battlesWon + 1;
                myStats = myStats + 0.2 .* stats7;
            elseif myTempStats(1) > 0.8 * stats7(2) && revives > 0
                battlesWon = battlesWon + 1;
                myStats = myStats + 0.2 .* stats7;
                revives = revives - 1;
            else
                keepGoing = false;
            end
        case 7 %ground gym
            switch myType
                case 'Flying'
                    battlesWon = battlesWon + 1;
                    myStats = myStats + 0.2 .* stats8;
                case 'Electric' %electric type pokemon can't win in this gym
                    keepGoing = false;
                case {'Water', 'Grass', 'Ice'}
                    myTempStats = myStats .* 2;
                case {'Poison', 'Rock', 'Steel', 'Fire'}
                    myTempStats = myStats .* 0.5;
                otherwise
                    myTempStats = myStats;
            end
            if keepGoing && battlesWon == 7 %stat checking only occurs if the pokemon wasn't flying or electric
                if myTempStats(1) > stats8(2)
                    battlesWon = battlesWon + 1;x
                    myStats = myStats + 0.2 .* stats8;
                elseif myTempStats(1) > 0.8 * stats8(2) && revives > 0
                    battlesWon = battlesWon + 1;
                    myStats = myStats + 0.2 .* stats8;
                    revives = revives - 1;
                else
                    keepGoing = false;
                end
            end
        otherwise
            keepGoing = false;
    end
end
finalStats = myStats; %stores the final value of MYSTATS

%this will be the second sentence of result unless all 8 battles were won
instructions = 'Keep training and you will challenge the Elite 4 one day.'; 
if battlesWon == 8
    instructions = 'You may now challenge the Elite 4.';
end
%concatinates the component strings of CONCLUSION
conclusion = ['You defeated ' num2str(battlesWon) ' gyms, and have ' num2str(revives) ' revives remaining. ' instructions];
end