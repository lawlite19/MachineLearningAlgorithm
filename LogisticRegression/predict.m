function p = predict( theta,X )
%	根据数据X预测
%   根据假设函数h（即sigmoid函数）预测，大于0.5的y即为1，小于0.5的y即为0

%% 初始化变量
m = size(X,1);
p = zeros(m,1);

%% 预测
p = sigmoid(X*theta); % 根据假设函数求出概率

for i = 1:m  %遍历判断
    if p(i)>0.5
        p(i)=1;
    else
        p(i)=0;
    end
end

end

