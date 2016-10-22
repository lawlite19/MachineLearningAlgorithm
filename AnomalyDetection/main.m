%% 异常检测主程序
%   高斯分布

%% 预处理
clear;close all;clc
load('data1.mat');

%% 图像显示（二维数据）
figure();
plot(X(:,1),X(:,2),'bx');
axis([0 30 0 30]);      %@
xlabel('X1');
ylabel('X2');

fprintf('\n程序暂停，按任意键继续！\n');
pause;

%% 参数估计（均值和方差）

[mu sigma2] = estimateGaussian(X);

%% 多元高斯分布函数
p = multivariateGaussian(X,mu,sigma2);

%% 可视化拟合的边界
visualizeFit(X,mu,sigma2);

fprintf('\n程序暂停，按任意键继续！\n');
pause;

%% 选择异常点（在交叉验证机CV上训练得到最好的epsilon）

pval = multivariateGaussian(Xval,mu,sigma2);    %计算CV上的概率密度值
[epsilon F1] = selectThreshold(yval,pval);      %选择最优的epsilon临界值

fprintf('\n在CV上得到的最好的epsilon是：%e\n',epsilon);
fprintf('\n对应的F1Score值为：%f\n',F1);
fprintf('\n（epsilon的值应该为：8.99e-05）\n');

outliers = find(p < epsilon);

hold on
plot(X(outliers, 1), X(outliers, 2), 'ro', 'LineWidth', 2, 'MarkerSize', 10);
hold off












