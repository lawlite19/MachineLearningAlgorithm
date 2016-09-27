function [ theta ] = normalEquations( X,y )
%	正规方程求解，当数据量大时（一般>10000），不考虑此方法

%% 初始化变量
theta = zeros(size(X,2),1);

%% 计算theta

theta = pinv(X'*X)*X'*y;

end

