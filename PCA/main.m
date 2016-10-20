%% 主成分分析PCA降维运行主程序

%  有“@”符号的位置根据需要修改


%% 预处理
clear;close all;clc

%% 二维降一维

% 显示数据
fprintf('可视化二维数据\n');
load('data1.mat');
plot(X(:, 1), X(:, 2), 'bo');
axis([0.5 6.5 2 8]); 
axis square;
fprintf('\n程序暂停，按任意键继续\n');
pause;
% PCA
fprintf('\n运行PCA...\n');

[X_norm,mu,sigma] = featureNormalize(X);    %归一化数据

[U S] = pca(X_norm);    %调用pca算法

hold on;
drawLine(mu, mu + 1.5 * S(1,1) * U(:,1)', '-k', 'LineWidth', 2);
drawLine(mu, mu + 1.5 * S(2,2) * U(:,2)', '-k', 'LineWidth', 2);
hold off;
fprintf('\n程序暂停，按任意键继续\n');
pause;
% 降维
fprintf('\n降维开始...\n');

plot(X_norm(:, 1), X_norm(:, 2), 'bo');
axis([-4 3 -4 3]); axis square

K = 1;
Z = projectData(X_norm, U, K);
fprintf('第一条数据的映射值为: %f\n', Z(1));
fprintf('\n(真实值应该为 -1.481274)\n\n');

% 恢复到原维度数据
X_rec  = recoverData(Z, U, K);
fprintf('\n恢复后的近似值为: %f %f\n', X_rec(1, 1), X_rec(1, 2));
fprintf('\n(计算的结果应该为：  -1.047419 -1.047419)\n\n');

% 作图（原数据和投影后的数据）
hold on;
plot(X_rec(:, 1), X_rec(:, 2), 'ro');
for i = 1:size(X_norm, 1)
    drawLine(X_norm(i,:), X_rec(i,:), '--k', 'LineWidth', 1);
end
hold off

fprintf('\n程序暂停，按任意键继续\n');
pause;

%% face图像数据降维

fprintf('\nLoading face dataset.\n\n');

load ('data_faces.mat')

%  显示100个数据
displayData(X(1:100, :));

fprintf('\n程序暂停，按任意键继续\n');
pause;

%% =========== Part 5: PCA on Face Data: Eigenfaces  ===================
%  Run PCA and visualize the eigenvectors which are in this case eigenfaces
%  We display the first 36 eigenfaces.
%
fprintf(['\n运行 PCA \n' ...
         '(请等待 ...)\n\n']);
[X_norm, mu, sigma] = featureNormalize(X);  %归一化数据

%  PCA
[U, S] = pca(X_norm);
displayData(U(:, 1:36)');   %显示36个数据
fprintf('\n程序暂停，按任意键继续\n');
pause;


%% ============= Part 6: Dimension Reduction for Faces =================
%  Project images to the eigen space using the top k eigenvectors 
%  If you are applying a machine learning algorithm 
fprintf('\n对face数据降维.\n\n');

K = 100;
Z = projectData(X_norm, U, K);

fprintf('投影后的Z向量大小为: ')
fprintf('%d ', size(Z));

fprintf('\n程序暂停，按任意键继续\n');
pause;

%% 显示降维后的face

fprintf('\n显示降维后的face.\n\n');

K = 100;
X_rec  = recoverData(Z, U, K);  %恢复数据

% 显示原先的faces
subplot(1, 2, 1);
displayData(X_norm(1:100,:));
title('原先的faces');
axis square;

% 显示降维后再恢复的faces
subplot(1, 2, 2);
displayData(X_rec(1:100,:));
title('恢复后的faces');
axis square;

