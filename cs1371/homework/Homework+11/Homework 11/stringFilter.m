function sentence = stringFilter(nestedCA)
%Returns a string containing all strings within a nested cell array
sentence = '';
for i = 1:length(nestedCA)
    sentence = [sentence filter(nestedCA{i})];
end
end

function string = filter(ca)
temp = ''; %use a temp so we don't lose "string" when it calls itself recursively
if ischar(ca) && ~isempty(ca) %if input was a string, reassign temp to said string
    temp = ca;
elseif iscell(ca) && ~isempty(ca) %if we encounter a cell
    for i = 1:length(ca) %recursively run through each element, picking up strings
        temp = [temp filter(ca{i})];
    end
else
    temp = ''; %if we encounter a non-cell/string, terminate
end
%reassign string to temp at the end of each call to account for nested 
%cells containing cells and other data types
string = temp;
end