function J = computerCost( X,y,theta )
%	计算代价函数具体的值
%   注意这里只是关于x的一次方情况，即h=theta(0)+theta(1)x1+theta(2)x2+...具体情况请修改

%% 初始化变量
m = length(y);
J = 0;

%% 计算代价
J = (X*theta-y)'*(X*theta-y)/(2*m);

end

