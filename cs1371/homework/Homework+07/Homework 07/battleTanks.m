function [winField, winHits, winDestroys] = battleTanks(field1, field2, moves)
%Returns the results of a game of battleship given the starting fields and a string of moves
winField = [];
player1Hits     = [];
player2Hits     = [];
player1Destroys = [];
player2Destroys = [];

moves = moves(moves ~= ' '); %remove spaces from the move list

tankSizes = [2, 3, 4, 6]; %saves a few lines when checking if tanks are destroyed

%checks which tank types each player started with
player1StartTanks = [sum(sum(field1 == 1))/2, sum(sum(field1 == 2))/3, sum(sum(field1 == 3))/4, sum(sum(field1 == 4))/6];
player2StartTanks = [sum(sum(field2 == 1))/2, sum(sum(field2 == 2))/3, sum(sum(field2 == 3))/4, sum(sum(field2 == 4))/6];

playing = true; %whether the game is still going
for x = 1:2:length(moves)
    if playing
        loc = [str2double(moves(x+1)), moves(x)-'A'+1]; %location to be attacked
        if mod((x-1),4) == 0 %even-numbered move so player 1 goes
            if field2(loc(1),loc(2)) ~= 0 %if the space in field 2 contains a tank
                player1Hits = [player1Hits field2(loc(1),loc(2))]; %adds this tank to the list of tanks hit by player 1
                field2(loc(1),loc(2)) = 0; %marks the spot as hit
                %run through all types of tanks on field 2 and check to see if any
                %were destroyed (if they existed in the first place)
                for tank = 1:4
                    %if player 2 had the tank type in the first place, and player 1
                    %has hit that tank type a number of times equal to its size
                    %and that tank type hasn't already been destroyed
                    %note that the 'any' deals with cases where a certain tank
                    %wasn't placed (1,2, and 4 for example)
                    if player2StartTanks(tank) && sum(player1Hits == tank) == tankSizes(tank) && (isempty(player1Destroys) || ~any(player1Destroys == tank))
                        %ignore the error here.  the if statement's conditions
                        %make sure it only changes size if a tank was destroyed
                        player1Destroys = [player1Destroys, tank];
                    end
                end
                
                
            end
            if field2 == zeros(8,8) %if player 2's field is empty
                winField = field1;
                winHits = player1Hits;
                winDestroys = player1Destroys;
                playing = false;
            end
        else %odd-numbered move so player 2 goes
            %everything that happens here is synonymous to player 1's turn,
            %so commenting isn't really necessary
            if field1(loc(1),loc(2)) ~= 0
                player2Hits = [player2Hits, field1(loc(1),loc(2))];
                field1(loc(1),loc(2)) = 0;
            end
            
            for tank = 1:4
                if player1StartTanks(tank) && sum(player2Hits == tank) ==  tankSizes(tank) && ~any(player2Destroys == tank)
                    %ignore the error here.  the if statement's conditions
                    %make sure it only changes size if a tank was destroyed
                    player2Destroys = [player2Destroys, tank];
                end
            end
            if field1 == zeros(8,8) %if player 2's field is empty
                winField = field2;
                winHits = player2Hits;
                winDestroys = player2Destroys;
                playing = false;
            end
        end
    end
end

if isempty(winField) %winField will be unassigned if not all tanks are destroyed on both fields
    if length(player1Hits) > length(player2Hits) %player 1 got more hits
        winField = field1;
        winHits = player1Hits;
        winDestroys = player1Destroys;
    elseif length(player1Hits) < length(player2Hits) %player 2 got more hits
        winField = field2;
        winHits = player2Hits;
        winDestroys = player2Destroys;
    else %tie
        winField = field1;
        winHits = field2;
        winDestroys = 'Cease fire!';
    end
end
end