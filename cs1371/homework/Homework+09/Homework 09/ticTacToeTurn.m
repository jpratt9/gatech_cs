function outcomes = ticTacToeTurn(currentBoard, move)
%Returns a 2xN cell array whose first row has all possible tic-tac-toe 
%board states given cell array CURRENTBOARD and char MOVE, and whose second
%row is strings of all possible outcomes of each move, where N is the
%number of empty spaces
empty = find(strcmp(currentBoard,' ')); %finds linear indices of empty spaces in CURRENTBOARD
tempBoard = currentBoard; %clones CURRENTBOARD
tempBoard{empty(1)} = move; %applies the move to TEMPBOARD
tempBoardCharArray = [tempBoard{1,:};tempBoard{2,:};tempBoard{3,:}]; %makes a char array of current board
outcomes = {tempBoard; moveEvaluator(tempBoardCharArray,move)}; %creates first collumn of OUTCOMES cell array
for x = 2:length(empty) %lines 11-16 do the same as lines 6-10 and append each result to the current OUTCOMES cell array
    tempBoard = currentBoard;
    tempBoard{empty(x)} = move;
    tempBoardCharArray = [tempBoard{1,:};tempBoard{2,:};tempBoard{3,:}];
    outcomes = {outcomes{1,:}, tempBoard; outcomes{2,:}, moveEvaluator(tempBoardCharArray,move)};
end
end