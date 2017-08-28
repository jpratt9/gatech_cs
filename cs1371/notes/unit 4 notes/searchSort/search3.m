function index = search3(numVec,target)
l =length(numVec);
start=1;
stop=l;
while (start <= stop)
    index = floor((start+stop)/2);
    if (target < numVec(index))
        stop = index - 1;
    elseif (target > numVec(index))
        start = index + 1;
    else
        return;
    end;
end;
index = -1;
return;