function [fact] = myfactorial(n)
% Compute the factorial of the natural number 'n'

if (n < 1)
    fact = 1;
elseif (n == 1)
    fact = n;
else
    fact = n*myfactorial(n-1);
end
