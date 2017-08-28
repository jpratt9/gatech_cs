function index = search2( numVec, target)
l = length(numVec);
found = false;
for n = 1:l
    if target == numVec(n)
        found = true;
        index = n;
    end
end
if ~found
    index = -1;
end