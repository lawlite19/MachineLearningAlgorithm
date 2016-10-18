%% 使用之前逻辑回归中的数据使用SVM预测

data = load('data.txt');
X = data(:,(1:2));
y = data(:,3);

%% 高斯SVM
%作图，X=（x1,x2）
fprintf('可视化数据...');
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