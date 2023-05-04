function [I] = Simpson(x, y)
% Numerical evaluation of integral by Simpson's 1/3 Rule
% Inputs
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated

%error checking
if length(x) ~= length(y)
    error('Matries must be the same size')
elseif isuniform(x) ~= 1
    error('x vector must be evenly spaced')
elseif length(x) <= 1
    error('must have at least two data points')
elseif rem(length(x),2) == 0
    warning('Trapazoidel rule will be used on last interval')
end

%variable set up
I = 0;
h = x(2)-x(1);

%use simpsons 1/3 rule on all applicable numbers
for i=1:2:floor((length(x)-1)/2)*2-1
    %modified simpsons rule to account for h being the gap between two
    %points and not three
    I = I + (y(i)+4*y(i+1)+y(i+2))/3*h;
end

%use trap rule on last interval if needed
if rem(length(x),2) == 0
    I = I+((y(length(y)-1)+y(length(y))/2)*h);
end
