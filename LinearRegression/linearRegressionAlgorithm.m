function [fX, fY, slope, intercept, Rsquared] = linearRegression(x,y)
%linearRegression Computes the linear regression of a data set
%   Compute the linear regression based on inputs:
%     1. x: x-values for our data set
%     2. y: y-values for our data set
%
%   Outputs:
%     1. fX: x-values with outliers removed
%     2. fY: y-values with outliers removed
%     3. slope: slope from the linear regression y=mx+b
%     4. intercept: intercept from the linear regression y=mx+b
%     5. Rsquared: R^2, a.k.a. coefficient of determination


%check if the data is the same size
if size(y)~=size(x)
    error('Data must be the same size')
end

%sort the data
[fY, sortOrder] = sort(y);
fX = x(sortOrder);

    %filter outliers
%find Q1 and Q3
n = length(y);
Q1 = floor((n+1)/4);
Q3 = floor((3*n+3)/4);
%find the IQR
IQR = fY(Q3)-fY(Q1);
thresh = IQR*1.5;
uthresh = fY(Q3)+thresh;
lthresh = fY(Q1)-thresh;
%filter any data that is an outlier
idx = fY<lthresh|fY>uthresh;
fY(idx)=[];
fX(idx)=[];

    %linear regression
%variable set up
sxy = sum(fX.*fY);
sx = sum(fX);
sy = sum(fY);
sx2 = sum(fX.^2);
meanX = mean(fX);
meanY = mean(fY);
n = length(fX);

%calculation
slope = (n*sxy-sx*sy)/(n*sx2-sx^2);
intercept = meanY-slope*meanX;

%Rsquared
tot = sum((fY-meanY).^2);
res = sum((fY-(slope.*fX+intercept)).^2);
Rsquared = 1-res/tot;

end