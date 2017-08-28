%% cornMaze Tutorial

% Hey guys! This is a tutorial containing skeleton code for the EXTRA
% CREDIT problem "cornMaze". Recursion itself is sort of like a maze, so
% hopefully this tutorial can help you find a consecutive set of adjacent 
% neurons in your brain to help make recursion 'click.'


%% the wrapper function
% the wrapper function allows us to make the actual recursive function more
% powerful and flexible by setting up more inputs and outputs for our
% recursive function than the problem statement allows. 

function [out scares] = cornMaze(maze)

% mark the starting point as 'visited' by putting an 'X' in the maze
maze{?,?} = 'X';

% define bounds of maze
RC = size(?);

% initialize starting position
rc = [? ?];

% initialize number of scares
scares = ?;

% call recursive function (this is the helper function below)
[? ?] = you(?,?,?,?);

end

%% the recursive function
% your recursive function ideally outputs the outcome string and number of
% scares. it ideally takes in an updated maze, the bounds of the maze, your
% current position, and an updated number of scares

function [? ?] = you(?,?,?,?)
% initialize out as Trapped
out = 'Trapped!';

% if statement that catches if the exit is reached
if ??? % desired location is on bottom right
    out = 'Escaped!';
else
    % whereto should be an array of coordinates representing the row/col
    % difference between your current location and the surrounding
    % locations
    whereto = ???;
    
    % set up a loop to go to all possible adjacent cells, and don't forget 
    % to not go into the loop if you've escaped already!
    while ??? % can be a for loop, but have to structure differently
        % update position
        newrc = ???;
        % if statement making sure you are within maze bounds
        if ???
            % if adjacent cell is an undiscovered path, mark and call
            % recursive function. do the same if adjacent cell has live
            % actor, but call recursive function with updated scares
            switch maze{?,?}
                case {'P'}
                    maze{?,?} = 'X';
                    [? ?] = you(?,?,?,?);
                case {'Z'}
                    maze{?,?} = 'X';
                    scares = ?;
                    [? ?] = you(?,?,?,?);
            end
        end
    end
end
end



