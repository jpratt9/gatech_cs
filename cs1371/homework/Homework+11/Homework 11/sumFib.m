function sum = sumFib(n)
if n > 1 %if the number is greater than one
    sum = fib(n) + sumFib(n-1); %return the recursive sum of that number of fibinacci terms
else
    sum = fib(1); %base case: return first fibinacci term
end
end

function out = fib(in)

if in == 1 || in == 2 %base case: return 1
    out = 1;
else %otherwise, return sum of previous two terms recursively
    out = fib(in-1) + fib(in-2);
end
end