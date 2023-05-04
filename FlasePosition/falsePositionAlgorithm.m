function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)

%set defaults and throw error if insufficent info given
if nargin<5
    maxit = 200;
end
if nargin< 4
    es = 0.0001;
end
if nargin<3
    error("Three Inputs Required")
end

%set default variables
ea = 100;
iter = 0;
x0 = 0;
x1 = 0;

%main loop with cut offs
while iter<maxit && ea>es

    %store previous guess
    x1 = x0;

    %calculate next guess
    x0 = xl - (((xu-xl)*func(xl))/(func(xu)-func(xl)));

    %find approximate error
    ea = abs((x1-x0)-x1)*100;
    
    %advance iter
    iter = iter+1;

    %replace the relevant variable
    if func(x0)<0
        xu = x0;
    elseif func(x0)>0
        xl = x0;
    else
        ea = 0;
    end

end

%store final values
root = x0;
fx = func(x0);

end