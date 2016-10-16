function p = predict( Theta1,Theta2,X )
%	预测训练集的精准度
%   正向传播

m = size(X,1);  %  数据量
num_labels = size(Theta2,1);    %输出类个数

p = zeros(size(X,1),1); 

h1 = sigmoid([ones(m,1) X]*Theta1');
h2 = sigmoid([ones(m,1) h1]*Theta2');

[dummy p] = max(h2,[],2);   %返回最后计算的每行的最大值即所在的列号（列号就对应数值）

end

