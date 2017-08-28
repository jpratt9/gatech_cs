function res = factorialR(n)

%{
n! {n = 0; 1}
   {n > 0; n * (n-1)!}
%}

if (n == 0) %base case or terminating condition; prevents infinite recursion
    res = 1;
else
    res = n * factorialR(n-1);
end