function checkNNGradients( lambda )
%	梯度检查
%   步骤是构造一个小型的神经网络，分别使用构造好的bp和梯度的定义计算梯度
    %若是两个计算的梯度相差很小，代表构造的bp没有问题
%   lambda若没有指定则初始为0，相当于检验没有正则化的梯度

if ~exist('lambda','var') || isempty(lambda)
    lambda = 0;
end

%% 构造小型的神经网络
input_layer_size = 3;   %输入层units为3个
hidden_layer_size = 5;  %隐藏层units为5个
num_labels = 3;         %输出层为units3个
m = 5;                  %输入数据为5条

%初始化theta，调用debugInitializeWeights方法
Theta1 = debugInitializeWeights(hidden_layer_size,input_layer_size);
Theta2 = debugInitializeWeights(num_labels,hidden_layer_size);

X = debugInitializeWeights(m,input_layer_size-1);   %初始化X
y = 1+mod(1:m,num_labels)'; %初始化y

nn_params = [Theta1(:);Theta2(:)];

%% 梯度下降算法求grad

% 声明函数句柄为costFunc，p为待传入参数
costFunc = @(p)nnCostFunction(p,input_layer_size,hidden_layer_size,...
                              num_labels,X,y,lambda);
[cost,grad] = costFunc(nn_params);  %将初始化好的theta传进去

%% 使用梯度的定义求grad
numgrad = computeNumericalGradient(costFunc,nn_params); %这里使用了函数句柄costFunc作为参数


%% 显示结果及对比
disp([numgrad grad])

fprintf('上面的两列值应该非常接近，表示梯度没有问题。\n');
fprintf('（左边一列是计算的的梯度，右边是bp神经网络计算到的梯度）\n\n');

diff = norm(numgrad-grad)/norm(numgrad+grad);

fprintf(['如果bp计算正确，相对差会非常小\n'...
        '这里得到的相对差为：%g\n'],diff);
    
end

