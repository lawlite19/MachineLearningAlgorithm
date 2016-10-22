function [ J,grad ] = cofiCostFunction( params,Y,R,num_users,num_movies,...
                                        num_features,lambda)
%	计算代价和梯度
%   

%% 初始化变量
X = reshape(params(1:num_movies*num_features), num_movies, num_features);
Theta = reshape(params(num_movies*num_features+1:end), ...
                num_users, num_features);

J = 0;
X_grad = zeros(size(X));
Theta_grad = zeros(size(Theta));


%% 计算
term = X*Theta'.*R-Y.*R;
J = (term(:)'*term(:)+lambda*Theta(:)'*Theta(:)+lambda*X(:)'*X(:))/2;


X_grad = term*Theta+lambda*X;
Theta_grad = term'*X+lambda*Theta;

grad = [X_grad(:); Theta_grad(:)];
end

