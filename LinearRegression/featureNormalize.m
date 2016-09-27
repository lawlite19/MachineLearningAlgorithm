function [ X_norm mu sigma ] = featureNormalize( X )

%% 初始化所需变量
X_norm = X;
mu = zeros(1,size(X,2));    %X每列中位数，1行，X对应列数
sigma = zeros(1,size(X,2)); %X每列标准差，1行，X对应列数

%% 归一化X
mu = mean(X_norm);  %求每列的平均数
sigma = std(X_norm);%求每列的标准差
for i=1:size(X,2)   %遍历X的列
    X_norm(:,i) = (X_norm(:,i)-mu(i))./sigma(i);    %把i列每行的数据对应归一化
end

end

