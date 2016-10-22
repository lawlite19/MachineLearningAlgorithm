function [ mu sigma2 ] = estimateGaussian( X )
%	参数估计
%   即求均值和方差（这里不是使用样本方差）

%% 初始化变量
[m n] = size(X);
mu = zeros(n,1);    %列向量
sigma2 = zeros(n,1);%列向量

%% 计算均值和方差

mu = mean(X,1)';            %每列的均值，转置为列向量
sigma2 = ((m-1)*var(X)/m)'; %var(X)求每列的样本方差（即处理m-1），转为方差

end

