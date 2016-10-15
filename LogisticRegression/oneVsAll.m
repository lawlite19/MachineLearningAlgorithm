function [ all_theta ] = oneVsAll( X,y,num_labels,lambda )
%	使用梯度下降法求出所有的theta值
%   逻辑回归多分类问题实质是求多个0-1分类问题，
        %将某个类和其他所有的类分离，所以若有3个类,则需要计算3个分类器
%% 初始化所需变量
m = size(X,1);  %数据行数
n = size(X,2);  %数据列数

all_theta = zeros(n+1,num_labels);  %theta是列矩阵，共有num_labels类，所以有num_labels列
X = [ones(m,1),X];  %X增加一列1

%% 梯度下降法求theta
class_y = zeros(m,num_labels);  %处理y，让其对应到0-1分类
for i = 1:num_labels    %遍历所有类别
    class_y(:,i)= y==i; %如果当前y==i，代表为1，否则为0
end
%下面是调用梯度下降的优化方法
initial_theta = zeros(n+1,1);
options = optimset('GradObj','on','MaxIter',50);

for i = 1:num_labels
    [all_theta(:,i)] = fmincg(@(t)(costFunctionReg(t,X,class_y(:,i),lambda)),...
                        initial_theta,options);
end

all_theta = all_theta';

end

