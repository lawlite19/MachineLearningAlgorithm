%% 文件说明
%   逻辑回归的多分类问题
%   识别手写数字0-9
%   data_OneVsAll.mat是处理好的20*20像素点的5000条数据
%   如果要是使用此程序，请根据自己的需要修改有“@”注释的代码

%% 预处理
clear;close all;clc;

input_layer_size = 400;
num_labels = 10;

%% 加载数据
fprintf('加载数据中...\n');
load('data_OneVsAll.mat');  %   @修改文件名
m = size(X,1);  %行数，即记录数

%% 随机取几条数据将图像呈现出来
rand_indices = randperm(m);         %将1-m之间的数打乱
imgData = X(rand_indices(1:100),:); %取前100个数据     @根据需要修改

displayData_OneVsAll(imgData);      %调用显示数据函数

fprintf('程序暂停，按任意键继续\n');
pause;

%% 向量化的逻辑回归模型
fprintf('\n多分类的逻辑回归开始...\n');

lambda = 0.1;   %设置正则化的参数   @根据需要调整
[all_theta] = oneVsAll(X,y,num_labels,lambda);

fprintf('\n多分类逻辑回归计算结束，按任意键继续.\n');
pause;

%% 训练集的预测精准度
pred = predict_OneVsAll(all_theta,X);
fprintf('\n训练得到的精准度百分比为：%f\n',mean(double(pred == y))*100);

fprintf('程序暂停，按任意键继续\n');
pause;
%% 根据新的输入预测（这里还是使用训练集中的数据显示）
for i = 1:m
    fprintf('\n显示图片\n');
    displayData_OneVsAll(X(i, :));  %显示图片

    pred = predict_OneVsAll(all_theta,X(i,:));  %预测
    fprintf('\n预测值为: %d (预测对应的真实值为 %d)\n', pred, mod(pred, 10)); %真实值10映射到0，所以求余
    
    % Pause
    fprintf('程序暂停，按任意键继续\n');
    pause;
end
