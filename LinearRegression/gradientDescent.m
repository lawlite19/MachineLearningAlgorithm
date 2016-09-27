function [ theta,J_history ] = gradientDescent( X,y,theta,alpha,num_iters )
%   梯度下降算法，迭代计算
%   注意这里只是关于x的一次方情况，即h=theta(0)+theta(1)x1+theta(2)x2+...具体情况请修改

%% 初始化变量
m = length(y);
n= length(theta);
temp = zeros(n,num_iters);
J_history = zeros(num_iters,1);

%% 迭代计算
for iter = 1:num_iters
    h = X*theta;
    temp(:,iter) = theta - ((alpha/m)*(X'*(h-y)));
    theta = temp(:,iter);
    
    J_history(iter) = computerCost(X,y,theta);
end

