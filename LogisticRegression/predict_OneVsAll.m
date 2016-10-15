function [ p ] = predict_OneVsAll( all_theta,X )
%	预测
%   此处显示详细说明

%% 初始化所需变量
m = size(X,1);
num_labels = size(all_theta,1);
p = zeros(size(X,1),1);
X = [ones(m,1),X];

h = sigmoid(X*all_theta');  %预测
[prob p] = max(h,[],2);     %返回每行的最大值和所在的列号，即最大的概率值和所在的列号，列号对应的就是最后的预测值

end

