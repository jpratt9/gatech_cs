function fnum = fib(N) 
%this is the wrapper function preventing neg. vals
%returns the nth fibonacci number
%or number of rabbits after n months
%1 1 2 3 5 8 13 21 ....
if (N < 1)
    error('Positive input required');
else
    fnum = realFib(N);
end
end

function fnum = realFib(N) %does the real work; assumes positive input
if (N == 1) || (N == 2) %base case / terminating condition
    fnum = 1;
else
    fnum = realFib(N-1) + realFib(N-2);
end
end

