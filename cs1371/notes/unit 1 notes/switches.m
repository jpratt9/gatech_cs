clear
clc

title = input('whats the title? ', 's')

% switch statements are better for case sensitive comparisons (length-wise)
% than if elseif statements

%{
switch statement - good for specific matches
syntax:

switch <parameter>
    case {<choices1>}
        <case1_block>
    case {<choices2>}
        <case2_block>
    otherwise
        <default_block>
end
%}
% otherwise statement is not required
% can have 

switch title
    case{'TD','TST','GoG'}
        time = input('What''s the movie time?\n (1) 11:30am (2) 1:30pm (3) 4:30pm (4) 6:00pm\n');
        switch time
            case {1, 2}
                fprintf('go see it\n');
            case {3, 4}
                fprintf('go see it, but find another time\n');
            otherwise
                fprintf('%d is not an option\n',time); % will find the first double (d) named 'time' 
        end
    case{'D','HFJ','Lucy'}
        fprintf('rent it');
    otherwise
        fprintf('movie is unsupported\n');
end
