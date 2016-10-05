%% 逻辑回归算法主文件
%   使用正则化(regularization)方法
%   只有两个变量x1,x2
%   文件说明：有@符号的地方需要根据自己的需要进行修改

clear;close all;clc;

%% 加载数据
data = load('data2.txt');   %加载数据  @修改文件名
cols = size(data,2);
X = data(:,1:cols-1);
y = data(:,cols);

%% 作图
plotData(X,y);  %调用plotData函数画图

hold on;
xlabel('X1');
ylabel('X2');

legend('y = 1','y = 0');
hold off;

%% 正则化的逻辑回归准备工作（1、映射多项式 2、计算代价J和梯度的函数）

X = mapFeature(X(:,1),X(:,2));      %将x映射为多项式形式，返回多项式对应的数据   @关键，根据所需要的多项式调整，这里最高次为2次方

initial_theta = zeros(size(X,2),1); %初始化theta，与对应多项式项数一致
lambda = 1;                         %设置正则化参数为1    @根据需要调整

[cost,grad] = costFunctionReg(initial_theta,X,y,lambda);    %计算初始theta为0的代价函数J和对应的梯度

%输出一下
fprintf('初值theta为0的代价J为：%f\n',cost);

fprintf('程序暂停，按任意键继续！\n');
pause;

%% 正则化的逻辑回归(调用梯度下降的优化方法fminunc)

initial_theta = zeros(size(X,2),1); %初始化theta，与对应多项式项数一致
lambda = 1;                         %设置正则化参数为1    @根据需要调整
options = optimset('GradObj', 'on', 'MaxIter', 400);   %调用matlab中梯度下降的优化方法，对应的参数设置
[theta, J, exit_flag] = fminunc(@(t)(costFunctionReg(t, X, y, lambda)), initial_theta, options);

%% 画决策边界（decision boundary）

plotDecisionBoundary(theta,X,y);    %调用画决策边界的函数    @重要，修改函数中内容

hold on;
title(sprintf('lambda = %g',lambda));
xlabel('X1');
ylabel('X2');
legend('y = 1','y = 0','决策边界');
hold off;

%% 根据训练集判断预测精准度
p = predict(theta,X);       %调用预测的函数，根据训练集再根据假设函数预测

fprintf('训练精准度为(百分比)：%f\n',mean(double(p == y))*100);   %计算预测正确的百分比






