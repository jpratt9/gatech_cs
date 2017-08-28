function index = search1( numVec, target)
l = length(numVec);
found = false;
index = 1;
while ~found
    if target == numVec(index)
        found = true;
    else
        index = index + 1;
        if index > l
            index = -1;
            break;
        end
    end
end
end