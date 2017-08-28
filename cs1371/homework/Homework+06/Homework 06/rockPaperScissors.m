function [ result ] = rockPaperScissors( moves1, moves2 )
%ROCKPAPERSCISSORS Determines the overall outcome (RESULT) of three games of rock
%paper scissors given the moves of player 1 and 2 (MOVES1 and MOVES2)

%stores the moves of player 1 and 2 and sets their initial wins to 0
[move11, rest] = strtok(moves1,','); 
[move12, rest] = strtok(rest,',');
[move13, ~] = strtok(rest,',');
[move21, rest] = strtok(moves2,',');
[move22, rest] = strtok(rest,',');
[move23, ~] = strtok(rest,',');
wins1 = 0;
wins2 = 0;

%goes through each possible scenario of moves in games 1, 2, and 3 and
%determines winners as such
switch move11
    case 'Rock'
        switch move21
            case 'Paper'
                wins2 = wins2 + 1;
            case 'Scissors'
                wins1 = wins1 + 1;
        end
    case 'Paper'
        switch move21
            case 'Scissors'
                wins2 = wins2 + 1;
            case 'Rock'
                wins1 = wins1 + 1;
        end
    case 'Scissors'
        switch move21
            case 'Rock'
                wins2 = wins2 + 1;
            case 'Paper'
                wins1 = wins1 + 1;
        end
end

switch move12
    case 'Rock'
        switch move22
            case 'Paper'
                wins2 = wins2 + 1;
            case 'Scissors'
                wins1 = wins1 + 1;
        end
    case 'Paper'
        switch move22
            case 'Scissors'
                wins2 = wins2 + 1;
            case 'Rock'
                wins1 = wins1 + 1;
        end
    case 'Scissors'
        switch move22
            case 'Rock'
                wins2 = wins2 + 1;
            case 'Paper'
                wins1 = wins1 + 1;
        end
end

switch move13
    case 'Rock'
        switch move23
            case 'Paper'
                wins2 = wins2 + 1;
            case 'Scissors'
                wins1 = wins1 + 1;
        end
    case 'Paper'
        switch move23
            case 'Scissors'
                wins2 = wins2 + 1;
            case 'Rock'
                wins1 = wins1 + 1;
        end
    case 'Scissors'
        switch move23
            case 'Rock'
                wins2 = wins2 + 1;
            case 'Paper'
                wins1 = wins1 + 1;
        end
end
%the only way to win overall is to have won two of three games
result = 'Keep Playing!';
if wins1 >= 2
    result = 'Player 1 wins!';
elseif wins2 >= 2
    result = 'Player 2 wins!';
end
end