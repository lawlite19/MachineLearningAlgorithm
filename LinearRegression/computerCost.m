function J = computerCost( X,y,theta )
%	计算代价函数具体的值

%% 初始化变量
m = length(y);
J = 0;

%% 计算代价
J = (X*theta-y)'*(X*theta-y)/(2*m);

end

