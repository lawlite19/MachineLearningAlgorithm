%% 文件说明
%   逻辑回归的多分类问题
%   识别手写数字0-9
%   data_OneVsAll.mat是处理好的20*20像素点的5000条数据

%% 预处理
clear;close all;clc;

input_layer_size = 400;
num_labels = 10;

%% 加载数据
fprintf('加载数据中...\n');
load('data_OneVsAll.mat');
m = size(X,1);

%% 随机取几条数据将图像呈现出来
rand_indices = randperm(m);
imgData = X(rand_indices(1:100),:);

displayData_OneVsAll(imgData);

