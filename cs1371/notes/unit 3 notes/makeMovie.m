function res = makeMovie(str)

% from http://boxofficemojo.com/weekend/chart/
%                   TW, LW,  Title,         Studio, Weekend Gross, 
% Change,Theaters / Change, Average, Total Gross, Budget, Week #
% e.g. '1,  N,  Just Go With It, Sony,     $30514732,        -,    3548,       -,   $8601,   $30514732,      -,    1'    
    [it, rest] = strtok(str, ',');
    res.thisWeek = getNumber(it);
    [it, rest] = strtok(rest, ',');
    res.lastWeek = getNumber(it);
    [it, rest] = strtok(rest, ',');
    res.title = deleteSpaces(it);
    res.title(res.title == '*') = ',';
    [it, rest] = strtok(rest, ',');
    res.studio = deleteSpaces(it);
    [it, rest] = strtok(rest, ',');
    res.weekend.gross = getNumber(it);
    [it, rest] = strtok(rest, ',');
    res.weekend.change = getNumber(it);
    [it, rest] = strtok(rest, ',');
    res.theaters.number = getNumber(it);
    [it, rest] = strtok(rest, ',');
    res.theaters.change = getNumber(it);
    [it, rest] = strtok(rest, ',');
    [it, rest] = strtok(rest, ',');
    res.gross = getNumber(it);
    [it, rest] = strtok(rest, ',');
    res.budget = getNumber(it);
end

function num = getNumber(str)
    str = deleteSpaces(str);
    if isempty(str)
        num = 0;
    elseif str(1) == '-' && length(str) == 1
        num = 0;
    else
        if str(end) == '%'
            str = str(1:end-1);
        end
        switch str(1)
            case 'N'
                num = 0;
            case '$'
                num = getNumber(str(2:end));
            otherwise
                num = str2num(str);
        end
    end
    if isempty(num)
        num = 0;
    end
end

function str = deleteSpaces(str)
    while ~isempty(str) && str(1) == ' '
        str(1) = [];
    end
end