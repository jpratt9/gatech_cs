function ans = mystery(str)

if isempty(str)
    ans = str;
else
    ans = [mystery(str(2:end)) str(1)];
end
end