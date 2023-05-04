function [L, U, P] = luFactor(A)
% luFactor(A)
%	LU decomposition with pivotiing
% inputs:
%	A = coefficient matrix
% outputs:
%	L = lower triangular matrix
%	U = upper triangular matrix
%   P = the permutation matrix


%check if matrix is the correct size
[n,m] = size(A);
if n ~= m
    error('Matrix must be a square')
end

%create the matrices
L = diag(ones(1,length(A)));
U = zeros(3);
P = L;

%main loop
for i = 1:length(A)

    %find the max in the column
    [~,idx] = max(abs(A(i:end,i)));

    %swap rows for A and id if the largest number is in the first row
    if idx~=1
        P([i idx+i-1],:) = P([idx+i-1 i],:);
        A([i idx+i-1],:) = A([idx+i-1 i],:);

        %shift l if needed
        if i~=1
            l([i idx+i-1],1:i-1) = l([idx+i-1 i],1:i-1);
        end
    end

    %populate ith row of U
    U(i,:) = A(i,:);

    for j=i+1:length(A)
        %find L coefficents
        L(j,i) = A(j,i)/A(i,i);

        %multiply A rows by coefficents and subtract from original
        A(j,:) = A(j,:)-A(i,:)*L(j,i);

    end
end
end