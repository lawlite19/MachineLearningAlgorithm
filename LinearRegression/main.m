%% 文件说明：有@符号的地方需要根据自己的需要进行修改



clear; close all;clc

%% 加载文件数据
fprintf('加载数据中 ...\n');
data = load('data.txt');        % @，文件名
cols = size(data,2);

X = data(:,1:cols-1);
y = data(:,cols);
m = length(y);  %数据条数（样本个数）

%% 打印一些数据，测试是否加载成功
fprintf('X矩阵前10行和前2列数据，以及y前10行数据为：\n');
fprintf(' x = [%f %f], y = %f \n', [X(1:10,:) y(1:10,:)]'); % @，X特征向量的列数可以多打印查看 
fprintf('程序暂停，按任意键继续执行！\n');
pause;

%% 缩放X变量中的值（归一化）
[X mu sigma] = featureNormalize(X);%注意，这里的X对应到函数里的X_norm

%% X的第一列左边增加一列
X = [ones(m,1) X];

%% 梯度下降算法
fprintf('执行梯度下降算法 ...\n');

alpha = 0.01;       % @ 学习速度，需要尝试改变，一般为0.01,0.03,0.1,0.3 ....
num_iters = 400;    % @ 迭代求解次数，尝试改变

theta = zeros(cols,1);
[theta,J_history] = gradientDescent(X,y,theta,alpha,num_iters);

%% 画代价函数J随迭代次数变化的图
figure;
plot(1:numel(J_history),J_history,'-b','LineWidth',2);
xlabel('迭代次数');
ylabel('代价函数J的值');

%% 打印梯度下降计算的结果theta
fprintf('\n梯度下降算法计算得到的theta值为')
fprintf(' %f \n',theta);



%% 学习完毕，求解到theta,根据数据预测（记住需要归一化**）
result = 0;

predict1 = [1650 3];     % @ ，要预测的信息，已知的X变量
norm_predict = (predict1-mu)./sigma;    %归一化
final_predict=[1 norm_predict];         %在第一列前补1

result = final_predict*theta;           %计算结果
fprintf('\n梯度下降算法预测值为：%f', result);

fprintf('\n程序暂停，按任意键继续执行！\n');
pause;

%% 正规方程求解theta（当数据量非常大时，只用梯度下降算法）

%% 加载文件数据
fprintf('加载数据中 ...\n');
data = load('data.txt');
cols = size(data,2);

X = data(:,1:cols-1);
y = data(:,cols);
m = length(y);  %数据条数（样本个数）
X = [ones(m,1) X];

%% 求解theta
theta = normalEquations(X,y);

fprintf('\n正规方程计算得到的theta值为\n')
fprintf(' %f \n',theta);

%% 学习完毕，求解到theta,根据数据预测（不需要归一化**）
result = 0;

predict2 = [1 1650 3];     % @ ，要预测的数据，已知的X变量

result = predict2*theta;   %计算结果
fprintf('\n正规方程求解预测值为：%f\n', result);
