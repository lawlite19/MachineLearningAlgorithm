%% K-Mean算法主运行程序

%   有“@”字符的位置根据需要修改

%% 预处理
clear;close all;clc
load('data.mat');

%% 计算数据属于哪个类和重新计算类（单步）

% 计算每条数据数据哪个类
K = 3;  %类的总数，@
initial_centroids = [3 3;6 2;8 5];  %初始类的中心  @
idx = findClosestCentroids(X,initial_centroids);    %返回样本X分别属于哪个类

fprintf('前三条数据数据的类: \n')
fprintf(' %d', idx(1:3));

fprintf('\n每条数据属于哪个类计算完毕，按任意键继续！\n');
pause;

% 重新计算中心

centroids = computeCentroids(X,idx,K);
fprintf('\n重新计算中心为：\n');
fprintf(' %f %f \n' , centroids');

fprintf('重新计算中心结束完毕，按任意键继续！\n');
pause;

%% K-Means聚类过程演示（迭代计算）

fprintf('\n在测试数据上运行K-Means聚类算法...\n');
load('data.mat');

K = 3;
max_iters = 10;
initial_centroids = [3 3; 6 2; 8 5];
[centroids, idx] = runkMeans(X, initial_centroids, max_iters, true);
fprintf('\nK-Means运行结束，按任意键继续！\n');
pause;

%% K-Means聚类图片的像素点

fprintf('\nK-Mean聚类压缩图片...\n');
A = double(imread('bird.png')); %读取图片
A = A/255;  %像素值都约束在0-1之间

img_size = size(A); %A是一个三维矩阵,前两维为像素点位置，第三维为rgb值

X = reshape(A,img_size(1)*img_size(2),3);  %调整为N*3的矩阵，N是所有像素点个数

K = 16;     %将所有颜色分为16类，最后使用者16个颜色表示这个图形  @
max_iters = 10; %迭代计算10次  @
initial_centroids = kMeansInitCentroids(X, K);  %初始化类中心
[centroids, idx] = runkMeans(X, initial_centroids, max_iters);  %调用K-Mean聚类算法

fprintf('\nK-Means运行结束，按任意键继续！\n');
pause;

%% 压缩图片
fprintf('\n使用K-Means算法压缩图片...\n');

idx = findClosestCentroids(X, centroids);   % 每个像素点颜色属于哪个类
X_recovered = centroids(idx,:);             % 使用那个类别的像素点表示
X_recovered = reshape(X_recovered, img_size(1), img_size(2), 3);    %恢复图像矩阵

% 显示最初的图片
subplot(1, 2, 1);
imagesc(A);         %显示图像
title('原图像');

% 显示压缩后的图片
subplot(1, 2, 2);
imagesc(X_recovered)
title(sprintf('压缩图像 %d 个颜色表示.', K));



