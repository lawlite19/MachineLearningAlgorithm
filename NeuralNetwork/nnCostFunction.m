function [ J grad ] = nnCostFunction( nn_params,...
                                      input_layer_size,...
                                      hidden_layer_size,...
                                      num_labels,...
                                      X,y,lambda)
%	计算代价函数，同时计算梯度（优化的梯度下降算法中需要）
%   @需要根据神经网络的结构修改

%% 初始化变量
Theta1 = reshape(nn_params(1:hidden_layer_size*(input_layer_size+1)),...
                hidden_layer_size,(input_layer_size+1));    %重新调整，Theta1为第一层对应的theta向量（这里25x401）
Theta2 = reshape(nn_params((1+(hidden_layer_size*(input_layer_size+1))):end),...
                num_labels,(hidden_layer_size+1));
m = size(X,1);
J = 0;  %代价
Theta1_grad = zeros(size(Theta1));  %第一层梯度，即为偏导数（最后会合为一个列向量）
Theta2_grad = zeros(size(Theta2));  %第二层梯度，即为偏导数

%% 计算一些需要的变量

class_y = zeros(m,num_labels);  %映射y，主要后面求J使用
for i = 1:num_labels
    class_y(:,i) = y==i;
end

Theta1_x = Theta1(:,(2:end));   %去掉第一列，因为正则化不包含theta(0)
Theta2_x = Theta2(:,(2:end));
regterm = [Theta1_x(:);Theta2_x(:)]'*[Theta1_x(:);Theta2_x(:)];

%% 正向传播
a1 = [ones(m,1),X]; %第一层输入数据
z2 = a1*Theta1';
a2 = sigmoid(z2);   %第二层
a2 = [ones(m,1),a2];
z3 = a2*Theta2';
h = sigmoid(z3);    %第三层，即输出

%% 反向传播
for i = 1:m
    delta3(i,:) = h(i,:)-class_y(i,:);              %最后一层的误差(1x10)
    Theta2_grad = Theta2_grad+delta3(i,:)'*a2(i,:); %梯度为下一层的delta(L+1)*当前层a(L)
    delta2(i,:) = (delta3(i,:)*Theta2_x).*sigmoidGradient(z2(i,:));     %delta为下一层的delta*当前层theta*（g(z)的倒数，z为当前层的）
    Theta1_grad = Theta1_grad+delta2(i,:)'*a1(i,:); 
end

%% 计算正则化的代价J
J = -((class_y(:)'*(log(h(:))))+((1-class_y(:))'*(log(1-h(:))))-(lambda*regterm/2))/m;  %   正则化的J

%% 计算正则化的梯度
Theta1(:,1) = 0;    %正则化的J求导后第1项不包含lambda，所以赋值为0
Theta2(:,1) = 0;
grad = ([Theta1_grad(:) ; Theta2_grad(:)] + lambda*[Theta1(:); Theta2(:)])/m;   %正则化的grad

end

