function g = sigmoid( z )
%	S形函数
%   传递过来z,求对应的假设函数h的值

%% 初始化变量
g = zeros(size(z));

%% 求s形函数
g = 1./(1+exp(-z));

end

