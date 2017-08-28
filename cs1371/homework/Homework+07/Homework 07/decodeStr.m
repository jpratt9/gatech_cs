function decoded = decodeStr(code, shift)
decoded = [];
if strcmp(code,code(code ~= ' ')) %if the string had no spaces, just pick up every 'shift' character in it
    for n = shift:shift:length(code)
        decoded = [decoded code(n)];
    end
else %otherwise, pick up every 'shift' word in it
    rest = code;
    n = 1;
    while ~isempty(rest)
        [code, rest] = strtok(rest,' ');
        if mod(n,shift) == 0
            decoded = [decoded ' ' code];
        end
        n = n+1;
    end
end
if decoded(1) == ' ' %removes leading spaces
    decoded(1) ='';
end
end