%% 支持向量机Support Vector Machines（SVM）主运行文件
%  分为3部分：
   %线性核函数
   %高斯核函数
   %高斯SVM中自动选择最优的C和sigma
%  有“@”符号的地方根据需要修改


%% 预处理
clear;close all;clc

%% 线性核函数

%作图，X=（x1,x2）
fprintf('可视化数据...');
load('data1.mat');
plotData(X,y);
fprintf('\n程序暂停，按任意键继续！\n');
pause;

%线性SVM
fprintf('\n训练 Linear SVM...\n');

C = 1;  %@根据需要修改，C越大，margin越大
model = svmTrain(X,y,C,@linearKernel,1e-3,20);  %调用SVM第三方函数库
plotBoundary(X,y,model,0);  % 0代表画线性决策边界
fprintf('\n程序暂停，按任意键继续！\n');
pause;

%% 高斯核函数

%作图，X=（x1,x2）
fprintf('可视化数据...');
load('data2.mat');
plotData(X,y);
fprintf('\n程序暂停，按任意键继续！\n');
pause;

%高斯SVM
C = 1;  %@根据需要修改，C越大，拟合的越好，high variance
sigma = 0.1;    %@根据需要修改，sigma越小，拟合越好
model = svmTrain(X,y,C,@(x1,x2)gaussianKernel(x1,x2,sigma));
plotBoundary(X,y,model,1);  %1代表画非线性决策边界
fprintf('\n程序暂停，按任意键继续！\n');
pause;


%% 高斯SVM中自动选择最优的C和sigma

%作图，X=（x1,x2）
fprintf('可视化数据...');
load('data3.mat');
plotData(X,y);
fprintf('\n程序暂停，按任意键继续！\n');
pause;

%选择最优的C和sigma
[C, sigma] = dataset3Params(X, y, Xval, yval);
model = svmTrain(X,y,C,@(x1,x2)gaussianKernel(x1,x2,sigma));
plotBoundary(X,y,model,1);  %1代表画非线性决策边界