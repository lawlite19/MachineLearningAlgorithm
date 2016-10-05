function [ J,grad ] = costFunctionReg( theta,X,y,lambda )
%	求代价函数J和传递过来的theta对应的梯度

%% 初始化变量
m = length(y);
J = 0;
grad = zeros(size(theta));

%% 求出假设的值
h = sigmoid(X*theta);   %计算对应的S形函数值
theta1 = theta;
theta1(1) = 0; %这里因为正则化方法中不包含theta(1),所以复制一份theta,后续使用复制的theta1

%% 求代价函数J和梯度

J = (-y'*log(h)-(1-y)'*log(1-h)+theta1'*theta1*lambda/2)/m; %根据公式得出（关于求和可以将y转置，成绩后就是累加和）

grad = X'*(h-y)/m+lambda/m*theta1;  %根据公式得出


end

